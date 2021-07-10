import 'package:permission_handler/permission_handler.dart';

class PermissionService {


  static Future<bool> getPermission() async {

    bool hasPermissionResponse = await hasPermission();
    print("hasPermissionResponse ===>>> ${hasPermissionResponse}");

    if(hasPermissionResponse==false){
      Map<Permission, PermissionStatus> permissionStatus = await [
        Permission.phone,
        Permission.contacts,
        Permission.storage,
      ].request();

      print("permissionStatus ===>>> ${permissionStatus}");
    }else{
      print("<<<===> All permission Granted ===>>>");
    }

    return true;
  }

  static Future<bool> hasPermission() async {
    var phonePermission = await Permission.phone.status;
    var contactsPermission = await Permission.contacts.status;
    var storagePermission = await Permission.storage.status;

    print("phonePermission ===>>> ${phonePermission}");
    print("contactsPermission ===>>> ${contactsPermission}");
    print("storagePermission ===>>> ${storagePermission}");


    bool result = phonePermission.isGranted && contactsPermission.isGranted && storagePermission.isGranted;

    print("result ===>>> ${result}");

    return result;
  }
}
