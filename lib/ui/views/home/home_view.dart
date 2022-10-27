import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:ssc_97/models/user/user.dart';
import 'package:ssc_97/ui/layouts/home_layout_view.dart';
import 'package:ssc_97/ui/views/home/home_view_model.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) {
        return HomeLayoutView(
          selectedMenuIndex: 0,
          body: SafeArea(
            child: model.isBusy || model.dataLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView(
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 6, horizontal: 12),
                          child: TypeAheadField<User>(
                            textFieldConfiguration:
                                const TextFieldConfiguration(
                                    autofocus: true,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder())),
                            suggestionsCallback: (pattern) async {
                              model.filter(pattern);
                              return model.filteredUsers;
                            },
                            getImmediateSuggestions: false,
                            itemBuilder: (context, suggestion) {
                              return ListTile(
                                title: Text('No: ${suggestion.pNumber}'),
                                subtitle: Text(suggestion.name),
                              );
                            },
                            onSuggestionSelected: (suggestion) {
                              model.setMember(suggestion);
                            },
                          )),
                      model.currentUser != null
                          ? DataTable(
                              headingRowHeight: 8,
                              columns: const [
                                DataColumn(label: Text('')),
                                DataColumn(label: Text('')),
                              ],
                              rows: [
                                DataRow(cells: [
                                  const DataCell(Text(
                                    'Pre. No',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),
                                  DataCell(Text(
                                      model.currentUser!.pNumber.toString())),
                                ]),
                                DataRow(cells: [
                                  const DataCell(Text(
                                    'Name',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),
                                  DataCell(Text(model.currentUser!.name)),
                                ]),
                                DataRow(cells: [
                                  const DataCell(Text(
                                    'Phone',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),
                                  DataCell(Text(model.currentUser!.phone)),
                                ]),
                                DataRow(cells: [
                                  const DataCell(Text(
                                    'Email Address',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),
                                  DataCell(
                                      Text(model.currentUser!.email ?? 'N/A')),
                                ]),
                                DataRow(cells: [
                                  const DataCell(Text(
                                    'Blood Group',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),
                                  DataCell(Text(
                                      model.currentUser!.bloodGroup ?? 'N/A')),
                                ]),
                                DataRow(cells: [
                                  const DataCell(Text(
                                    'Current Location',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),
                                  DataCell(Text(
                                      model.currentUser!.location ?? 'N/A')),
                                ]),
                              ],
                            )
                          : Container()
                    ],
                  ),
          ),
        );
      },
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
