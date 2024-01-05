import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'km'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? kmText = '',
  }) =>
      [enText, kmText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    '3y8wtml7': {
      'en': 'Ta Prohm',
      'km': 'តាព្រហ្ម',
    },
    'sakgh5qq': {
      'en': 'By Grid',
      'km': 'ដោយក្រឡាចត្រង្គ',
    },
    'ndwztd2w': {
      'en': 'By List',
      'km': 'តាមបញ្ជី',
    },
    '46fetxww': {
      'en': 'Home',
      'km': 'ផ្ទះ',
    },
  },
  // Locator
  {
    'euw5yhp9': {
      'en': 'Locator',
      'km': 'ទីតាំង',
    },
    'i2uheey1': {
      'en': 'Locator',
      'km': 'ទីតាំង',
    },
  },
  // AcountPayment
  {
    'qt1xq4h1': {
      'en': '\$ 1',
      'km': '១ ដុល្លារ',
    },
    'n2ukvk3c': {
      'en': 'ABA Pay',
      'km': 'ABA Pay',
    },
    '73i0nhbw': {
      'en': 'Click to pay',
      'km': 'ចុចដើម្បីបង់ប្រាក់',
    },
    's41u015y': {
      'en': 'Acleda Pay',
      'km': 'អេស៊ីលីដា បង់',
    },
    '8ccd5n3c': {
      'en': 'Click to pay',
      'km': 'ចុចដើម្បីបង់ប្រាក់',
    },
    'kzkj3wsu': {
      'en': 'Wing Pay',
      'km': 'វីងបង់',
    },
    '2u6n3dzc': {
      'en': 'Click to pay',
      'km': 'ចុចដើម្បីបង់ប្រាក់',
    },
    'q9s7na7x': {
      'en': 'Add image',
      'km': 'បន្ថែមរូបភាព',
    },
    'bq8t1ezq': {
      'en': 'Active',
      'km': 'សកម្ម',
    },
    '7j2f8d4r': {
      'en': 'Home',
      'km': 'ផ្ទះ',
    },
  },
  // Balance
  {
    'cvfneuwy': {
      'en': 'Account\nsummary',
      'km': 'គណនី\nសង្ខេប',
    },
    'x42vtsal': {
      'en': 'Total in USD',
      'km': 'សរុបគិតជាដុល្លារ',
    },
    'i73a7ogs': {
      'en': 'Deposit',
      'km': 'ដាក់ប្រាក់',
    },
    'ls1vwwbe': {
      'en': 'Transfer',
      'km': 'ផ្ទេរ',
    },
    'qyg1punk': {
      'en': 'Withdrawal',
      'km': 'ការដកប្រាក់',
    },
    '1jptny9c': {
      'en': 'Transaction',
      'km': 'ប្រតិបត្តិការ',
    },
    'ozgzafzw': {
      'en': 'Pending',
      'km': 'កំពុងរង់ចាំ',
    },
    '9ve7dwfu': {
      'en': 'Balance',
      'km': 'តុល្យភាព',
    },
    'h8gfaygx': {
      'en': 'Balance',
      'km': 'តុល្យភាព',
    },
  },
  // MyCompany
  {
    '6ya6f6na': {
      'en': 'My Company',
      'km': 'ក្រុមហ៊ុន​របស់ខ្ញុំ',
    },
    'xlsl31da': {
      'en': 'Company',
      'km': 'ក្រុមហ៊ុន',
    },
    '1m15braj': {
      'en': 'Pending',
      'km': 'កំពុងរង់ចាំ',
    },
    'jqkdxhsf': {
      'en': 'Home',
      'km': 'ផ្ទះ',
    },
  },
  // CreateCompany
  {
    'mt4sq1tx': {
      'en': 'Company name',
      'km': 'ឈ្មោះ​ក្រុម​ហ៊ុន',
    },
    '6t0xmyua': {
      'en': 'Phone number',
      'km': 'លេខទូរសព្ទ',
    },
    'mb2x5x0g': {
      'en': 'Telegram link',
      'km': 'តំណភ្ជាប់ Telegram',
    },
    '4ejz1y32': {
      'en': 'Discount (%): ',
      'km': 'បញ្ចុះតម្លៃ (%)៖',
    },
    'ip2ndik7': {
      'en': 'Discount',
      'km': 'បញ្ចុះតម្លៃ',
    },
    'id48lt58': {
      'en': 'I have document',
      'km': 'ខ្ញុំមានឯកសារ',
    },
    '3jbs8phh': {
      'en': 'Company detail',
      'km': 'ព័ត៌មានលម្អិតរបស់ក្រុមហ៊ុន',
    },
    'b3bgio3d': {
      'en': 'Add image',
      'km': 'បន្ថែមរូបភាព',
    },
    '9mrdspmh': {
      'en': 'Next',
      'km': 'បន្ទាប់',
    },
    'q21zk21d': {
      'en': 'Create Company',
      'km': 'បង្កើតក្រុមហ៊ុន',
    },
    'u5dihepe': {
      'en': 'Home',
      'km': 'ផ្ទះ',
    },
  },
  // PinLocation
  {
    '1bvhhpgk': {
      'en': 'Save',
      'km': 'រក្សាទុក',
    },
    'fd3wssg1': {
      'en': 'Home',
      'km': 'ផ្ទះ',
    },
  },
  // Profile
  {
    'sjy614do': {
      'en': 'Account',
      'km': 'គណនី',
    },
    'v7o3x81d': {
      'en': 'QR Code',
      'km': 'កូដ QR',
    },
    '1gbawl1n': {
      'en': 'Referral Officer',
      'km': 'មន្រ្តីបញ្ជូន',
    },
    '7p52kg1v': {
      'en': 'Invide Member',
      'km': 'អញ្ជើញសមាជិក',
    },
    'bbxj9ydl': {
      'en': 'Language',
      'km': 'ភាសា',
    },
    'enoh4olw': {
      'en': 'Change password',
      'km': 'ផ្លាស់ប្តូរពាក្យសម្ងាត់',
    },
    'wk0fs7vu': {
      'en': 'Admin',
      'km': 'អ្នកគ្រប់គ្រង',
    },
    'fy9bv3m8': {
      'en': 'Sub Admin',
      'km': 'អ្នកគ្រប់គ្រងរង',
    },
    'saoccl89': {
      'en': 'Listing Company',
      'km': 'ក្រុមហ៊ុនចុះបញ្ជី',
    },
    '7l6c3mn2': {
      'en': 'Listing',
      'km': 'ការចុះបញ្ជី',
    },
    'unpp7woc': {
      'en': 'About',
      'km': 'អំពី',
    },
    '68zvl2ic': {
      'en': 'Logout',
      'km': 'ចាកចេញ',
    },
    '3x7bmbs4': {
      'en': 'Profile',
      'km': 'ប្រវត្តិរូប',
    },
  },
  // Withdrawal
  {
    'ayzqrzds': {
      'en': 'Amount',
      'km': 'ចំនួនទឹកប្រាក់',
    },
    'pe1ma1tv': {
      'en': 'Confirm',
      'km': 'បញ្ជាក់',
    },
    'amdq8blt': {
      'en': 'Withdrawal',
      'km': 'ការដកប្រាក់',
    },
    'u34e78dt': {
      'en': 'Home',
      'km': 'ផ្ទះ',
    },
  },
  // Referral
  {
    'lcgbvl5i': {
      'en': 'List view',
      'km': 'ទិដ្ឋភាពបញ្ជី',
    },
    '81v5dslg': {
      'en': 'Tree view',
      'km': 'ទិដ្ឋភាពដើមឈើ',
    },
    'ltcw1ynq': {
      'en': 'Referral',
      'km': 'យោង',
    },
    '86l24njq': {
      'en': 'Notifications',
      'km': 'ការជូនដំណឹង',
    },
  },
  // LoginPage
  {
    'nrt606jl': {
      'en': 'Home',
      'km': 'ផ្ទះ',
    },
  },
  // AdminMain
  {
    '4nsorbi4': {
      'en': 'Create user\n',
      'km': 'បង្កើតអ្នកប្រើប្រាស់',
    },
    '7pjwxghu': {
      'en': 'Listing\n',
      'km': 'ការចុះបញ្ជី',
    },
    'eagthoaw': {
      'en': 'Transaction\n',
      'km': 'ប្រតិបត្តិការ',
    },
    'nimx3ee2': {
      'en': 'Referral\n',
      'km': 'យោង',
    },
    'jsujip4v': {
      'en': 'User Account\n',
      'km': 'គណនី​អ្នកប្រើប្រាស់',
    },
    'bg9gjm1q': {
      'en': 'Businesses \n',
      'km': 'អាជីវកម្ម',
    },
    'a1d13nbv': {
      'en': 'Approve\nAccount',
      'km': 'យល់ព្រម\nគណនី',
    },
    'ngxtwqjf': {
      'en': 'Create\nEvent',
      'km': 'បង្កើត\nព្រឹត្តិការណ៍',
    },
    't0qgiqcq': {
      'en': 'Admin Page',
      'km': 'ទំព័រអ្នកគ្រប់គ្រង',
    },
    'ozufvr96': {
      'en': 'Home',
      'km': 'ផ្ទះ',
    },
  },
  // ApproveCompany
  {
    'j0pz6l2d': {
      'en': 'Request Company',
      'km': 'ស្នើសុំក្រុមហ៊ុន',
    },
    '9qqb0x3r': {
      'en': 'Home',
      'km': 'ផ្ទះ',
    },
  },
  // ApproveTransaction
  {
    '1acww5qn': {
      'en': 'Request Transaction',
      'km': 'ស្នើសុំប្រតិបត្តិការ',
    },
    'ua2fygfn': {
      'en': 'Deposit',
      'km': 'ដាក់ប្រាក់',
    },
    'ujotgyze': {
      'en': 'Withdrawal',
      'km': 'ការដកប្រាក់',
    },
    'ukh0gmx7': {
      'en': 'History',
      'km': 'ប្រវត្តិសាស្ត្រ',
    },
    'qbbjih0a': {
      'en': 'from: ',
      'km': 'ពី៖',
    },
    'xmehv9vy': {
      'en': 'to: ',
      'km': 'ទៅ៖',
    },
    'v161xqzj': {
      'en': 'Home',
      'km': 'ផ្ទះ',
    },
  },
  // ApproveAccount
  {
    'ocorxwfk': {
      'en': 'Request Account',
      'km': 'ស្នើសុំគណនី',
    },
    '9x1p3677': {
      'en': 'Home',
      'km': 'ផ្ទះ',
    },
  },
  // Transfer
  {
    'yljbwcis': {
      'en': 'ID',
      'km': 'លេខសម្គាល់',
    },
    'dd4jhrey': {
      'en': 'Amount',
      'km': 'ចំនួនទឹកប្រាក់',
    },
    'a8vwev3m': {
      'en': 'Qr code',
      'km': 'កូដ Qr',
    },
    'e63wrn2c': {
      'en': 'Cancel',
      'km': 'បោះបង់',
    },
    'vt8ma50s': {
      'en': 'Confirm',
      'km': 'បញ្ជាក់',
    },
    '8mtno5w8': {
      'en': 'Transfer',
      'km': 'ផ្ទេរ',
    },
    'vo429k95': {
      'en': 'Home',
      'km': 'ផ្ទះ',
    },
  },
  // AdminMainReferral
  {
    '8waf4gfx': {
      'en': 'Sectors',
      'km': 'វិស័យ',
    },
    'fdkvmp0g': {
      'en': 'Notifications',
      'km': 'ការជូនដំណឹង',
    },
  },
  // ReferralSubPage
  {
    'htng1gzw': {
      'en': 'List view',
      'km': 'ទិដ្ឋភាពបញ្ជី',
    },
    'b406unmb': {
      'en': 'Tree view',
      'km': 'ទិដ្ឋភាពដើមឈើ',
    },
    'bdosmdsx': {
      'en': 'Sub Referral',
      'km': 'ការណែនាំរង',
    },
    's4l62zgb': {
      'en': 'Home',
      'km': 'ផ្ទះ',
    },
  },
  // Account
  {
    '7eahmtnv': {
      'en': 'User name',
      'km': 'ឈ្មោះ​អ្នកប្រើប្រាស់',
    },
    'a63mf7hb': {
      'en': 'Phone number',
      'km': 'លេខទូរសព្ទ',
    },
    'voxinols': {
      'en': 'Referral',
      'km': 'យោង',
    },
    '75ut2m9n': {
      'en': 'Invite ID',
      'km': 'លេខសម្គាល់ការអញ្ជើញ',
    },
    '08m2m2xn': {
      'en': 'Option 1',
      'km': 'ជម្រើសទី 1',
    },
    'yy2srwcr': {
      'en': 'Option 2',
      'km': 'ជម្រើសទី 2',
    },
    'emjfhixx': {
      'en': 'Please select sector',
      'km': 'សូមជ្រើសរើសផ្នែក',
    },
    '0rx6xr9s': {
      'en': 'Search for an item...',
      'km': 'ស្វែងរកធាតុ...',
    },
    'df9cutia': {
      'en': 'Detelete',
      'km': 'លុប',
    },
    'gcc3s53j': {
      'en': 'Approved',
      'km': 'បានអនុម័ត',
    },
    'ilohosyq': {
      'en': 'Account',
      'km': 'គណនី',
    },
    'hzl9io6v': {
      'en': 'Home',
      'km': 'ផ្ទះ',
    },
  },
  // Company
  {
    'yeadjesh': {
      'en': 'Amount',
      'km': 'ចំនួនទឹកប្រាក់',
    },
    'z77trhgi': {
      'en': 'Company name',
      'km': 'ឈ្មោះ​ក្រុម​ហ៊ុន',
    },
    'fnbhb690': {
      'en': 'Phone number',
      'km': 'លេខទូរសព្ទ',
    },
    'cy85xuwm': {
      'en': 'Telegram link',
      'km': 'តំណភ្ជាប់ Telegram',
    },
    'r9xogwup': {
      'en': 'Company detail',
      'km': 'ព័ត៌មានលម្អិតរបស់ក្រុមហ៊ុន',
    },
    'lrcqekz0': {
      'en': 'Add image',
      'km': 'បន្ថែមរូបភាព',
    },
    '3npe7pt5': {
      'en': 'Payment image',
      'km': 'រូបភាពការទូទាត់',
    },
    'ug8cg8tc': {
      'en': 'Delete',
      'km': 'លុប',
    },
    'ihosdi5t': {
      'en': 'Confirm',
      'km': 'បញ្ជាក់',
    },
    'uakhq5nn': {
      'en': 'Company',
      'km': 'ក្រុមហ៊ុន',
    },
    '2w8yzxd2': {
      'en': 'Home',
      'km': 'ផ្ទះ',
    },
  },
  // Transaction
  {
    '56pt0emp': {
      'en': 'Amont',
      'km': 'អាម៉ុន',
    },
    'fo7dz9xp': {
      'en': 'Delete',
      'km': 'លុប',
    },
    'apvf3o4b': {
      'en': 'Confirm',
      'km': 'បញ្ជាក់',
    },
    'er1b6n35': {
      'en': 'Transaction',
      'km': 'ប្រតិបត្តិការ',
    },
    'zisj7kxd': {
      'en': 'Home',
      'km': 'ផ្ទះ',
    },
  },
  // CompanyPayment
  {
    'ft3udpi8': {
      'en': '\$0',
      'km': '\$0',
    },
    'zcrlrqfd': {
      'en': 'ABA Pay',
      'km': 'ABA Pay',
    },
    'wvr838lf': {
      'en': 'Click to pay',
      'km': 'ចុចដើម្បីបង់ប្រាក់',
    },
    'wpx0vre3': {
      'en': 'Acleda Pay',
      'km': 'អេស៊ីលីដា បង់',
    },
    'q302snd7': {
      'en': 'Click to pay',
      'km': 'ចុចដើម្បីបង់ប្រាក់',
    },
    'i23zgbri': {
      'en': 'Wing Pay',
      'km': 'វីងបង់',
    },
    '5e59iozl': {
      'en': 'Click to pay',
      'km': 'ចុចដើម្បីបង់ប្រាក់',
    },
    'escsheo3': {
      'en': 'Add image',
      'km': 'បន្ថែមរូបភាព',
    },
    'v1811cfd': {
      'en': 'Active',
      'km': 'សកម្ម',
    },
    '1ch8wvcd': {
      'en': 'Home',
      'km': 'ផ្ទះ',
    },
  },
  // ViewCompany
  {
    'bwfm0gx0': {
      'en': 'Company name',
      'km': 'ឈ្មោះ​ក្រុម​ហ៊ុន',
    },
    'wzzpl0ha': {
      'en': 'Phone number',
      'km': 'លេខទូរសព្ទ',
    },
    '1m9h2z4c': {
      'en': 'Telegram link',
      'km': 'តំណភ្ជាប់ Telegram',
    },
    'jflxb6zj': {
      'en': 'Company detail',
      'km': 'ព័ត៌មានលម្អិតរបស់ក្រុមហ៊ុន',
    },
    'i0pnhsd9': {
      'en': 'Add image',
      'km': 'បន្ថែមរូបភាព',
    },
    'dpaxp38l': {
      'en': 'Payment image',
      'km': 'រូបភាពការទូទាត់',
    },
    'fv3x4cgz': {
      'en': 'Delete',
      'km': 'លុប',
    },
    '3sw6qsbz': {
      'en': 'Update',
      'km': 'ធ្វើបច្ចុប្បន្នភាព',
    },
    'xi4etzwi': {
      'en': 'Company',
      'km': 'ក្រុមហ៊ុន',
    },
    'qqi7bfce': {
      'en': 'Home',
      'km': 'ផ្ទះ',
    },
  },
  // Deposit
  {
    'mereea6f': {
      'en': '\$0',
      'km': '\$0',
    },
    'gnirtgn3': {
      'en': 'ABA Pay',
      'km': 'ABA Pay',
    },
    '6ybsmz43': {
      'en': 'Click to pay',
      'km': 'ចុចដើម្បីបង់ប្រាក់',
    },
    '2vlpw7iu': {
      'en': 'Acleda Pay',
      'km': 'អេស៊ីលីដា បង់',
    },
    'a15lhrhj': {
      'en': 'Click to pay',
      'km': 'ចុចដើម្បីបង់ប្រាក់',
    },
    'wz4zgxa1': {
      'en': 'Wing Pay',
      'km': 'វីងបង់',
    },
    'cj7hdbji': {
      'en': 'Click to pay',
      'km': 'ចុចដើម្បីបង់ប្រាក់',
    },
    '7zv5ov1e': {
      'en': 'Add image',
      'km': 'បន្ថែមរូបភាព',
    },
    'lcvwhf3r': {
      'en': 'Confirm',
      'km': 'បញ្ជាក់',
    },
    '2pbjotv2': {
      'en': 'Home',
      'km': 'ផ្ទះ',
    },
  },
  // CompanyInfo
  {
    'xwixso2c': {
      'en': 'Company info',
      'km': 'ព័ត៌មានក្រុមហ៊ុន',
    },
    'tbvavogw': {
      'en': 'Home',
      'km': 'ផ្ទះ',
    },
  },
  // SingleCompanyMap
  {
    'qpcwgnao': {
      'en': 'Locator',
      'km': 'ទីតាំង',
    },
  },
  // EditCompany
  {
    'f8gcieb6': {
      'en': 'Company name',
      'km': 'ឈ្មោះ​ក្រុម​ហ៊ុន',
    },
    'es5445rx': {
      'en': 'Phone number',
      'km': 'លេខទូរសព្ទ',
    },
    '5znfg1mz': {
      'en': 'Telegram link',
      'km': 'តំណភ្ជាប់ Telegram',
    },
    '0ps4a1bt': {
      'en': 'Discount (%): ',
      'km': 'បញ្ចុះតម្លៃ (%)៖',
    },
    'wwsnbmtq': {
      'en': 'Discount',
      'km': 'បញ្ចុះតម្លៃ',
    },
    'z24pmy2q': {
      'en': 'I have document',
      'km': 'ខ្ញុំមានឯកសារ',
    },
    'rx3gkfeo': {
      'en': 'Company detail',
      'km': 'ព័ត៌មានលម្អិតរបស់ក្រុមហ៊ុន',
    },
    'ch7watfl': {
      'en': 'Add image',
      'km': 'បន្ថែមរូបភាព',
    },
    'hejcp29i': {
      'en': 'Delete',
      'km': 'លុប',
    },
    'j9pr3wc6': {
      'en': 'Update',
      'km': 'ធ្វើបច្ចុប្បន្នភាព',
    },
    'qgrzunuo': {
      'en': 'Edit Company',
      'km': 'កែសម្រួលក្រុមហ៊ុន',
    },
    'ps0u5scw': {
      'en': 'Home',
      'km': 'ផ្ទះ',
    },
  },
  // GraphTree
  {
    'm2sgzev1': {
      'en': 'Graph tree',
      'km': 'ដើមឈើក្រាហ្វ',
    },
    'p7eufsu5': {
      'en': 'Home',
      'km': 'ផ្ទះ',
    },
  },
  // ChangePassword
  {
    '90s5npdw': {
      'en': 'Old password',
      'km': 'លេខសំងាត់​ចាស់',
    },
    'qa2pivga': {
      'en': 'New password',
      'km': 'ពាក្យសម្ងាត់​ថ្មី',
    },
    'qc0b52vm': {
      'en': 'Old password is not correct',
      'km': 'ពាក្យសម្ងាត់ចាស់មិនត្រឹមត្រូវទេ។',
    },
    '6v9gos3k': {
      'en': 'Save',
      'km': 'រក្សាទុក',
    },
    '86bpqalh': {
      'en': 'Change password',
      'km': 'ផ្លាស់ប្តូរពាក្យសម្ងាត់',
    },
    'eq17sabv': {
      'en': 'Home',
      'km': 'ផ្ទះ',
    },
  },
  // EditAccount
  {
    'qpbvt7xy': {
      'en': 'User name',
      'km': 'ឈ្មោះ​អ្នកប្រើប្រាស់',
    },
    'yugis9fs': {
      'en': 'Referral',
      'km': 'យោង',
    },
    '4ddztnnb': {
      'en': 'Invite ID',
      'km': 'លេខសម្គាល់ការអញ្ជើញ',
    },
    'two55cxp': {
      'en': 'Option 1',
      'km': 'ជម្រើសទី 1',
    },
    'u5xow02r': {
      'en': 'Option 2',
      'km': 'ជម្រើសទី 2',
    },
    'nalqvp4a': {
      'en': 'Please select sector',
      'km': 'សូមជ្រើសរើសផ្នែក',
    },
    'gnsr9u8a': {
      'en': 'Search for an item...',
      'km': 'ស្វែងរកធាតុ...',
    },
    '11qe1b8g': {
      'en': 'Delete',
      'km': 'លុប',
    },
    '3iaywr7m': {
      'en': 'Update',
      'km': 'ធ្វើបច្ចុប្បន្នភាព',
    },
    'frg6czrm': {
      'en': 'Edit Account',
      'km': 'កែសម្រួលគណនី',
    },
    'ebdqkclz': {
      'en': 'Home',
      'km': 'ផ្ទះ',
    },
  },
  // AdminCreateUser
  {
    'v5rorgp3': {
      'en': 'Member',
      'km': 'សមាជិក',
    },
    'mdzgrw19': {
      'en': 'Full Name',
      'km': 'ឈ្មោះ​ពេញ',
    },
    'qpnn8ior': {
      'en': 'Password',
      'km': 'ពាក្យសម្ងាត់',
    },
    'jilzubeg': {
      'en': 'Phone',
      'km': 'ទូរស័ព្ទ',
    },
    'n9e0yp33': {
      'en': 'Referral ID',
      'km': 'លេខសម្គាល់យោង',
    },
    '8erfwafq': {
      'en': 'Invite ID',
      'km': 'លេខសម្គាល់ការអញ្ជើញ',
    },
    '0gq64puq': {
      'en': 'Option 1',
      'km': 'ជម្រើសទី 1',
    },
    'ogdhpfwy': {
      'en': 'Option 2',
      'km': 'ជម្រើសទី 2',
    },
    '37hi9qsb': {
      'en': 'Please select sector',
      'km': 'សូមជ្រើសរើសផ្នែក',
    },
    '438qjvon': {
      'en': 'Search for an item...',
      'km': 'ស្វែងរកធាតុ...',
    },
    'arobyggq': {
      'en': 'Next',
      'km': 'បន្ទាប់',
    },
    '6g5wfv4v': {
      'en': 'Officer',
      'km': 'មន្ត្រី',
    },
    'x40ncbiz': {
      'en': 'Full Name',
      'km': 'ឈ្មោះ​ពេញ',
    },
    '2tn24s7u': {
      'en': 'Password',
      'km': 'ពាក្យសម្ងាត់',
    },
    'db4uoalk': {
      'en': 'Referral ID',
      'km': 'លេខសម្គាល់យោង',
    },
    'cwj6a4yk': {
      'en': 'Option 1',
      'km': 'ជម្រើសទី 1',
    },
    'zrr3xhkh': {
      'en': 'Option 2',
      'km': 'ជម្រើសទី 2',
    },
    'dosjyfku': {
      'en': 'Please select sector',
      'km': 'សូមជ្រើសរើសផ្នែក',
    },
    'hy0wc5pf': {
      'en': 'Search for an item...',
      'km': 'ស្វែងរកធាតុ...',
    },
    'mdujnrb2': {
      'en': 'Create',
      'km': 'បង្កើត',
    },
    'q1cq2rgu': {
      'en': 'Create user',
      'km': 'បង្កើតអ្នកប្រើប្រាស់',
    },
    'lxgbkxde': {
      'en': 'Home',
      'km': 'ផ្ទះ',
    },
  },
  // AdminAccount
  {
    'hvjvttbq': {
      'en': 'Account',
      'km': 'គណនី',
    },
    'r8ca9iwc': {
      'en': 'Member',
      'km': 'សមាជិក',
    },
    'tuqf39po': {
      'en': 'Officer',
      'km': 'មន្ត្រី',
    },
    'niopzmo9': {
      'en': 'Home',
      'km': 'ផ្ទះ',
    },
  },
  // AdminBusinesses
  {
    '9yj1m6yu': {
      'en': 'Businesses',
      'km': 'អាជីវកម្ម',
    },
    'ntuw3o4q': {
      'en': 'Home',
      'km': 'ផ្ទះ',
    },
  },
  // SearchCompany
  {
    'nwnpscay': {
      'en': 'Search..',
      'km': 'ស្វែងរក..',
    },
    '2ol2x29z': {
      'en': 'Search',
      'km': 'ស្វែងរក',
    },
    's8tudoty': {
      'en': 'Home',
      'km': 'ផ្ទះ',
    },
  },
  // About
  {
    'ra14fpuc': {
      'en': 'About',
      'km': 'អំពី',
    },
    'ok1np8dq': {
      'en': 'Home',
      'km': 'ផ្ទះ',
    },
  },
  // Event
  {
    '79d0nwi7': {
      'en': 'Event',
      'km': 'ព្រឹត្តិការណ៍',
    },
    'tuiz2c2i': {
      'en': 'Home',
      'km': 'ផ្ទះ',
    },
  },
  // Notification
  {
    'ht2siunj': {
      'en': 'Notification',
      'km': 'សេចក្តីជូនដំណឹង',
    },
    'um838lpo': {
      'en': 'Home',
      'km': 'ផ្ទះ',
    },
  },
  // UnderMaintenance
  {
    '37vpdj49': {
      'en': 'We are Under Maintenance',
      'km': 'យើងស្ថិតនៅក្រោមការថែទាំ',
    },
    'p79harf1': {
      'en': 'Will be Back Soon!',
      'km': 'នឹងត្រលប់មកវិញឆាប់ៗនេះ!',
    },
    'bbuy30ng': {
      'en': 'Home',
      'km': 'ផ្ទះ',
    },
  },
  // MemberPayment
  {
    '9w3jd1ir': {
      'en': 'ABA Pay',
      'km': 'ABA Pay',
    },
    'jj8jfug1': {
      'en': 'Click to pay',
      'km': 'ចុចដើម្បីបង់ប្រាក់',
    },
    'wmioflxu': {
      'en': 'Acleda Pay',
      'km': 'អេស៊ីលីដា បង់',
    },
    'dgy18yeo': {
      'en': 'Click to pay',
      'km': 'ចុចដើម្បីបង់ប្រាក់',
    },
    'jj8to276': {
      'en': 'Wing Pay',
      'km': 'វីងបង់',
    },
    '6ks686mw': {
      'en': 'Click to pay',
      'km': 'ចុចដើម្បីបង់ប្រាក់',
    },
    'k7p3p2kj': {
      'en': 'Add image',
      'km': 'បន្ថែមរូបភាព',
    },
    'aw6r2wpd': {
      'en': 'Active',
      'km': 'សកម្ម',
    },
    'oilqgw8m': {
      'en': 'Home',
      'km': 'ផ្ទះ',
    },
  },
  // TeamPayment
  {
    'ulfbgr2m': {
      'en': 'ABA Pay',
      'km': 'ABA Pay',
    },
    'hfawoa4r': {
      'en': 'Click to pay',
      'km': 'ចុចដើម្បីបង់ប្រាក់',
    },
    'ffeftof4': {
      'en': 'Acleda Pay',
      'km': 'អេស៊ីលីដា បង់',
    },
    'oezuc0xr': {
      'en': 'Click to pay',
      'km': 'ចុចដើម្បីបង់ប្រាក់',
    },
    '7jvh1c95': {
      'en': 'Wing Pay',
      'km': 'វីងបង់',
    },
    'xonlsspc': {
      'en': 'Click to pay',
      'km': 'ចុចដើម្បីបង់ប្រាក់',
    },
    'nlipl5qa': {
      'en': 'Add image',
      'km': 'បន្ថែមរូបភាព',
    },
    'p5gj3sca': {
      'en': 'Active',
      'km': 'សកម្ម',
    },
    'cb15yi1i': {
      'en': 'Home',
      'km': 'ផ្ទះ',
    },
  },
  // SubAdminMain
  {
    'pf0ldg8y': {
      'en': 'Create user\n',
      'km': 'បង្កើតអ្នកប្រើប្រាស់',
    },
    'vgh6wywn': {
      'en': 'User Account\n',
      'km': 'គណនី​អ្នកប្រើប្រាស់',
    },
    'srgil3zp': {
      'en': 'Businesses \n',
      'km': 'អាជីវកម្ម',
    },
    'd4h7qshr': {
      'en': 'Create\nEvent',
      'km': 'បង្កើត\nព្រឹត្តិការណ៍',
    },
    'jqeju1r9': {
      'en': 'SubAdmin Page',
      'km': 'ទំព័រអ្នកគ្រប់គ្រងរង',
    },
    'uri3wfke': {
      'en': 'Home',
      'km': 'ផ្ទះ',
    },
  },
  // SubAdminBusinesses
  {
    'k7a5r60z': {
      'en': 'Businesses',
      'km': 'អាជីវកម្ម',
    },
    'crs7l09l': {
      'en': 'Home',
      'km': 'ផ្ទះ',
    },
  },
  // AdminAccountPayment
  {
    'g3h7bdbd': {
      'en': 'Bank',
      'km': 'ធនាគារ',
    },
    'k5z0nntl': {
      'en': '\$ 1',
      'km': '១ ដុល្លារ',
    },
    'ka5xd0to': {
      'en': 'ABA Pay',
      'km': 'ABA Pay',
    },
    'u9pzkftc': {
      'en': 'Click to pay',
      'km': 'ចុចដើម្បីបង់ប្រាក់',
    },
    '4hvtkd31': {
      'en': 'Acleda Pay',
      'km': 'អេស៊ីលីដា បង់',
    },
    'm4lmw7sp': {
      'en': 'Click to pay',
      'km': 'ចុចដើម្បីបង់ប្រាក់',
    },
    'o4mrxtc6': {
      'en': 'Wing Pay',
      'km': 'វីងបង់',
    },
    'fhyuqoz4': {
      'en': 'Click to pay',
      'km': 'ចុចដើម្បីបង់ប្រាក់',
    },
    '9w6yb318': {
      'en': 'Add image',
      'km': 'បន្ថែមរូបភាព',
    },
    'fs1dhh38': {
      'en': 'Active',
      'km': 'សកម្ម',
    },
    'z1wet92u': {
      'en': 'Wallet',
      'km': 'កាបូប',
    },
    '81vcxb4a': {
      'en': '\$ 1',
      'km': '១ ដុល្លារ',
    },
    '7oinzncl': {
      'en': 'Active',
      'km': 'សកម្ម',
    },
    '02ut29dq': {
      'en': 'Payment',
      'km': 'ការទូទាត់',
    },
    'n652qmvi': {
      'en': 'Home',
      'km': 'ផ្ទះ',
    },
  },
  // InvideMember
  {
    'w918sxln': {
      'en': 'Invide Member',
      'km': 'អញ្ជើញសមាជិក',
    },
    '3y8rga2s': {
      'en': 'Home',
      'km': 'ផ្ទះ',
    },
  },
  // EventDetails
  {
    'jww1dhen': {
      'en': 'Event detail',
      'km': 'ព័ត៌មានលម្អិតអំពីព្រឹត្តិការណ៍',
    },
    'ddr3i1nk': {
      'en': 'Home',
      'km': 'ផ្ទះ',
    },
  },
  // AdminCreateEvent
  {
    'tnosu7na': {
      'en': 'Create',
      'km': 'បង្កើត',
    },
    'k3que5uq': {
      'en': 'Title',
      'km': 'ចំណងជើង',
    },
    '67yiekd3': {
      'en': 'Details',
      'km': 'ព័ត៌មានលម្អិត',
    },
    'yzflqu96': {
      'en': 'Add image',
      'km': 'បន្ថែមរូបភាព',
    },
    '3kx20znm': {
      'en': 'Create',
      'km': 'បង្កើត',
    },
    '7zpvz662': {
      'en': 'History',
      'km': 'ប្រវត្តិសាស្ត្រ',
    },
    '93g2cdif': {
      'en': 'Create Event',
      'km': 'បង្កើតព្រឹត្តិការណ៍',
    },
    '2h0pia5s': {
      'en': 'Home',
      'km': 'ផ្ទះ',
    },
  },
  // AdminSubAccount
  {
    'xp8zcmwz': {
      'en': 'Account',
      'km': 'គណនី',
    },
    'ocvyde2n': {
      'en': 'Member',
      'km': 'សមាជិក',
    },
    'ubtafa2x': {
      'en': 'Officer',
      'km': 'មន្ត្រី',
    },
    'oi4yaph9': {
      'en': 'Home',
      'km': 'ផ្ទះ',
    },
  },
  // SubAdminAccount
  {
    '9aoit4ff': {
      'en': 'Account',
      'km': 'គណនី',
    },
    '2o5kxfmo': {
      'en': 'Member',
      'km': 'សមាជិក',
    },
    '9dg3fikb': {
      'en': 'Officer',
      'km': 'មន្ត្រី',
    },
    'jyed9byg': {
      'en': 'Home',
      'km': 'ផ្ទះ',
    },
  },
  // SubAdminSubAccount
  {
    'is05gtny': {
      'en': 'Account',
      'km': 'គណនី',
    },
    'c64ejoi6': {
      'en': 'Member',
      'km': 'សមាជិក',
    },
    '7niwdm5r': {
      'en': 'Officer',
      'km': 'មន្ត្រី',
    },
    'y36yzkj8': {
      'en': 'Home',
      'km': 'ផ្ទះ',
    },
  },
  // AdminEventDetails
  {
    'o33xwsl2': {
      'en': 'Delete',
      'km': 'លុប',
    },
    '5fyymatq': {
      'en': 'Edit',
      'km': 'កែសម្រួល',
    },
    '3dcg5qgr': {
      'en': 'Event detail',
      'km': 'ព័ត៌មានលម្អិតអំពីព្រឹត្តិការណ៍',
    },
    'ixxhqus7': {
      'en': 'Home',
      'km': 'ផ្ទះ',
    },
  },
  // EditEvent
  {
    'bks6saae': {
      'en': 'Title',
      'km': 'ចំណងជើង',
    },
    '1ts0y3wn': {
      'en': 'Details',
      'km': 'ព័ត៌មានលម្អិត',
    },
    'jxrax530': {
      'en': 'Add image',
      'km': 'បន្ថែមរូបភាព',
    },
    'po9eifih': {
      'en': 'Update',
      'km': 'ធ្វើបច្ចុប្បន្នភាព',
    },
    'o6nvgvt9': {
      'en': 'Edit Event',
      'km': 'កែសម្រួលព្រឹត្តិការណ៍',
    },
    'fwjuxuj4': {
      'en': 'Home',
      'km': 'ផ្ទះ',
    },
  },
  // ShowShop
  {
    'cv9vtflu': {
      'en': 'Phone: ',
      'km': 'ទូរស័ព្ទ៖',
    },
    'olnou246': {
      'en': 'Telegram: ',
      'km': 'តេឡេក្រាម៖',
    },
  },
  // ShowKHQR
  {
    '122b6nd3': {
      'en': 'KHQR',
      'km': 'KHQR',
    },
    'wcpgrzxg': {
      'en': 'Save',
      'km': 'រក្សាទុក',
    },
  },
  // NavBar
  {
    '7d6g3aa1': {
      'en': 'Home',
      'km': 'ផ្ទះ',
    },
    'zkq5m13a': {
      'en': 'Locator',
      'km': 'ទីតាំង',
    },
    'myfodagc': {
      'en': 'Alert',
      'km': 'ដាស់តឿន',
    },
    'agnmv6fb': {
      'en': 'Balance',
      'km': 'តុល្យភាព',
    },
    'fwkjed5b': {
      'en': 'Event',
      'km': 'ព្រឹត្តិការណ៍',
    },
    'n21gyhvu': {
      'en': 'Profile',
      'km': 'ប្រវត្តិរូប',
    },
  },
  // Transactions
  {
    'jiepopy9': {
      'en': 'Deposit',
      'km': 'ដាក់ប្រាក់',
    },
    '6o6pa2q1': {
      'en': 'Transfer',
      'km': 'ផ្ទេរ',
    },
    'hhntb0te': {
      'en': 'Withdrawal',
      'km': 'ការដកប្រាក់',
    },
  },
  // selectLocation
  {
    'ro3wg36t': {
      'en': 'Save',
      'km': 'រក្សាទុក',
    },
  },
  // LoginComponent
  {
    'lh5hvcir': {
      'en': 'Sign In',
      'km': 'ចូល',
    },
    'fyroydin': {
      'en': 'Welcome Back',
      'km': 'ស្វា​គម​ន៏​ការ​ត្រ​លប់​មក​វិញ',
    },
    'd9ouesba': {
      'en': 'Fill out the information below in order to access your account.',
      'km': 'បំពេញព័ត៌មានខាងក្រោម ដើម្បីចូលប្រើគណនីរបស់អ្នក។',
    },
    '6zxlh0p7': {
      'en': 'Phone number',
      'km': 'លេខទូរសព្ទ',
    },
    'ooyl8orz': {
      'en': 'Password',
      'km': 'ពាក្យសម្ងាត់',
    },
    '95l0eikw': {
      'en': 'Sign in',
      'km': 'ចូល',
    },
    'gtd92c92': {
      'en': 'Sign Up',
      'km': 'ចុះ​ឈ្មោះ',
    },
    'g1yku3fl': {
      'en': 'Create Account',
      'km': 'បង្កើតគណនី',
    },
    '8kp10tav': {
      'en': 'Full name',
      'km': 'ឈ្មោះ​ពេញ',
    },
    '8bjt1g2f': {
      'en': 'Phone number',
      'km': 'លេខទូរសព្ទ',
    },
    'mllvo7vc': {
      'en': 'Password',
      'km': 'ពាក្យសម្ងាត់',
    },
    'dxm9rmaj': {
      'en': 'Sign Up',
      'km': 'ចុះ​ឈ្មោះ',
    },
    'jic6y1og': {
      'en': 'Next',
      'km': 'បន្ទាប់',
    },
  },
  // LoginOnly
  {
    'ndf0605s': {
      'en': 'Welcome Back',
      'km': 'ស្វា​គម​ន៏​ការ​ត្រ​លប់​មក​វិញ',
    },
    'd119hl4f': {
      'en': 'Fill out the information below in order to access your account.',
      'km': 'បំពេញព័ត៌មានខាងក្រោម ដើម្បីចូលប្រើគណនីរបស់អ្នក។',
    },
    'z7z42suf': {
      'en': 'Phone number',
      'km': 'លេខទូរសព្ទ',
    },
    'jwypsppr': {
      'en': 'Password',
      'km': 'ពាក្យសម្ងាត់',
    },
    'vtrsacju': {
      'en': 'Sign in',
      'km': 'ចូល',
    },
    'g5pv7u6m': {
      'en': 'Support',
      'km': 'គាំទ្រ',
    },
  },
  // UpdateAlert
  {
    'cd50pemm': {
      'en': 'Update',
      'km': 'ធ្វើបច្ចុប្បន្នភាព',
    },
    't3u3rksv': {
      'en':
          '    We would like to inform you that a new version of our app is available for download. To enjoy the latest benefits of our app, please update it as soon as possible. ',
      'km':
          'យើងសូមជម្រាបជូនអ្នកថា កំណែថ្មីនៃកម្មវិធីរបស់យើងគឺអាចទាញយកបាន។ ដើម្បីរីករាយជាមួយអត្ថប្រយោជន៍ចុងក្រោយបំផុតនៃកម្មវិធីរបស់យើង សូមអាប់ដេតវាឱ្យបានឆាប់តាមដែលអាចធ្វើទៅបាន។',
    },
    'irdmhhi0': {
      'en': 'LATER',
      'km': 'ក្រោយមក',
    },
    'gvey98wv': {
      'en': 'UPDATE NOW',
      'km': 'ធ្វើបច្ចុប្បន្នភាពឥឡូវនេះ',
    },
  },
  // ChangeLanguage
  {
    'bc2ttg0d': {
      'en': 'Select Language',
      'km': 'ជ្រើសរើស​ភាសា',
    },
  },
  // Miscellaneous
  {
    'oih6zipk': {
      'en': 'Company name',
      'km': 'ឈ្មោះ​ក្រុម​ហ៊ុន',
    },
    'v3d2vjs0': {
      'en':
          'In order to search nearby, this app requires access to your current location.',
      'km':
          'ដើម្បីស្វែងរកនៅក្បែរនោះ កម្មវិធីនេះទាមទារសិទ្ធិចូលប្រើទីតាំងបច្ចុប្បន្នរបស់អ្នក។',
    },
    'izzqj9gt': {
      'en':
          'In order to scan for barcodes and QR codes, this app requires permission to access the camera.',
      'km':
          'ដើម្បី​ស្កេន​រក​បាកូដ និង​កូដ QR កម្មវិធីនេះ​ទាមទារ​ការអនុញ្ញាត​ដើម្បី​ចូលប្រើ​កាមេរ៉ា។',
    },
    '52ullv1c': {
      'en':
          'In order to upload data, this app requires permission to access the photo library.',
      'km':
          'ដើម្បីបង្ហោះទិន្នន័យ កម្មវិធីនេះទាមទារការអនុញ្ញាតដើម្បីចូលប្រើបណ្ណាល័យរូបថត។',
    },
    'rzwuuezf': {
      'en': 'We need your location permission to show you this map',
      'km':
          'យើងត្រូវការការអនុញ្ញាតពីទីតាំងរបស់អ្នក ដើម្បីបង្ហាញផែនទីនេះដល់អ្នក',
    },
    'ooj2qqhx': {
      'en': 'To save device to storage we need your permission.',
      'km': 'ដើម្បីរក្សាទុកឧបករណ៍ទៅកន្លែងផ្ទុក យើងត្រូវការការអនុញ្ញាតពីអ្នក។',
    },
    'qe1dsve8': {
      'en': 'Error can\'t login',
      'km': 'កំហុសមិនអាចចូលបានទេ។',
    },
    'yhmdrpe7': {
      'en': 'Password reset email sent!',
      'km': 'បានផ្ញើអ៊ីមែលកំណត់ពាក្យសម្ងាត់ឡើងវិញ!',
    },
    '5t7ayb9m': {
      'en': 'Email required!',
      'km': 'ទាមទារអ៊ីមែល!',
    },
    'renr1mfa': {
      'en': 'Phone number required and has to start with +.',
      'km': 'ត្រូវការលេខទូរស័ព្ទ ហើយត្រូវចាប់ផ្តើមដោយ + ។',
    },
    '8pgguln0': {
      'en': 'Passwords don t match',
      'km': 'ពាក្យសម្ងាត់មិនត្រូវគ្នា។',
    },
    'gk2qqclj': {
      'en': 'Enter SMS verification code',
      'km': 'បញ្ចូលលេខកូដផ្ទៀងផ្ទាត់ SMS',
    },
    'mz8qmg3l': {
      'en':
          'Too long since most recent sign in. Sign in again before deleting your account.',
      'km':
          'យូរពេកចាប់តាំងពីការចូលថ្មីៗបំផុត។ ចូលម្តងទៀតមុនពេលលុបគណនីរបស់អ្នក។',
    },
    'vthzltfy': {
      'en':
          'Too long since most recent sign in. Sign in again before updating your email.',
      'km':
          'យូរពេកចាប់តាំងពីការចូលថ្មីៗបំផុត។ ចូលម្តងទៀតមុនពេលធ្វើបច្ចុប្បន្នភាពអ៊ីមែលរបស់អ្នក។',
    },
    '6gi4eo8v': {
      'en': 'Email change confirmation email sent!',
      'km': 'ផ្ញើអ៊ីមែលបញ្ជាក់ការផ្លាស់ប្តូរ!',
    },
    'kw14jrcx': {
      'en': 'Email already in use by another account',
      'km': 'អ៊ីមែលត្រូវបានប្រើប្រាស់រួចហើយដោយគណនីផ្សេង',
    },
    'e90agh5n': {
      'en': 'Invalid file format',
      'km': 'ទម្រង់ឯកសារមិនត្រឹមត្រូវ',
    },
    'co02njst': {
      'en': 'Uploading',
      'km': 'កំពុងផ្ទុកឡើង',
    },
    'dg5pg16f': {
      'en': 'Success',
      'km': 'ជោគជ័យ',
    },
    'z7emxvk1': {
      'en': 'Failed to upload data',
      'km': 'បរាជ័យក្នុងការបង្ហោះទិន្នន័យ',
    },
    'og1fnft3': {
      'en': '',
      'km': '',
    },
    'hzp3ot9v': {
      'en': 'Choose Source',
      'km': 'ជ្រើសរើសប្រភព',
    },
    'jf718a9r': {
      'en': 'Gallery',
      'km': 'វិចិត្រសាល',
    },
    'zyezx11b': {
      'en': 'Gallery (Photo)',
      'km': 'វិចិត្រសាល (រូបថត)',
    },
    '934ayfdd': {
      'en': 'Gallery (Video)',
      'km': 'វិចិត្រសាល (វីដេអូ)',
    },
    'xc2486kd': {
      'en': 'Camera',
      'km': 'កាមេរ៉ា',
    },
    'wz7u7gfd': {
      'en': '',
      'km': '',
    },
    'l5uoqod9': {
      'en': '',
      'km': '',
    },
    'q3n4249u': {
      'en': '',
      'km': '',
    },
    'jly5lkql': {
      'en': '',
      'km': '',
    },
  },
].reduce((a, b) => a..addAll(b));
