import 'package:flutter/material.dart';

import '../generated/assets.dart';
import '../models/koshary_model.dart';
import '../models/user_status.dart';

final List<Koushari> availablePlates = [
  Koushari(
    name: 'ElKing'.toUpperCase(),
    size: 'small'.toUpperCase(),
    price: 40.00,
    image: Assets.koshary8,
    color: const Color(0xffDE0106),
  ),
  Koushari(
    name: 'Leader'.toUpperCase(),
    size: 'medium'.toUpperCase(),
    price: 50.00,
    image: Assets.koshary2,
    color: const Color(0xff3F7943),
  ),
  Koushari(
    name: 'elMafia'.toUpperCase(),
    size: 'big'.toUpperCase(),
    price: 65.00,
    image: Assets.koshary7,
    color: const Color(0xffE66863),
  ),
  Koushari(
    name: 'Ghost'.toUpperCase(),
    size: 'huge'.toUpperCase(),
    price: 55.00,
    image: Assets.koshary4,
    color: const Color(0xff121212),
  ),
  Koushari(
    name: 'Qa\'ed'.toUpperCase(),
    size: 'more big'.toUpperCase(),
    price: 60.00,
    image: Assets.koshary1,
    color: const Color(0xff37376B),
  ),
  Koushari(
    name: 'za\'eim'.toUpperCase(),
    size: 'Very Big'.toUpperCase(),
    price: 70.00,
    image: Assets.koshary3,
    color: const Color(0xffdb9797),
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
  'Sweets',
  'drinks',
  'Water',
  'Salad',
];
final List featured = [
  'New',
  'Featured',
  'Upcoming',
];
