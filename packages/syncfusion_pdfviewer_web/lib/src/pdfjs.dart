@JS()
library pdf.js;

import 'dart:js_interop';
import 'dart:typed_data';

import 'package:web/web.dart';

/// Represents the classes that are equivalent to the PDFJS classes,
/// to retrieve the information from the same.
@JS('pdfjsLib')
extension type PdfJs(JSObject _) implements JSObject {
  external static PdfJsDocLoader getDocument(Settings data);
}

@anonymous
@JS()
extension type Settings._(JSObject _) implements JSObject {
  external factory Settings({
    Uint8List? data,
    double? scale,
    CanvasRenderingContext2D? canvasContext,
    PdfJsViewport? viewport,
    num? annotationMode,
    double? offsetX,
    double? offsetY,
  });
}

@anonymous
@JS()
extension type PdfJsDocLoader(JSObject _) implements JSObject {
  external JSPromise<PdfJsDoc> get promise;
}

@anonymous
@JS()
extension type PdfJsDoc(JSObject _) implements JSObject {
  external JSPromise<PdfJsPage> getPage(int num);
  external int get numPages;
}

@anonymous
@JS()
extension type PdfJsPage(JSObject _) implements JSObject {
  external PdfJsViewport getViewport(Settings data);
  external PdfJsRender render(Settings data);
  external int get pageNumber;
  external List<num> get view;
}

@anonymous
@JS()
extension type PdfJsViewport(JSObject _) implements JSObject {
  external num get width;
  external num get height;
}

@anonymous
@JS()
extension type PdfJsRender(JSObject _) implements JSObject {
  external JSPromise<JSAny?> get promise;
}
