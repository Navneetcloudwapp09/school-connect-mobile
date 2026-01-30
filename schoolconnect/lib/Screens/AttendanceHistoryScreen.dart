import 'package:schoolconnect/export.dart';

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
      height: 25,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
      decoration: BoxDecoration(
        color: complete ? const Color(0xFFE8FBEE) : const Color(0xFFFFF6EA),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: complete ? const Color(0xFF16A34A) : const Color(0xFFF59E0B),
        ),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: complete ? const Color(0xFF16A34A) : const Color(0xFFF59E0B),
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _countPill(int p, int a, int l) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
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
              // height: 89,
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: MyColor.colorD7E3FC, width: 1.2),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.04),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        AppStrings.classTitle,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        AppStrings.classDate,
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                    ],
                  ),
                  Container(
                    height: 24,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: MyColor.colorD7E3FC, width: 1),
                    ),
                    child: Center(
                      child: const Text(
                        AppStrings.subjectScience,
                        style: TextStyle(
                          color: MyColor.myblack,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            hSized16,
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: MyColor.colorD7E3FC, width: 1.2),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.04),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      height: 85,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 18,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Recent Records',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Roboto',
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Select Date',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Icon(
                                    LucideIcons.calendar,
                                    color: Colors.grey,
                                    size: 15,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 2),
                          Text(
                            'last 7 Days attendance Summary',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(height: 12, color: Color(0xFFEAF1FF)),

                    Expanded(
                      child: ListView.separated(
                        itemCount: _records.length,
                        separatorBuilder: (context, index) =>
                            const Divider(height: 12, color: Color(0xFFEAF1FF)),
                        padding: const EdgeInsets.symmetric(vertical: 0),

                        itemBuilder: (context, index) {
                          final r = _records[index];
                          final status = r['status'] as String;
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 8,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            r['date'] as String,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),

                                          _statusPill(status),
                                        ],
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        r['day'] as String,
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          _countPill(
                                            r['present'] as int,
                                            r['absent'] as int,
                                            r['leave'] as int,
                                          ),
                                          const Icon(
                                            Icons.chevron_right,
                                            color: MyColor.color737373,
                                            size: 25,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
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
    );
  }
}
