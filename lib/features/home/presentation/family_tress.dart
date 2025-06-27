import 'package:flutter/material.dart';
import 'package:untitled/features/auth/domain/entity/head_auth_model.dart';

class LinkedToHeadInfoCard extends StatelessWidget {
  final HeadAuthModel head;

  const LinkedToHeadInfoCard({super.key, required this.head});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.green.withOpacity(0.5)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.link, color: Colors.green),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'This member will be automatically linked to the Family Head: ${head.name}',
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.green,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
