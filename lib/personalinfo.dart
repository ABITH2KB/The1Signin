import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserDataScreen extends StatefulWidget {
  @override
  _UserDataScreenState createState() => _UserDataScreenState();
}

class _UserDataScreenState extends State<UserDataScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController adressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Data'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('users').orderBy('timestamp', descending: true).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          // Assuming at least one document is present in the collection
          var userData = snapshot.data!.docs.first.data() as Map<String, dynamic>;

          // Update TextEditingController values with data from Firestore
          nameController.text = userData['name'].toString();
          emailController.text = userData['email'].toString();
          phoneController.text = userData['phone'].toString();
          adressController.text = userData['address'].toString();

          return ListView(
            children: [
              TextField(
                controller: nameController,
                onChanged: (value) {

                  FirebaseFirestore.instance.collection('users').doc(snapshot.data!.docs.first.id).update({'name': value});
                },
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: emailController,
                onChanged: (value) {

                  FirebaseFirestore.instance.collection('users').doc(snapshot.data!.docs.first.id).update({'email': value});
                },
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: phoneController,
                onChanged: (value) {

                  FirebaseFirestore.instance.collection('users').doc(snapshot.data!.docs.first.id).update({'phone': value});
                },
                decoration: InputDecoration(labelText: 'Phone'),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller:adressController,
                onChanged: (value) {

                  FirebaseFirestore.instance.collection('users').doc(snapshot.data!.docs.first.id).update({'address': value});
                },
                decoration: InputDecoration(labelText: 'Address'),
              ),

            ],
          );
        },
      ),
    );
  }
}
