import 'dart:io';
import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/contact.dart';
import 'package:auto_size_text/auto_size_text.dart';
class ContactsListWidget extends StatelessWidget {
  final List<Contact> contacts;
  final Function(int) onDelete;
  const ContactsListWidget({super.key, required this.contacts, required this.onDelete});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(8.0),
      child: GridView.builder(
        itemCount: contacts.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 0.6,
        ),
        itemBuilder: (context, index) {
          final contact = contacts[index];

          return Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),

            ),
            clipBehavior: Clip.antiAlias,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // الصورة + الاسم
                Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: contact.imagePath != null
                              ? DecorationImage(
                            image: FileImage(File(contact.imagePath!)),
                            fit: BoxFit.cover,
                          )
                              : null,
                          color: Colors.grey[300],
                        ),
                        child: contact.imagePath == null
                            ? const Icon(Icons.person, size: 80, color: Colors.white)
                            : null,
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      left: 20,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 12,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: AutoSizeText(
                          contact.name,
                          maxLines: 1,
                          minFontSize: 10,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColor.darkBlue,
                          ),
                        ),

                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // الإيميل
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      Icon(Icons.email, size: 18,  color: AppColor.darkBlue,),
                      const SizedBox(width: 8),
                      Expanded(
                        child: AutoSizeText(
                          contact.email,
                          maxLines: 1,
                          minFontSize: 10,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColor.darkBlue,
                          ),
                        ),

                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 8),

                // التليفون
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      const Icon(Icons.phone, size: 18, color: AppColor.darkBlue),
                      const SizedBox(width: 8),
                      AutoSizeText(
                        contact.phone,
                        maxLines: 1,
                        minFontSize: 10,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColor.darkBlue,
                        ),
                      ),

                    ],
                  ),
                ),

                const SizedBox(height: 12),


                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.black12),
                    ),
                  ),
                  child: TextButton(
                    onPressed: () => onDelete(index),
                    style: TextButton.styleFrom(
                      foregroundColor: AppColor.white,
                      backgroundColor: AppColor.red,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.delete,
                          size: 20,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Delete',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          );

        },
      ),
    );
  }
}
