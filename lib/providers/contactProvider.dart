// contact_provider.dart

import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';

class ContactProvider with ChangeNotifier {
  TextEditingController _textFieldController = TextEditingController();
  Contact _selectedContact = Contact(); // Initialize _selectedContact

  TextEditingController get textFieldController => _textFieldController;
  Contact get selectedContact => _selectedContact;

  Future<void> openContactPicker(BuildContext context) async {
    Iterable<Contact> contacts = await ContactsService.getContacts(
      withThumbnails: false,
      photoHighResolution: false,
    );

    if (contacts != null && contacts.isNotEmpty) {
      Contact contact = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text('Pick a contact'),
            children: contacts.map((Contact contact) {
              return SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, contact);
                },
                child: Text(contact.displayName ?? ''),
              );
            }).toList(),
          );
        },
      );

      if (contact != null) {
        _selectedContact = contact;
        _textFieldController.text = _formatContact(_selectedContact);
        notifyListeners();
      }
    }
  }

  String _formatContact(Contact contact) {
    if (contact != null) {
      return '${contact.displayName ?? ''} - ${contact.phones?.isNotEmpty == true ? contact.phones!.first.value : ''}';
    } else {
      return '';
    }
  }
}
