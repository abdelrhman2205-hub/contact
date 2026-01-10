import 'package:contact/utils/app_assests.dart';
import 'package:contact/utils/app_colors.dart';
import 'package:flutter/material.dart';
import '../utils/contact.dart';
import '../widget/add_contact_bottom_sheet.dart';
import '../widget/contacts_list_widget.dart';
import 'package:lottie/lottie.dart';

class EmptyContactsWidget extends StatelessWidget {
  const EmptyContactsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/lottie/Address Book.json',
            width: 220,
            repeat: true,
          ),
          const SizedBox(height: 12),
          Text(
            'There is No Contacts Added Here',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Contact> contacts = [];

  void _openAddContactSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(16)),
      ),
      builder: (context) {
        return AddContactBottomSheet(
          onAdd: (Contact newContact) {
            setState(() {
              contacts.add(newContact);
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.darkBlue,
        title: Image.asset(AppAssets.route,height: 50,),
        ),
        body: contacts.isEmpty
          ? const EmptyContactsWidget()
          : ContactsListWidget(
      contacts: contacts,
      onDelete: (index) {
        setState(() {
          contacts.removeAt(index);
        });
      },
    ),

    floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'deleteAll',
            backgroundColor: Colors.red,
            onPressed: () {
              setState(() {
                contacts.clear();
              });
            },
            child: const Icon(Icons.delete),
          ),
          const SizedBox(height: 12),
          FloatingActionButton(
            heroTag: 'addContact',
            onPressed: _openAddContactSheet,
            child: const Icon(Icons.add),
          ),
        ],
      ),
        ),
    );
  }
}
