// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<UsuariosRecord?> dueulerFirebaseGetDocInRecord(
    DocumentReference? idrefusuario) async {
  // Add your function code here!

  return await FirebaseFirestore.instance
      .collection("usuarios")
      .doc(idrefusuario!.id)
      .get()
      .then((docUsuario) async {
    if (docUsuario.exists) {
      /* 
      ##########################################################
      veja como você criaria um novo usuario por aqui
      ##########################################################
      
      var usuariosRecordReference = UsuariosRecord.collection.doc();

      final usuariosCreateData = createUsuariosRecordData(
                          nome: 'euler'
                        );
      
      await usuariosRecordReference.set(usuariosCreateData);
      
      var novoUsuario = UsuariosRecord.getDocumentFromData(
                            usuariosCreateData, usuariosRecordReference);
      */

      //var getFirebaseUsuario = UsuariosRecord.getDocumentFromData(
      //    docUsuario.data()!, usuariosRecordReference);

      ///return getFirebaseUsuario;
      return null;
    } else {
      return null;
    }
  });
}
