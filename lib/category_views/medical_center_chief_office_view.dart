import 'package:flutter/material.dart';

class MedicalCenterChiefOfficeView extends StatefulWidget {
  final String? serviceType;
  const MedicalCenterChiefOfficeView({super.key, required this.serviceType});

  @override
  State<MedicalCenterChiefOfficeView> createState() =>
      _MedicalCenterChiefOfficeViewState();
}

class _MedicalCenterChiefOfficeViewState
    extends State<MedicalCenterChiefOfficeView> {
  String? opened;

  List<String> get services {
    return [
      'Office of the Medical Center Chief',
      'Public Information and Assistance',
      'Hospital Administration Inquiries',
    ];
  }

  @override
  Widget build(BuildContext context) {
    if (opened == null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _searchHeader(),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
            child: Text(
              widget.serviceType ?? 'External Services',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Category: Medical Center Chief Office',
              style: TextStyle(fontSize: 13, color: Colors.grey),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              children: services
                  .map((t) => _serviceButton(title: t))
                  .toList(),
            ),
          ),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _backHeader(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Handling and Resolution of Complaints filed with the PACD, 8888, PCC, and CCB and direct filing with the legal unit',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Text('put', style: TextStyle(fontSize: 14)),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _searchHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
        color: Color.fromARGB(255, 240, 248, 255),
      ),
      child: Row(
        children: [
          const Icon(Icons.search, color: Colors.grey),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Search services...',
              ),
              onChanged: (value) {
                setState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _backHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
        color: Color.fromARGB(255, 240, 248, 255),
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              setState(() {
                opened = null;
              });
            },
          ),
          const SizedBox(width: 4),
          const Text(
            'View',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _serviceButton({required String title}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 1,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          setState(() {
            opened = title;
          });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: const [
              Icon(Icons.picture_as_pdf, color: Colors.blue),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Handling and Resolution of Complaints filed with the PACD, 8888, PCC, and CCB and direct filing with the legal unit',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
              Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}

