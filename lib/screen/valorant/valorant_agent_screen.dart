import 'package:belajar_api/screen/valorant/valorant_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ValorantAgenScreen extends StatefulWidget {
  const ValorantAgenScreen({super.key});

  @override
  State<ValorantAgenScreen> createState() => _ValorantAgenScreenState();
}

class _ValorantAgenScreenState extends State<ValorantAgenScreen> {
  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => setState(
        () {
          final viewModel =
              Provider.of<ValorantViewModel>(context, listen: false);
          viewModel.getAgentValorant();
        },
      ),
    );

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Valorant'),
        actions: [
          Consumer<ValorantViewModel>(
            builder: (context, viewModel, child) {
              return Row(
                children: [
                  TextButton(
                    onPressed: () {
                      viewModel.changeLanguage(language: 'en-US');
                    },
                    child: Text(
                      'EN',
                      style: TextStyle(
                        color: viewModel.defaultLanguage == "en-US"
                            ? Colors.green
                            : Colors.blue,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      viewModel.changeLanguage(language: 'id-ID');
                    },
                    child: Text(
                      'ID',
                      style: TextStyle(
                        color: viewModel.defaultLanguage == "id-ID"
                            ? Colors.green
                            : Colors.blue,
                      ),
                    ),
                  ),
                ],
              );
            },
          )
        ],
      ),
      body: Consumer<ValorantViewModel>(
        builder: (context, valorantViewModel, child) {
          return valorantViewModel.isLoadingAgentValorant == true
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: valorantViewModel.listAgentValorant.length,
                  itemBuilder: (context, index) {
                    var dataValorant =
                        valorantViewModel.listAgentValorant[index];
                    return ListTile(
                      leading: Text(
                        "${index + 1}",
                      ),
                      title: Text(
                        dataValorant.displayName ?? "-",
                      ),
                      subtitle: Text(
                        dataValorant.description ?? "-",
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
