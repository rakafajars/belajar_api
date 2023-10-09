import 'package:belajar_api/screen/contact/contact_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final contactViewModel = context.read<ContactViewModel>();

    contactViewModel.getAllContact();
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Contact'),
        backgroundColor: Colors.red,
      ),
      body: Consumer<ContactViewModel>(
        builder: (context, valueViewModel, child) {
          if (valueViewModel.isLoadingContact == true) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (valueViewModel.contatcList == null) {
            return const Center(
              child: Text("Terjadi Kesalahan!"),
            );
          } else {
            return contactViewModel.contatcList?.isEmpty == true
                ? const Center(
                    child: Text(
                      'Contact Masih Kosong, Silahkan Tambahkan!',
                    ),
                  )
                : ListView.builder(
                    itemCount: contactViewModel.contatcList?.length,
                    itemBuilder: (context, int index) {
                      var data = contactViewModel.contatcList?[index];
                      return ListTile(
                        leading: Text("$index"),
                        title: Text(data?.name ?? ""),
                        subtitle: Text(data?.phone ?? ""),
                      );
                    },
                  );
          }
        },
      ),
    );
  }
}

// class ContactScreen extends StatefulWidget {
//   const ContactScreen({super.key});

//   @override
//   State<ContactScreen> createState() => _ContactScreenState();
// }

// class _ContactScreenState extends State<ContactScreen> {
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       Provider.of<ContactViewModel>(context, listen: false).getAllContact();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final contactViewModel = Provider.of<ContactViewModel>(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Contact List'),
//         backgroundColor: Colors.amber,
//       ),
//       body: contactViewModel.isLoadingContact == true
//           ? const Center(
//               child: CircularProgressIndicator(
//                 color: Colors.red,
//               ),
//             )
//           : ListView.builder(
//               itemCount: contactViewModel.contatcList.length,
//               itemBuilder: (context, int index) {
//                 var data = contactViewModel.contatcList[index];
//                 return ListTile(
//                   leading: Text("$index"),
//                   title: Text(data.name),
//                   subtitle: Text(data.phone),
//                 );
//               },
//             ),
//     );
//   }
// }
