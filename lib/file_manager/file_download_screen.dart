import 'package:flutter/material.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

class FileDownloadScreen extends StatefulWidget {
  const FileDownloadScreen({Key? key}) : super(key: key);

  @override
  _FileDownloadScreenState createState() => _FileDownloadScreenState();
}

class _FileDownloadScreenState extends State<FileDownloadScreen> {
  String _filePath = "";

  Future<String> _getDevicePath() async {
    final _devicePath = await getApplicationDocumentsDirectory();
    return _devicePath.path;
  }

  Future<File> _localFile({String? path, String? type}) async {
    String _path = await _getDevicePath();
    var _newPath = await Directory("$_path/$path").create();
    return File("${_newPath.path}/oly.$type");
  }

  Future<void> _downloadSamplePDF() async {
    final _response = await http.get(Uri.parse("http://www.africau.edu/images/default/sample.pdf"));

    if (_response.statusCode == 200) {
      final _file = await _localFile(path: "oly", type: "pdf");
      final _savePDF = await _file.writeAsBytes(_response.bodyBytes);
      print("PDF Saved to ${_savePDF.path}");
      setState(() {
        _filePath = _savePDF.path;
      });
    } else {
      print(_response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton.icon(
              icon: Icon(Icons.file_download),
              label: Text("Download PDF"),
              onPressed: () {
                _downloadSamplePDF();
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Text(_filePath),
            ),
            TextButton.icon(
              icon: Icon(Icons.shop_two),
              label: Text("Open PDF"),
              onPressed: () async {
                final _openFile = await OpenFile.open(_filePath, type: "application/pdf");
                print(_openFile);
              },
            ),
          ],
        ),
      ),
    );
  }
}
