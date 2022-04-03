import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/utils/url_launcher.dart';

import '../providers/scan_list_provider.dart';

class HistoryUrlsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;

    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (_, index) => Dismissible(
        key: UniqueKey(),
        background: Container(
          child: Center(
            child: Text(
              'Deleted',
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
          ),
        ),
        onDismissed: (DismissDirection dismissDir) {
          Provider.of<ScanListProvider>(context, listen: false)
              .deleteById(scans[index].id!);
        },
        child: ListTile(
          leading: Icon(
            Icons.link_sharp,
            color: Theme.of(context).primaryColor,
          ),
          title: Text(scans[index].value),
          subtitle: Text(scans[index].id.toString()),
          trailing: Icon(Icons.keyboard_arrow_right_rounded),
          onTap: () => launchURL(context, scans[index]),
        ),
      ),
    );
  }
}
