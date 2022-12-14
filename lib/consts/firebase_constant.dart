import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// FIREBASE INITIALIZATION
FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

/// COLLECTIONS
const userCollection = 'users';
const deliveryAddressCollection = 'Delivery Address';
const productCollection = 'products';
const cartCollection = 'carts';
const chatCollection = 'chats';
const messageCollection = 'messages';
const orderCollection = 'orders';
