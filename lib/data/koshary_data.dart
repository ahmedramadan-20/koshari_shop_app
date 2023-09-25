import 'package:flutter/material.dart';

import '../generated/assets.dart';
import '../models/koshary_model.dart';
import '../models/user_status.dart';

final List<Koushari> availablePlates = [
  Koushari(
    name: 'King',
    size: 'small',
    price: 40.00,
    image: Assets.koshary8,
  ),
  Koushari(
    name: 'Leader',
    size: 'medium',
    price: 50.00,
    image: Assets.koshary9,
  ),
  Koushari(
    name: 'Mafia',
    size: 'big',
    price: 650.00,
    image: Assets.koshary7,
  ),
  Koushari(
    name: 'Ghost',
    size: 'huge',
    price: 40.00,
    image: Assets.koshary4,
  ),
  Koushari(
    name: 'Qa\'ed',
    size: 'big',
    price: 60.00,
    image: Assets.koshary1,
  ),
  Koushari(
    name: 'za\'eim',
    size: 'bigger',
    price: 70.00,
    image: Assets.koshary3,
  ),
];

List<Koushari> cartItems = [];

final List<UserStatus> userStatus = [
  UserStatus(
    emoji: '😴',
    txt: 'Away',
    selectColor: const Color(0xff121212),
    unSelectColor: const Color(0xffbfbfbf),
  ),
  UserStatus(
    emoji: '😋',
    txt: 'Hungry',
    selectColor: const Color(0xff05a35c),
    unSelectColor: const Color(0xffCEEBD9),
  ),
  UserStatus(
    emoji: '🎮',
    txt: 'Gaming',
    selectColor: const Color(0xffFFD237),
    unSelectColor: const Color(0xffFDDFBB),
  ),
  UserStatus(
    emoji: '🤫',
    txt: 'busy',
    selectColor: const Color(0xffba3a3a),
    unSelectColor: const Color(0xffdb9797),
  ),
];

final List categories = [
  'Koushari',
  'Casserole',
];
final List featured = [
  'New',
  'Featured',
  'Upcoming',
];
