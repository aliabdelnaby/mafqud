import 'package:flutter/material.dart';
import 'package:mafqud/core/constants/constants.dart';
import 'package:mafqud/core/models/missing_person_model.dart';

class MissingCard extends StatelessWidget {
  const MissingCard({super.key, required this.person});
  final MissingPerson person;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      height: MediaQuery.sizeOf(context).height * 0.3,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          /// 🔹 Background Image
          Positioned.fill(
            child: Image.network(
              person.image,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) =>
                  Image.network(errorNetworkImage),
              filterQuality: FilterQuality.medium,
            ),
          ),

          /// 🔹 Dark overlay (left side)
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.38,
              color: Color(0xff333333).withValues(alpha: 0.87),
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    person.name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Age: ${person.age}",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(color: Colors.white70),
                  ),
                  SizedBox(height: 10),

                  Text(
                    "Gov: ${person.governorate}",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Last seen: ${person.lastSeen}",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
          ),

          /// 🔹 "Missing!" Label
          Positioned(
            top: 15,
            left: 10,
            child: Transform.rotate(
              angle: -0.4,
              child: const Text(
                "Missing !",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
