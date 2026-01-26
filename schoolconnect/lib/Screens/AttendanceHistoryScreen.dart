import 'package:flutter/material.dart';

class AttendanceHistoryScreen extends StatelessWidget {
  const AttendanceHistoryScreen({super.key});

  final List<Map<String, Object>> _records = const [
    {
      'date': 'Oct 24, 2025',
      'day': 'Tuesday',
      'present': 28,
      'absent': 28,
      'leave': 28,
      'status': 'Complete',
    },
    {
      'date': 'Oct 24, 2025',
      'day': 'Tuesday',
      'present': 28,
      'absent': 4,
      'leave': 0,
      'status': 'Complete',
    },
    {
      'date': 'Oct 24, 2025',
      'day': 'Tuesday',
      'present': 24,
      'absent': 5,
      'leave': 1,
      'status': 'Complete',
    },
    {
      'date': 'Oct 24, 2025',
      'day': 'Monday',
      'present': 0,
      'absent': 0,
      'leave': 0,
      'status': 'Incomplete',
    },
    {
      'date': 'Oct 24, 2025',
      'day': 'Tuesday',
      'present': 28,
      'absent': 28,
      'leave': 28,
      'status': 'Complete',
    },
  ];

  Widget _statusPill(String status) {
    final bool complete = status.toLowerCase() == 'complete';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: complete ? const Color(0xFFE8FBEE) : const Color(0xFFFFF6EA),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: complete ? const Color(0xFF16A34A) : const Color(0xFFF59E0B),
        ),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: complete ? const Color(0xFF16A34A) : const Color(0xFFF59E0B),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _countPill(int p, int a, int l) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF7FBFF),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFEAF1FF)),
      ),
      child: Row(
        children: [
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Color(0xFF16A34A),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 6),
              Text(p.toString().padLeft(2, '0')),
            ],
          ),
          const SizedBox(width: 12),
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Color(0xFFE30B5C),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 6),
              Text(a.toString().padLeft(2, '0')),
            ],
          ),
          const SizedBox(width: 12),
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Color(0xFFF59E0B),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 6),
              Text(l.toString().padLeft(2, '0')),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FC),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF4F7FC),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          'Attendance History',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline, color: Colors.grey),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: const Color(0xFFEAF1FF)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Class 10 - Section A',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        'Monday, Oct 23.',
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: const Color(0xFFEAF1FF)),
                    ),
                    child: const Text(
                      'Science',
                      style: TextStyle(
                        color: Color(0xFF3B6EF6),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: const Color(0xFFEAF1FF)),
                ),
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Recent Records',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'last 7 Days attendance Summary',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: const [
                            Text(
                              'Select Date',
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(width: 8),
                            Icon(Icons.calendar_today, color: Colors.grey),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    Expanded(
                      child: ListView.separated(
                        itemCount: _records.length,
                        separatorBuilder: (context, index) =>
                            const Divider(height: 12, color: Color(0xFFEAF1FF)),
                        itemBuilder: (context, index) {
                          final r = _records[index];
                          final status = r['status'] as String;
                          return ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 8,
                            ),
                            title: Text(
                              r['date'] as String,
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(top: 6),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    r['day'] as String,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  _countPill(
                                    r['present'] as int,
                                    r['absent'] as int,
                                    r['leave'] as int,
                                  ),
                                ],
                              ),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                _statusPill(status),
                                const SizedBox(width: 10),
                                const Icon(
                                  Icons.chevron_right,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                            onTap: () {},
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 8),
                    const Text(
                      'End of recent history. Detailed records available in reports',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
