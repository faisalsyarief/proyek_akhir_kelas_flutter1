import 'package:flutter/material.dart';

class WalletData {
  IconData icon;
  String label;
  String status;
  String desc;

  WalletData({
    required this.icon,
    required this.label,
    required this.status,
    required this.desc,
  });
}

var walletData = [
  WalletData(
      icon: Icons.phone_android,
      label: 'GoPay',
      status: 'Not Available',
      desc:
          'GoPay adalah salah satu e-wallet terpopuler di Indonesia yang dimiliki oleh perusahaan teknologi keuangan, GOTO. GoPay menyediakan berbagai layanan seperti pembayaran online, pembayaran tagihan, pembelian pulsa, pembayaran transportasi, hingga pembayaran di toko fisik. Gopay juga dapat digunakan untuk transfer uang antar pengguna GoPay lainnya.'),
  WalletData(
      icon: Icons.account_balance_wallet,
      label: 'OVO',
      status: 'Not Available',
      desc:
          'Aplikasi OVO yang merupakan aplikasi yang dikembangkan oleh Lippo Group dan SoftBank. Dalam perkembangannya OVO melakukan kolaborasi dengan berbagai brand lainnya seperti Grab dan Tokopedia. OVO merupakan salah satu e-wallet terkemuka sebagai pilihan di Indonesia yang menawarkan berbagai fitur untuk memudahkan pengguna dalam melakukan transaksi pembayaran, transfer uang, pembelian pulsa, dan lain sebagainya.'),
  WalletData(
      icon: Icons.account_balance,
      label: 'DANA',
      status: 'Not Available',
      desc:
          'DANA pertama kali hadir di Indonesia pada tahun 2018 dan merupakan pendatang baru dibanding dengan perusahaan lainnya. Berdasarkan data Riset iPrice Group, DANA berhasil naik satu peringkat di kuartal II 2019 menggeserkan LinkAja di posisi ketiga. DANA adalah salah satu e-wallet Indonesia yang banyak digunakan oleh masyarakat. DANA menawarkan berbagai kemudahan transaksi digital, seperti pembayaran tagihan, belanja online, transfer uang, dan pembelian pulsa dan paket data.'),
  WalletData(
      icon: Icons.link,
      label: 'LinkAja',
      status: 'Not Available',
      desc:
          'LinkAja merupakan penyedia jasa pembayaran berbasis server yang merupakan produk andalan dari PT Fintek Karya Nusantara (Finarya) dan telah terdaftar di Bank Indonesia. Sejak 21 Februari 2019, Finarya secara resmi telah mendapat lisensi atau izin dari Bank Indonesia sebagai Perusahaan Penerbit Uang Elektronik dan Penyelenggara Layanan Keuangan Digital Badan Hukum dengan Sistem Keamanan Informasi.'),
  WalletData(
      icon: Icons.shopping_bag,
      label: 'Shopee Pay',
      status: 'Not Available',
      desc:
          'Shopee Pay adalah e-wallet yang dikembangkan oleh Shopee, salah satu perusahaan e-commerce terbesar di Asia Tenggara. Shopee Pay menawarkan berbagai fitur dan kemudahan untuk melakukan transaksi digital, mulai dari pembayaran tagihan, belanja online, hingga transfer uang ke sesama pengguna Shopee Pay.'),
  WalletData(
      icon: Icons.security,
      label: 'DOKU',
      status: 'Not Available',
      desc:
          'DOKU adalah salah satu e-wallet Indonesia yang memungkinkan pengguna untuk melakukan pembayaran online dengan mudah dan aman. E-wallet ini menyediakan berbagai fitur, mulai dari pembayaran tagihan, transfer uang, hingga pembayaran online di berbagai merchant yang tergabung dengan DOKU.'),
  WalletData(
      icon: Icons.store,
      label: 'I-Saku',
      status: 'Not Available',
      desc:
          'I-Saku adalah salah satu e-wallet yang hadir di Indonesia dan memungkinkan pengguna untuk melakukan pembayaran dan transaksi digital secara mudah dan cepat. i.Saku menyediakan berbagai fitur, seperti pembayaran tagihan, pembelian voucher game, top up pulsa, dan transfer uang.'),
];
