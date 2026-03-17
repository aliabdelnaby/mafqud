import 'package:flutter/material.dart';
import 'package:mafqud/core/utils/assets.dart';

class MissingCard extends StatelessWidget {
  const MissingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      height: MediaQuery.sizeOf(context).height * 0.3,
      child: Stack(
        children: [
          /// 🔹 Background Image
          Positioned.fill(
            child: Image.asset(
              Assets.imagesMissingPersonImage,
              fit: BoxFit.cover,
            ),
          ),

          /// 🔹 Dark overlay (left side)
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.35,
              color: Color(0xff333333).withValues(alpha: 0.87),
              padding: const EdgeInsets.all(12),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      "Name",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Some description here",
                    style: TextStyle(color: Colors.white70),
                  ),
                  SizedBox(height: 10),

                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      "Name",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    "Some description here",
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
