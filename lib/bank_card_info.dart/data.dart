import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

final cards = [
  BankCard(
    cardNumber: 1234567812345678,
    cvv: 456,
    expiresDate: DateTime(2020, 12),
    holderName: 'James Dennis',
    transactions: allTransactions.toList()..removeLast(),
    backgroundImageUrl:
        'https://besthqwallpapers.com/img/original/132329/blue-abstract-waves-4k-minimal-blue-wavy-background-material-design.jpg',
  ),
  BankCard(
    cardNumber: 1087654321098765,
    cvv: 295,
    expiresDate: DateTime(2021, 7),
    holderName: 'Paul Jeckson',
    transactions: allTransactions.toList()..removeAt(1),
    backgroundImageUrl: 'https://wallpaperaccess.com/full/1558939.jpg',
  ),
];

final allTransactions = [
  Transaction(
    name: 'Uber Premier',
    type: 'Transport',
    time: DateTime(2020, 1, 2, 8, 30),
    increase: false,
    sum: 8.75,
    logoUrl: 'https://cdn.iconscout.com/icon/free/png-256/uber-3-282340.png',
  ),
  Transaction(
    name: 'Vodafone',
    type: 'Phone',
    time: DateTime(2020, 1, 2, 10, 13),
    increase: false,
    sum: 58,
    logoUrl: 'https://telegraf.design/wp-content/uploads/2017/10/vodafone_icon-300x300.png',
  ),
  Transaction(
    name: 'Facebook',
    type: 'Salary',
    time: DateTime(2020, 1, 2, 12, 45),
    increase: true,
    sum: 7000,
    logoUrl: 'https://cdn1.iconfinder.com/data/icons/logotypes/32/square-facebook-512.png',
  ),
  Transaction(
    name: 'Foodpanda',
    type: 'Meal',
    time: DateTime(2020, 1, 2, 13, 30),
    increase: false,
    sum: 15.85,
    logoUrl: 'https://alternative.me/media/256/foodpanda-icon-f297q5g65ds2gn7v-c.png',
  ),
  Transaction(
    name: 'Citibank',
    type: 'Wire Transfer',
    time: DateTime(2020, 1, 1, 9, 39),
    increase: true,
    sum: 975.48,
    logoUrl:
        'https://lh3.googleusercontent.com/gb0QL9lUwKItMZ6b7Z-6DmdLaWpRy1VAk_I5EBpSk8CLXnDqzYS0vpSIqqdmkEixrmo=s180',
  ),
  Transaction(
    name: 'Uber Eats',
    type: 'Meal',
    time: DateTime(2020, 1, 1, 13, 49),
    increase: false,
    sum: 25,
    logoUrl: 'https://upload.wikimedia.org/wikipedia/commons/2/23/Uber_eats_logo_2017_06_22.jpg',
  ),
  Transaction(
    name: 'App Store',
    type: 'In App Purchase',
    time: DateTime(2020, 1, 1, 15, 28),
    increase: false,
    sum: 2.99,
    logoUrl: 'https://developer.apple.com/assets/elements/icons/app-store/app-store-128x128_2x.png',
  ),
  Transaction(
    name: 'Starbucks',
    type: 'Meal',
    time: DateTime(2020, 1, 1, 20, 45),
    increase: false,
    sum: 3.59,
    logoUrl:
        'https://i1.wp.com/www.logoworks.com/blog/wp-content/uploads/2017/06/Untitled-2.png?resize=640%2C360&ssl=1',
  ),
];

class Transaction {
  final String logoUrl;
  // phone, media, transport.
  final String type;
  final DateTime time;
  final bool increase;
  final double sum;
  final String name;
  final String prefix;

  Transaction({
    @required this.logoUrl,
    @required this.type,
    @required this.time,
    @required this.increase,
    @required this.sum,
    @required this.name,
    this.prefix = '\$',
  });
}

class BankCard {
  final String holderName;
  final DateTime expiresDate;
  final int cvv;
  final int cardNumber;
  final List<Transaction> transactions;
  final String backgroundImageUrl;

  const BankCard({
    @required this.holderName,
    @required this.expiresDate,
    @required this.cvv,
    @required this.cardNumber,
    @required this.transactions,
    @required this.backgroundImageUrl,
  });
}
