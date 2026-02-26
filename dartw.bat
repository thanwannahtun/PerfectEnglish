@echo off
setlocal

REM Path to the Dart SDK inside your local Flutter SDK
set DART_SDK=C:\Users\thanwannahtun\dev\flutter_3_35_7\bin\cache\dart-sdk\bin\dart.exe

REM Pass all arguments to dart
"%DART_SDK%" %*
