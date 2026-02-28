import 'package:flutter/material.dart';

final List<String> columns = [
  'Aspect',
  'Simple',
  'Continuous',
  'Perfect',
  'Perfect Continuous',
];

final List<Map<String, dynamic>> tenseMatrix = [
  {
    'time': 'Present (ပစ္စုပ္ပန်)',
    'color': Colors.blue,
    'cells': [
      {
        'title': 'Simple Present',
        'formula': 'S + V1 (s/es)',
        'example': 'I eat / He eats',
      },
      {
        'title': 'Present Continuous',
        'formula': 'S + am/is/are + V-ing',
        'example': 'I am eating',
      },
      {
        'title': 'Present Perfect',
        'formula': 'S + have/has + V3',
        'example': 'I have eaten',
      },
      {
        'title': 'Present Perfect Continuous',
        'formula': 'S + have/has + been + V-ing',
        'example': 'I have been eating',
      },
    ],
  },
  {
    'time': 'Past (အတိတ်)',
    'color': Colors.orange,
    'cells': [
      {'title': 'Simple Past', 'formula': 'S + V2', 'example': 'I ate'},
      {
        'title': 'Past Continuous',
        'formula': 'S + was/were + V-ing',
        'example': 'I was eating',
      },
      {
        'title': 'Past Perfect',
        'formula': 'S + had + V3',
        'example': 'I had eaten',
      },
      {
        'title': 'Past Perfect Continuous',
        'formula': 'S + had + been + V-ing',
        'example': 'I had been eating',
      },
    ],
  },
  {
    'time': 'Future (အနာဂတ်)',
    'color': Colors.green,
    'cells': [
      {
        'title': 'Simple Future',
        'formula': 'S + will + V1',
        'example': 'I will eat',
      },
      {
        'title': 'Future Continuous',
        'formula': 'S + will be + V-ing',
        'example': 'I will be eating',
      },
      {
        'title': 'Future Perfect',
        'formula': 'S + will have + V3',
        'example': 'I will have eaten',
      },
      {
        'title': 'Future Perfect Continuous',
        'formula': 'S + will have been + V-ing',
        'example': 'I will have been eating',
      },
    ],
  },
];

class TenseMatrixScreen extends StatelessWidget {
  const TenseMatrixScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tense Master Table",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: 16,
          horizontal: MediaQuery.sizeOf(context).width * 0.05,
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "💡 Swipe left/right to see all aspects. Tap a cell to study details.",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.grey,
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                dataRowColor: WidgetStateProperty.all(
                  Theme.of(context).colorScheme.onPrimary,
                ),
                headingTextStyle: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
                columnSpacing: 20,
                showCheckboxColumn: true,
                showBottomBorder: true,
                dataRowMinHeight: 60,
                dataRowMaxHeight: 60,
                headingRowColor: WidgetStateProperty.all(
                  Theme.of(context).colorScheme.onPrimary,
                ),
                border: TableBorder.all(color: Colors.grey.shade300),
                columns: columns
                    .map(
                      (col) => DataColumn(
                        columnWidth: IntrinsicColumnWidth(),
                        label: Text(
                          col,
                          // style: Theme.of(context).textTheme.titleMedium,
                          style: TextStyle(
                            color: Theme.of(
                              context,
                            ).colorScheme.onPrimaryContainer,
                          ),
                        ),
                      ),
                    )
                    .toList(),
                rows: tenseMatrix.map((row) {
                  return DataRow(
                    cells: [
                      // The "Time" Column
                      DataCell(
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            row['time'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: row['color'],
                            ),
                          ),
                        ),
                      ),
                      // The 4 Aspect Cells
                      ...(row['cells'] as List).map(
                        (cell) => DataCell(
                          GestureDetector(
                            onTap: () {
                              // Navigate to existing Detail Screen!
                            },
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.25,
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Text(
                                      cell['formula'],
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.deepOrange,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Expanded(
                                    child: Text(
                                      cell['example'],
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 30),
            _buildQuickLegend(context),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickLegend(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.onPrimary,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Advanced Grammar Keys:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const Divider(),
            _legendItem(
              Icons.bolt,
              "Continuous",
              "Always uses 'V-ing' (လုပ်ဆောင်နေဆဲ)",
            ),
            _legendItem(
              Icons.check_circle,
              "Perfect",
              "Always uses 'V3' (ပြီးစီးမှု)",
            ),
            _legendItem(Icons.update, "Future", "Always uses 'Will' (အနာဂတ်)"),
          ],
        ),
      ),
    );
  }

  Widget _legendItem(IconData icon, String title, String desc) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 18),
          const SizedBox(width: 8),
          Text("$title: ", style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(desc, style: const TextStyle(fontSize: 13)),
        ],
      ),
    );
  }
}
