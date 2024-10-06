import 'package:eco_grow/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Đăng ký với email và password
  Future<User?> signUpWithEmail(
      String email, String password, String userName) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;

      // Nếu đăng ký thành công, lưu thông tin người dùng vào Firestore
      if (user != null) {
        UserModel newUser =
            UserModel(id: user.uid, email: email, userName: userName);

        // Lưu vào Firestore
        await _firestore.collection('users').doc(user.uid).set(newUser.toMap());
      }

      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        print('The email is already in use.');
      } else if (e.code == 'invalid-email') {
        print('The email is invalid.');
      } else if (e.code == 'weak-password') {
        print('The password is too weak.');
      } else {
        print('Unknown error: ${e.message}');
      }
      return null;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Đăng nhập với email và password
  Future<User?> signInWithEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided.');
      } else {
        print('Unknown error: ${e.message}');
      }
      return null;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Đăng xuất
  Future<void> signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
