import 'package:web/web.dart';

/// Checks whether focus node of pdf page view has primary focus.
bool hasPrimaryFocus = false;

/// Prevent default menu.
void preventDefaultMenu() {
  window.onKeyDown.listen((KeyboardEvent e) => _preventSpecificDefaultMenu(e));
  window.document.body?.onContextMenu
      .listen((MouseEvent e) => e.preventDefault());
}

/// Prevent specific default menu such as zoom panel,search.
void _preventSpecificDefaultMenu(KeyboardEvent e) {
  if (e.keyCode == 114 || (e.ctrlKey && e.keyCode == 70)) {
    e.preventDefault();
  }
  if (hasPrimaryFocus &&
      e.ctrlKey &&
      (e.keyCode == 48 || e.keyCode == 189 || e.keyCode == 187)) {
    e.preventDefault();
  }
}

/// Gets platform type.
String getPlatformType() {
  if (window.navigator.platform.toLowerCase().contains('macintel')) {
    return 'macos';
  }
  return window.navigator.platform.toLowerCase();
}
