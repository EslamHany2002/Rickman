import 'package:flutter/material.dart';

class UserProfileDataWidget extends StatelessWidget {
  bool isEn;

  UserProfileDataWidget({required this.isEn, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:30),
      child: Container(
        height: 190,
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
            // color: Colors.black54,
            borderRadius: BorderRadius.only(
          bottomLeft: isEn ? const Radius.circular(80) : const Radius.circular(0),
          bottomRight:
              isEn ? const Radius.circular(0) : const Radius.circular(80),
        )),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // user image
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: const Radius.circular(80),
                        bottomLeft: const Radius.circular(80),
                        topLeft: isEn
                            ? const Radius.circular(15)
                            : const Radius.circular(80),
                        topRight: isEn
                            ? const Radius.circular(80)
                            : const Radius.circular(15),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            offset: const Offset(0, 4),
                            blurRadius: 10)
                      ]),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomRight: const Radius.circular(80),
                      bottomLeft: const Radius.circular(80),
                      topLeft: isEn
                          ? const Radius.circular(15)
                          : const Radius.circular(15),
                      topRight: isEn
                          ? const Radius.circular(15)
                          : const Radius.circular(15),
                    ),
                    child: Image.asset(
                      "Assets/Images/me.jpg",
                      fit: BoxFit.cover,
                      width: 125,
                      height: 125,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            // user name , email and edit profile button
            const Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(),

                Text(
                  "Eslam",
                  style: TextStyle(
                    // color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                ),
                // Spacer(),
                FittedBox(
                    child: Text(
                  "eslamhanyriad@gmail.com",
                )),
                Spacer(),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
