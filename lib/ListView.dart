// ignore_for_file: deprecated_member_use

import 'package:iSikhi/ReadPath.dart';
import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class MyListViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Read Gurbaani'),
        backgroundColor: Color(0xFF303030),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          buildListTile('Jap Ji Sahib', 'https://gurbaninow.com/gutka/1',
              context, 'ਜਪੁ ਜੀ ਸਾਹਿਬ'),
          buildListTile('Jaap Sahib', 'https://gurbaninow.com/gutka/2', context,
              'ਜਾਪੁ ਸਾਹਿਬ'),
          buildListTile('Tav Prasad Savaiye', 'https://gurbaninow.com/gutka/3',
              context, 'ਤ੍ਵ ਪ੍ਰਸਾਦਿ ਸਵਯੇ (ਸ੍ਰਾਵਗ ਸੁਧ)'),
          buildListTile('Benti Chaupai Sahib', 'https://gurbaninow.com/gutka/4',
              context, 'ਬੇਨਤੀ ਚੌਪਈ ਸਾਹਿਬ'),
          buildListTile('Anand Sahib', 'https://gurbaninow.com/gutka/5',
              context, 'ਅਨੰਦੁ ਸਾਹਿਬ'),
          buildListTile('So Dar Rehras Sahib', 'https://gurbaninow.com/gutka/6',
              context, 'ਸੋ ਦਰੁ ਰਹਰਾਸਿ ਸਾਹਿਬ'),
          buildListTile(
              'Ardaas', 'https://gurbaninow.com/gutka/7', context, 'ਅਰਦਾਸ'),
          buildListTile('Sohila Sahib', 'https://gurbaninow.com/gutka/8',
              context, 'ਸੋਹਿਲਾ ਸਾਹਿਬ'),
          buildListTile('Shabad Hazare', 'https://gurbaninow.com/gutka/9',
              context, 'ਸ਼ਬਦ ਹਜ਼ਾਰੇ'),
          buildListTile(
              'Shabad Hazare Patshahi 10',
              'https://gurbaninow.com/gutka/10',
              context,
              'ਸ਼ਬਦ ਹਜ਼ਾਰੇ ਪਾਤਿਸ਼ਾਹੀ ੧੦'),
          buildListTile(
              'Tav Prasad Savaiye (Deenan Ki)',
              'https://gurbaninow.com/gutka/11',
              context,
              'ਤ੍ਵ ਪ੍ਰਸਾਦਿ ਸ੍ਵਯੇ (ਦੀਨਨ ਕੀ)'),
          buildListTile(
              'Tav Prasad Chaupai (Pranvo Aadi)',
              'https://gurbaninow.com/gutka/12',
              context,
              'ਤ੍ਵ ਪ੍ਰਸਾਦਿ ਚੌਪਈ (ਪ੍ਰਣਵੋ ਆਦਿ)'),
          buildListTile(
              'Aarti', 'https://gurbaninow.com/gutka/13', context, 'ਆਰਤੀ'),
          buildListTile('Rakhyia De Shabad', 'https://gurbaninow.com/gutka/14',
              context, 'ਰੱਖਿਆ ਦੇ ਸ਼ਬਦ'),
          buildListTile('Barah Maha Fifth Mehl',
              'https://gurbaninow.com/gutka/15', context, 'ਬਾਰਹ ਮਾਹਾ ਮਹਲਾ ੫'),
          buildListTile('Basant Ki Var', 'https://gurbaninow.com/gutka/16',
              context, 'ਬਸੰਤ ਕੀ ਵਾਰ'),
          buildListTile('Bavan Akhri', 'https://gurbaninow.com/gutka/17',
              context, 'ਬਾਵਨ ਅਖਰੀ'),
          buildListTile('Sukhmani Sahib', 'https://gurbaninow.com/gutka/18',
              context, 'ਸੁਖਮਨੀ ਸਾਹਿਬ'),
          buildListTile(
              'Aasaa Ki Var (With Chhants)',
              'https://gurbaninow.com/gutka/19',
              context,
              'ਆਸਾ ਕੀ ਵਾਰ (ਛੰਤਾਂ ਸਮੇਤ)'),
          buildListTile(
              'Oankaar', 'https://gurbaninow.com/gutka/20', context, 'ਓਅੰਕਾਰੁ'),
          buildListTile('Sidh Gosht', 'https://gurbaninow.com/gutka/21',
              context, 'ਸਿਧ ਗੋਸਟਿ'),
          buildListTile('Sukhmana Sahib', 'https://gurbaninow.com/gutka/22',
              context, 'ਸੁਖਮਨਾ ਸਾਹਿਬ'),
          buildListTile('Dukh Bhanjani Sahib',
              'https://gurbaninow.com/gutka/23', context, 'ਦੁਖ ਭੰਜਨੀ ਸਾਹਿਬ'),
          buildListTile('Bani Mehla 9', 'https://gurbaninow.com/gutka/24',
              context, 'ਬਾਣੀ ਮਹਲਾ ੯'),
          buildListTile(
              'Pehray', 'https://gurbaninow.com/gutka/25', context, 'ਪਹਰੇ'),
          buildListTile('Vanajaaraa', 'https://gurbaninow.com/gutka/26',
              context, 'ਵਣਜਾਰਾ'),
          buildListTile('Din Raiyn', 'https://gurbaninow.com/gutka/27', context,
              'ਦਿਨ ਰੈਣਿ'),
          buildListTile(
              'Karhalay', 'https://gurbaninow.com/gutka/28', context, 'ਕਰਹਲੇ'),
          buildListTile('T,hitee Fifth Mehl', 'https://gurbaninow.com/gutka/29',
              context, 'ਥਿਤੀ ਮਹਲਾ ੫'),
          buildListTile(
              'Baawan Akhree Of Kabeer Jee',
              'https://gurbaninow.com/gutka/30',
              context,
              'ਬਾਵਨ ਅਖਰੀ ਕਬੀਰ ਜੀ ਕੀ'),
          buildListTile('T,hitee Of Kabeer Jee',
              'https://gurbaninow.com/gutka/31', context, 'ਥਿਤੰੀ ਕਬੀਰ ਜੀ ਕੰੀ'),
          buildListTile('The Seven Days Of Kabeer Jee',
              'https://gurbaninow.com/gutka/32', context, 'ਵਾਰ ਸਤ ਕਬੀਰ ਜੀ ਕੀ'),
          buildListTile('Birharray', 'https://gurbaninow.com/gutka/33', context,
              'ਬਿਰਹੜੇ'),
          buildListTile('Patee First Mehl', 'https://gurbaninow.com/gutka/34',
              context, 'ਪਟੀ ਮਹਲਾ ੧'),
          buildListTile('Patee Third Mehl', 'https://gurbaninow.com/gutka/35',
              context, 'ਪਟੀ ਮਹਲਾ ੩'),
          buildListTile(
              'Ghorees', 'https://gurbaninow.com/gutka/36', context, 'ਘੋੜੀਆ'),
          buildListTile(
              'Alahnia', 'https://gurbaninow.com/gutka/37', context, 'ਅਲਾਹਣੀਆ'),
          buildListTile(
              'Kuchajee, Suchajee, Gunvantee',
              'https://gurbaninow.com/gutka/38',
              context,
              'ਕੁਚਜੀ, ਸੁਚਜੀ, ਗੁਣਵੰਤੀ'),
          buildListTile(
              'Lavan', 'https://gurbaninow.com/gutka/39', context, 'ਲਾਵਾਂ'),
          buildListTile('T,hitee First Mehl', 'https://gurbaninow.com/gutka/40',
              context, 'ਥਿਤੀ ਮਹਲਾ ੧'),
          buildListTile('The Seven Days First Mehl',
              'https://gurbaninow.com/gutka/41', context, 'ਵਾਰ ਸਤ ਮਹਲਾ ੩'),
          buildListTile(
              'Sadd', 'https://gurbaninow.com/gutka/42', context, 'ਸਦੁ'),
          buildListTile('Ruti ~ The Seasons', 'https://gurbaninow.com/gutka/43',
              context, 'ਰੁਤੀ'),
          buildListTile('Anjulees ~ With Hands Cupped In Prayer',
              'https://gurbaninow.com/gutka/44', context, 'ਅੰਜੁਲੀਆ'),
          buildListTile('Solahas First Mehl', 'https://gurbaninow.com/gutka/45',
              context, 'ਸੋਲਹੇ ਮਹਲਾ ੧'),
          buildListTile('Solahas Third Mehl', 'https://gurbaninow.com/gutka/46',
              context, 'ਸੋਲਹੇ ਮਹਲਾ ੩'),
          buildListTile('Solahas Fourth Mehl',
              'https://gurbaninow.com/gutka/47', context, 'ਸੋਲਹੇ ਮਹਲਾ ੪'),
          buildListTile('Solahas Fifth Mehl', 'https://gurbaninow.com/gutka/48',
              context, 'ਸੋਲਹੇ ਮਹਲਾ ੪'),
          buildListTile('Barah Maha First Mehl',
              'https://gurbaninow.com/gutka/49', context, 'ਬਾਰਹ ਮਾਹਾ ਮਹਲਾ ੧'),
          buildListTile(
              'Salok Sehaskriti First Mehl',
              'https://gurbaninow.com/gutka/50',
              context,
              'ਸਲੋਕ ਸਹਸਕ੍ਰਿਤੀ ਮਹਲਾ ੧'),
          buildListTile(
              'Salok Sehaskriti Fifth Mehl',
              'https://gurbaninow.com/gutka/51',
              context,
              'ਸਲੋਕ ਸਹਸਕ੍ਰਿਤੀ ਮਹਲਾ ੫'),
          buildListTile(
              'Gaat,haa', 'https://gurbaninow.com/gutka/52', context, 'ਗਾਥਾ'),
          buildListTile(
              'Phunhay', 'https://gurbaninow.com/gutka/53', context, 'ਫੁਨਹੇ'),
          buildListTile('Chaubolas', 'https://gurbaninow.com/gutka/54', context,
              'ਚਉਬੋਲੇ'),
          buildListTile('Saloks First Mehl', 'https://gurbaninow.com/gutka/55',
              context, 'ਸਲੋਕ ਮਹਲਾ ੧'),
          buildListTile('Saloks Third Mehl', 'https://gurbaninow.com/gutka/56',
              context, 'ਸਲੋਕ ਮਹਲਾ ੩'),
          buildListTile('Saloks Fourth Mehl', 'https://gurbaninow.com/gutka/57',
              context, 'ਸਲੋਕ ਮਹਲਾ ੪'),
          buildListTile('Saloks Fifth Mehl', 'https://gurbaninow.com/gutka/58',
              context, 'ਸਲੋਕ ਮਹਲਾ ੫'),
          buildListTile('Salok Mehla 9', 'https://gurbaninow.com/gutka/59',
              context, 'ਸਲੋਕ ਮਹਲਾ ੯'),
          buildListTile('Akal Ustat', 'https://gurbaninow.com/gutka/60',
              context, 'ਅਕਾਲ ਉਸਤਤਿ'),
          buildListTile('Bachittar Natak', 'https://gurbaninow.com/gutka/61',
              context, 'ਬਚਿਤ੍ਰ ਨਾਟਕ'),
          buildListTile(
              'Chandi Charittar Ukat Bilas',
              'https://gurbaninow.com/gutka/62',
              context,
              'ਚੰਡੀ ਚਰਿਤ੍ਰ ਉਕਤਿ ਬਿਲਾਸ'),
          buildListTile('Chandi Charittar', 'https://gurbaninow.com/gutka/63',
              context, 'ਚੰਡੀ ਚਰਿਤ੍ਰ'),
          buildListTile(
              'Vaar Sri Bhagauti Ji Ki',
              'https://gurbaninow.com/gutka/64',
              context,
              'ਵਾਰ ਸ੍ਰੀ ਭਗਉਤੀ ਜੀ ਕੀ'),
          buildListTile('Gyan Prabodh', 'https://gurbaninow.com/gutka/65',
              context, 'ਗਿਆਨ ਪ੍ਰਬੋਧ'),
          buildListTile('33 Svaiyay', 'https://gurbaninow.com/gutka/66',
              context, '੩੩ ਸਵਯੇ'),
          buildListTile('Khalsa Mahima', 'https://gurbaninow.com/gutka/67',
              context, 'ਖ਼ਾਲਸਾ ਮਹਿਮਾ'),
          buildListTile(
              'Raag Siree Raag Ki Vaar',
              'https://gurbaninow.com/gutka/68',
              context,
              'ਰਾਗੁ ਸਿਰੀਰਾਗੁ ਕੀ ਵਾਰ'),
          buildListTile('Raag Maajh Ki Vaar', 'https://gurbaninow.com/gutka/69',
              context, 'ਰਾਗੁ ਮਾਝ ਕੀ ਵਾਰ'),
          buildListTile(
              'Raag Gauree Ki Vaar Fourth Mehl',
              'https://gurbaninow.com/gutka/70',
              context,
              'ਰਾਗੁ ਗਉੜੀ ਕੀ ਵਾਰ ਮਹਲਾ ੪'),
          buildListTile(
              'Raag Gauree Ki Vaar Fifth Mehl',
              'https://gurbaninow.com/gutka/71',
              context,
              'ਰਾਗੁ ਗਉੜੀ ਕੀ ਵਾਰ ਮਹਲਾ ੫'),
          buildListTile('Raag Aasaa Ki Var', 'https://gurbaninow.com/gutka/72',
              context, 'ਰਾਗੁ ਆਸਾ ਕੀ ਵਾਰ'),
          buildListTile(
              'Raag Goojaree Ki Vaar Third Mehl',
              'https://gurbaninow.com/gutka/73',
              context,
              'ਰਾਗੁ ਗੂਜਰੀ ਕੀ ਵਾਰ ਮਹਲਾ ੩'),
          buildListTile(
              'Raag Goojaree Ki Vaar Fifth Mehl',
              'https://gurbaninow.com/gutka/74',
              context,
              'ਰਾਗੁ ਗੂਜਰੀ ਕੀ ਵਾਰ ਮਹਲਾ ੫'),
          buildListTile(
              'Raag Bihaagraa Ki Vaar',
              'https://gurbaninow.com/gutka/75',
              context,
              'ਰਾਗੁ ਬਿਹਾਗੜੇ ਕੀ ਵਾਰ'),
          buildListTile('Raag Wadahans Ki Vaar',
              'https://gurbaninow.com/gutka/76', context, 'ਰਾਗੁ ਵਡਹੰਸ ਕੀ ਵਾਰ'),
          buildListTile('Raag Sorat,h Ki Vaar',
              'https://gurbaninow.com/gutka/77', context, 'ਰਾਗੁ ਸੋਰਠਿ ਕੀ ਵਾਰ'),
          buildListTile('Raag Jaitsree Ki Vaar',
              'https://gurbaninow.com/gutka/78', context, 'ਰਾਗੁ ਜੈਤਸਰੀ ਕੀ ਵਾਰ'),
          buildListTile('Raag Soohee Ki Vaar',
              'https://gurbaninow.com/gutka/79', context, 'ਰਾਗੁ ਸੂਹੀ ਕੀ ਵਾਰ'),
          buildListTile('Raag Bilaaval Ki Vaar',
              'https://gurbaninow.com/gutka/80', context, 'ਰਾਗੁ ਬਿਲਾਵਲ ਕੀ ਵਾਰ'),
          buildListTile(
              'Raag Raamkalee Ki Vaar Third Mehl',
              'https://gurbaninow.com/gutka/81',
              context,
              'ਰਾਗੁ ਰਾਮਕਲੀ ਕੀ ਵਾਰ ਮਹਲਾ ੩'),
          buildListTile(
              'Raag Raamkalee Ki Vaar Fifth Mehl',
              'https://gurbaninow.com/gutka/82',
              context,
              'ਰਾਗੁ ਰਾਮਕਲੀ ਕੀ ਵਾਰ ਮਹਲਾ ੫'),
          buildListTile(
              'Raag Raamkalee Ki Vaar Rai Balwand and Satta Doom',
              'https://gurbaninow.com/gutka/83',
              context,
              'ਰਾਗੁ ਰਾਮਕਲੀ ਕੀ ਵਾਰ ਰਾਇ ਬਲਵੰਡਿ ਤਥਾ ਸਤੈ ਡੂਮਿ ਆਖੀ'),
          buildListTile(
              'Raag Maaroo Ki Vaar Third Mehl',
              'https://gurbaninow.com/gutka/84',
              context,
              'ਰਾਗੁ ਮਾਰੂ ਕੀ ਵਾਰ ਮਹਲਾ ੩'),
          buildListTile(
              'Raag Maaroo Ki Vaar Fifth Mehl',
              'https://gurbaninow.com/gutka/85',
              context,
              'ਰਾਗੁ ਮਾਰੂ ਕੀ ਵਾਰ ਮਹਲਾ ੫'),
          buildListTile('Raag Basant Ki Var', 'https://gurbaninow.com/gutka/86',
              context, 'ਰਾਗੁ ਬਸੰਤ ਕੀ ਵਾਰ'),
          buildListTile('Raag Saarang Ki Vaar',
              'https://gurbaninow.com/gutka/87', context, 'ਰਾਗੁ ਸਾਰੰਗ ਕੀ ਵਾਰ'),
          buildListTile('Raag Malaar Ki Vaar',
              'https://gurbaninow.com/gutka/88', context, 'ਰਾਗੁ ਮਲਾਰ ਕੀ ਵਾਰ'),
          buildListTile('Raag Kaanraa Ki Vaar',
              'https://gurbaninow.com/gutka/89', context, 'ਰਾਗੁ ਕਾਨੜੇ ਕੀ ਵਾਰ'),
          buildListTile('Raag Siree Raag', 'https://gurbaninow.com/gutka/90',
              context, 'ਰਾਗੁ ਸਿਰੀਰਾਗੁ'),
          buildListTile('Raag Gauree', 'https://gurbaninow.com/gutka/91',
              context, 'ਰਾਗੁ ਗਉੜੀ'),
          buildListTile('Raag Aasaa', 'https://gurbaninow.com/gutka/92',
              context, 'ਰਾਗੁ ਆਸਾ'),
          buildListTile('Raag Goojaree', 'https://gurbaninow.com/gutka/93',
              context, 'ਰਾਗੁ ਗੂਜਰੀ'),
          buildListTile('Raag Sorat,h', 'https://gurbaninow.com/gutka/94',
              context, 'ਰਾਗੁ ਸੋਰਠਿ'),
          buildListTile('Raag Dhanaasaree', 'https://gurbaninow.com/gutka/95',
              context, 'ਰਾਗੁ ਧਨਾਸਰੀ'),
          buildListTile('Raag Jaitsree', 'https://gurbaninow.com/gutka/96',
              context, 'ਰਾਗੁ ਜੈਤਸਰੀ'),
          buildListTile('Raag Todee', 'https://gurbaninow.com/gutka/97',
              context, 'ਰਾਗੁ ਟੋਡੀ'),
          buildListTile('Raag Tilang', 'https://gurbaninow.com/gutka/98',
              context, 'ਰਾਗੁ ਤਿਲੰਗ'),
          buildListTile('Raag Soohee', 'https://gurbaninow.com/gutka/99',
              context, 'ਰਾਗੁ ਸੂਹੀ'),
          buildListTile('Raag Bilaaval', 'https://gurbaninow.com/gutka/100',
              context, 'ਰਾਗੁ ਬਿਲਾਵਲੁ'),
          buildListTile('Raag Gond', 'https://gurbaninow.com/gutka/101',
              context, 'ਰਾਗੁ ਗੋਂਡ'),
          buildListTile('Raag Raamkalee', 'https://gurbaninow.com/gutka/102',
              context, 'ਰਾਗੁ ਰਾਮਕਲੀ'),
          buildListTile('Raag Maalee Gauraa',
              'https://gurbaninow.com/gutka/103', context, 'ਰਾਗੁ ਮਾਲੀ ਗਉੜਾ'),
          buildListTile('Raag Maaroo', 'https://gurbaninow.com/gutka/104',
              context, 'ਰਾਗੁ ਮਾਰੂ'),
          buildListTile('Raag Kaydaaraa', 'https://gurbaninow.com/gutka/105',
              context, 'ਰਾਗੁ ਕੇਦਾਰਾ'),
          buildListTile('Raag Bhairao', 'https://gurbaninow.com/gutka/106',
              context, 'ਰਾਗੁ ਭੈਰਉ'),
          buildListTile('Raag Basant', 'https://gurbaninow.com/gutka/107',
              context, 'ਰਾਗੁ ਬਸੰਤੁ'),
          buildListTile('Raag Saarang', 'https://gurbaninow.com/gutka/108',
              context, 'ਰਾਗੁ ਸਾਰੰਗ'),
          buildListTile('Raag Malaar', 'https://gurbaninow.com/gutka/109',
              context, 'ਰਾਗੁ ਮਲਾਰ'),
          buildListTile('Raag Kaanraa', 'https://gurbaninow.com/gutka/110',
              context, 'ਰਾਗੁ ਕਾਨੜਾ'),
          buildListTile(
              'Raag Prabhaatee Bibhaas',
              'https://gurbaninow.com/gutka/111',
              context,
              'ਰਾਗੁ ਪ੍ਰਭਾਤੀ ਬਿਭਾਸ'),
          buildListTile(
              'Saloks Of Devotee Kabeer Jee',
              'https://gurbaninow.com/gutka/112',
              context,
              'ਸਲੋਕ ਭਗਤ ਕਬੀਰ ਜੀਉ ਕੇ'),
          buildListTile(
              'Saloks Of Shaykh Fareed Jee',
              'https://gurbaninow.com/gutka/113',
              context,
              'ਸਲੋਕ ਸ਼ੇਖ਼ ਫ਼ਰੀਦ ਕੇ'),
          buildListTile(
              'Swaiyas From The Mouth Of The Great Fifth Mehl - 1',
              'https://gurbaninow.com/gutka/114',
              context,
              'ਸਵਯੇ ਸ੍ਰੀ ਮੁਖਬਾਕੵ ਮਹਲਾ ੫ - ੧'),
          buildListTile(
              'Swaiyas From The Mouth Of The Great Fifth Mehl - 2',
              'https://gurbaninow.com/gutka/115',
              context,
              'ਸਵਯੇ ਸ੍ਰੀ ਮੁਖਬਾਕੵ ਮਹਲਾ ੫ - ੨'),
          buildListTile(
              'Swaiyas In Praise Of The First Mehl',
              'https://gurbaninow.com/gutka/116',
              context,
              'ਸਵਈਏ ਮਹਲੇ ਪਹਿਲੇ ਕੇ'),
          buildListTile('Swaiyas In Praise Of The Second Mehl',
              'https://gurbaninow.com/gutka/117', context, 'ਸਵਈਏ ਮਹਲੇ ਦੂਜੇ ਕੇ'),
          buildListTile('Swaiyas In Praise Of The Third Mehl',
              'https://gurbaninow.com/gutka/118', context, 'ਸਵਈਏ ਮਹਲੇ ਤੀਜੇ ਕੇ'),
          buildListTile('Swaiyas In Praise Of The Fourth Mehl',
              'https://gurbaninow.com/gutka/119', context, 'ਸਵਈਏ ਮਹਲੇ ਚਉਥੇ ਕੇ'),
          buildListTile(
              'Swaiyas In Praise Of The Fifth Mehl',
              'https://gurbaninow.com/gutka/120',
              context,
              'ਸਵਈਏ ਮਹਲੇ ਪੰਜਵੇ ਕੇ'),
        ],
      ),
    );
  }

  ListTile buildListTile(
      String title, String url, BuildContext context, String subtitle) {
    return ListTile(
      title: Text(subtitle),
      subtitle: Text(title),
      onTap: () async {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ReadPath(url, title, subtitle),
          ),
        );
        // if (await canLaunch(url)) {
        //   await launch(url);
        // } else {
        //   throw 'Could not launch $url';
        // }
      },
    );
  }
}
