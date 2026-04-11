import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// Manages the download-progress notification.
/// Android: real progress bar.
/// iOS: text-based percentage update (no native progress bar in UNUserNotifications).
class TtsDownloadNotificationService {
  TtsDownloadNotificationService._();

  static final TtsDownloadNotificationService instance =
      TtsDownloadNotificationService._();

  static const int _notifId = 88; // arbitrary unique ID
  static const String _channelId = 'tts_download';
  static const String _channelName = 'AI Voice Download';

  final _plugin = FlutterLocalNotificationsPlugin();
  bool _initialized = false;

  // ── Init (call once from main.dart) ──────────────────────────────────────

  Future<void> initialize() async {
    if (_initialized) return;

    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const ios = DarwinInitializationSettings(
      requestAlertPermission: false, // ask separately via permission_handler
      requestBadgePermission: false,
      requestSoundPermission: false,
    );
    await _plugin.initialize(
      const InitializationSettings(android: android, iOS: ios),
    );

    // Create the Android notification channel once
    await _plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(
          const AndroidNotificationChannel(
            _channelId,
            _channelName,
            description: 'Shows AI voice model download progress',
            importance: Importance.low, // low = no sound, no heads-up
            playSound: false,
            enableVibration: false,
          ),
        );

    _initialized = true;
  }

  /// Request notification permission (Android 13+, iOS).
  /// Call this before starting the download — ideally when user taps Download.
  Future<bool> requestPermission() async {
    final android = _plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();
    final granted = await android?.requestNotificationsPermission();
    return granted ?? true; // iOS/other: assume granted
  }

  // ── Show / update ─────────────────────────────────────────────────────────

  /// [progress] 0.0–1.0. Pass null for indeterminate (extraction phase).
  Future<void> showProgress({
    required double? progress,
    required String title,
    required String body,
  }) async {
    if (!_initialized) await initialize();

    final int progressInt = ((progress ?? 0) * 100).toInt().clamp(0, 100);
    final bool indeterminate = progress == null;

    final android = AndroidNotificationDetails(
      _channelId,
      _channelName,
      channelDescription: 'AI Voice model download',
      importance: Importance.low,
      priority: Priority.low,
      channelShowBadge: false,
      playSound: false,
      enableVibration: false,
      onlyAlertOnce: true,
      // ← critical: no sound/buzz on each update
      showProgress: true,
      maxProgress: 100,
      progress: progressInt,
      indeterminate: indeterminate,
      ongoing: true,
      // user cannot dismiss while downloading
      autoCancel: false,
    );

    // iOS has no progress bar — update body text with percentage instead
    final ios = DarwinNotificationDetails(
      presentSound: false,
      presentBadge: false,
      presentBanner: false,
      // silent update — don't pop up a banner
      presentList: true,
      // still visible in notification centre
      subtitle: body,
    );

    await _plugin.show(
      _notifId,
      title,
      body,
      NotificationDetails(android: android, iOS: ios),
    );
  }

  // ── Complete / error / cancel ─────────────────────────────────────────────

  Future<void> showComplete() async {
    if (!_initialized) return;

    final android = AndroidNotificationDetails(
      _channelId,
      _channelName,
      importance: Importance.defaultImportance,
      priority: Priority.defaultPriority,
      channelShowBadge: false,
      playSound: false,
      ongoing: false,
      autoCancel: true,
    );

    const ios = DarwinNotificationDetails(
      presentSound: false,
      presentBadge: false,
      presentBanner: true,
    );

    await _plugin.show(
      _notifId,
      '✅ AI Voice Ready',
      'Kokoro TTS is downloaded and ready to use.',
      NotificationDetails(android: android, iOS: ios),
    );
  }

  Future<void> showError(String message) async {
    if (!_initialized) return;

    final android = AndroidNotificationDetails(
      _channelId,
      _channelName,
      importance: Importance.high,
      priority: Priority.high,
      channelShowBadge: false,
      ongoing: false,
      autoCancel: true,
    );

    const ios = DarwinNotificationDetails(
      presentSound: true,
      presentBanner: true,
    );

    await _plugin.show(
      _notifId,
      '❌ Download Failed',
      message,
      NotificationDetails(android: android, iOS: ios),
    );
  }

  Future<void> cancel() async {
    await _plugin.cancel(_notifId);
  }
}
