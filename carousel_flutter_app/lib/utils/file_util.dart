import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

Future<File> file(String filename) async {
  Directory dir = await getApplicationDocumentsDirectory();
  String pathName = p.join(dir.path, filename);
  return File(pathName);
}

Future<File> downloadFileToStorage(String fileName, String url)  async {
  HttpClient client = new HttpClient();
  var _downloadData = List<int>();
  Directory dir = await  getApplicationDocumentsDirectory();
  String pathName = p.join(dir.path, fileName);
  File _fileSave = new File(pathName);
  client.getUrl(Uri.parse(url)).then((HttpClientRequest request) {
    return request.close();
  }).then((HttpClientResponse response) {
    response.listen((d) => _downloadData.addAll(d), onDone: () async {
     await _fileSave.writeAsBytes(_downloadData);
    });
  });
  if (_fileSave.exists() != null) {
    return _fileSave;
  }
}

File downloadFileUsePipe(String fileName, String url) {
  HttpClient client = new HttpClient();
  File fileSave = File(fileName);
  client.getUrl(Uri.parse(url)).then((HttpClientRequest request) {
    return request.close();
  }).then((HttpClientResponse response) async {
    response.pipe(fileSave.openWrite());
  });
  return fileSave;
}

//var myFile = await file("myFileName.png");

//Then, create the image:
//Image(image: NetworkToFileImage(url: "http://example.com/someFile.png", file: myFile))

//If you make debug: true it prints to the console whether the image was read from the file or fetched from the network:
//Image(image: NetworkToFileImage(url: "http://example.com/someFile.png", file: myFile, debug: true))

//You can set mock files. Please see methods:
//
//setMockFile(File file, Uint8List bytes)
//setMockUrl(String url, Uint8List bytes)
//clearMocks()
//clearMockFiles()
//clearMockUrls()
