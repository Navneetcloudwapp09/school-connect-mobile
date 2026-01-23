import 'package:flutter/material.dart';

class TeacherHomePage extends StatelessWidget {
  const TeacherHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FC),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 🔹 HEADER
              Row(
                children: [
                  const CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Welcome back, Sarah",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Monday, Oct 23 · Class Teacher - 10A",
                          style: TextStyle(color: Colors.grey, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.notifications_none),
                ],
              ),

              const SizedBox(height: 20),

              /// 🔹 STATS CARDS
              Row(
                children: [
                  _infoCard(
                    title: "05",
                    subtitle: "Today’s Classes",
                    footer: "3 Complete  2 Remaining",
                  ),
                  const SizedBox(width: 12),
                  _infoCard(
                    title: "Pending",
                    subtitle: "Attendance Status",
                    footer: "For Class 10A",
                  ),
                ],
              ),

              const SizedBox(height: 16),

              /// 🔹 MY CLASS
           /// 🔹 ASSIGNED SUBJECTS (NEW UI)
Container(
  padding: const EdgeInsets.all(16),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(14),
    border: Border.all(color: Colors.blue.shade200, width: 1.5),
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        "Assigned Subjects",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      const SizedBox(height: 4),
      const Text(
        "Manage your teaching assignment and mark entry",
        style: TextStyle(color: Colors.grey, fontSize: 13),
      ),
      const SizedBox(height: 16),

      _assignedSubjectItem(),
      _divider(),
      _assignedSubjectItem(),
      _divider(),
      _assignedSubjectItem(),
      _divider(),
      _assignedSubjectItem(),
    ],
  ),
),


              const SizedBox(height: 20),

              /// 🔹 ASSIGNED SUBJECTS
              Container(
                padding: const EdgeInsets.all(14),
                decoration: _cardDecoration(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Assigned Subjects",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      "Manage your teaching assignment and mark entry",
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                    const SizedBox(height: 12),

                    _subjectTile(),
                    _subjectTile(),
                    _subjectTile(),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// 🔹 TODAY’S CLASSES
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Today’s Classes",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xFFEFF4FF),
                    ),
                    child: const Text("Tuesday"),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              _classTile(),
              _classTile(),
              _classTile(),
            ],
          ),
        ),
      ),
    );
  }
  Widget _divider() {
  return Divider(
    color: Colors.blue.shade200,
    thickness: 1,
    height: 1,
  );
}

Widget _assignedSubjectItem() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEFF4FF),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      "10-A",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    "Mathematics",
                    style: TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Row(
                children: const [
                  Icon(Icons.person_outline,
                      size: 16, color: Colors.grey),
                  SizedBox(width: 4),
                  Text(
                    "28 Students",
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ],
              ),
            ],
          ),
        ),

        OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: Colors.blue.shade200),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          onPressed: () {},
          child: const Text("View Students"),
        ),
      ],
    ),
  );
}

  /// 🔹 REUSABLE WIDGETS

  Widget _infoCard({
    required String title,
    required String subtitle,
    required String footer,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: _cardDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(
              subtitle,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 6),
            Text(
              footer,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget _subjectTile() {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          Row(
            children: const [
              Chip(label: Text("10-A")),
              SizedBox(width: 8),
              Text(
                "Mathematics",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Spacer(),
              Icon(Icons.people, size: 18),
              SizedBox(width: 4),
              Text("28 Students"),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(child: _outlineButton("View Students")),
              const SizedBox(width: 10),
              Expanded(child: _outlineButton("Enter Marks")),
            ],
          ),
        ],
      ),
    );
  }

  Widget _classTile() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: _cardDecoration(),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Mathematics",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                ),
                SizedBox(height: 4),
                Text("8:00 - 8:30", style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xFFEFF4FF),
            ),
            child: const Text("Room 204"),
          ),
        ],
      ),
    );
  }

  Widget _primaryButton(String text) {
    return SizedBox(
      width: double.infinity,
      height: 44,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF0A1A3A),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {},
        child: Text(text),
      ),
    );
  }

  Widget _outlineButton(String text) {
    return SizedBox(
      height: 44,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {},
        child: Text(text),
      ),
    );
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
    );
  }
}
