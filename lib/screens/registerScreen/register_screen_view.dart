// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sarvam/routes/app_pages.dart';
import 'package:sarvam/screens/registerScreen/register_screen_controller.dart';
import 'package:sarvam/utils/const_colors_key.dart';
import 'package:sarvam/utils/const_fonts_key.dart';
import 'package:sarvam/utils/const_image_key.dart';
import 'package:sarvam/utils/const_key.dart';
import 'package:sarvam/widgets/custom_button.dart';
import 'package:sarvam/widgets/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterScreenController registerScreenController = Get.put(RegisterScreenController());
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController postalCode = TextEditingController();
  TextEditingController address = TextEditingController();
  final storage = GetStorage();
  var role;
  String selectedDate = "";
  String? selectedCountry = "India";
  List<String> countryList = [
    "Afghanistan",
    "Albania",
    "Algeria",
    "Andorra",
    "Angola",
    "Anguilla",
    "Antigua &amp; Barbuda",
    "Argentina",
    "Armenia",
    "Aruba",
    "Australia",
    "Austria",
    "Azerbaijan",
    "Bahamas",
    "Bahrain",
    "Bangladesh",
    "Barbados",
    "Belarus",
    "Belgium",
    "Belize",
    "Benin",
    "Bermuda",
    "Bhutan",
    "Bolivia",
    "Bosnia &amp; Herzegovina",
    "Botswana",
    "Brazil",
    "British Virgin Islands",
    "Brunei",
    "Bulgaria",
    "Burkina Faso",
    "Burundi",
    "Cambodia",
    "Cameroon",
    "Cape Verde",
    "Cayman Islands",
    "Chad",
    "Chile",
    "China",
    "Colombia",
    "Congo",
    "Cook Islands",
    "Costa Rica",
    "Cote D Ivoire",
    "Croatia",
    "Cruise Ship",
    "Cuba",
    "Cyprus",
    "Czech Republic",
    "Denmark",
    "Djibouti",
    "Dominica",
    "Dominican Republic",
    "Ecuador",
    "Egypt",
    "El Salvador",
    "Equatorial Guinea",
    "Estonia",
    "Ethiopia",
    "Falkland Islands",
    "Faroe Islands",
    "Fiji",
    "Finland",
    "France",
    "French Polynesia",
    "French West Indies",
    "Gabon",
    "Gambia",
    "Georgia",
    "Germany",
    "Ghana",
    "Gibraltar",
    "Greece",
    "Greenland",
    "Grenada",
    "Guam",
    "Guatemala",
    "Guernsey",
    "Guinea",
    "Guinea Bissau",
    "Guyana",
    "Haiti",
    "Honduras",
    "Hong Kong",
    "Hungary",
    "Iceland",
    "India",
    "Indonesia",
    "Iran",
    "Iraq",
    "Ireland",
    "Isle of Man",
    "Israel",
    "Italy",
    "Jamaica",
    "Japan",
    "Jersey",
    "Jordan",
    "Kazakhstan",
    "Kenya",
    "Kuwait",
    "Kyrgyz Republic",
    "Laos",
    "Latvia",
    "Lebanon",
    "Lesotho",
    "Liberia",
    "Libya",
    "Liechtenstein",
    "Lithuania",
    "Luxembourg",
    "Macau",
    "Macedonia",
    "Madagascar",
    "Malawi",
    "Malaysia",
    "Maldives",
    "Mali",
    "Malta",
    "Mauritania",
    "Mauritius",
    "Mexico",
    "Moldova",
    "Monaco",
    "Mongolia",
    "Montenegro",
    "Montserrat",
    "Morocco",
    "Mozambique",
    "Namibia",
    "Nepal",
    "Netherlands",
    "Netherlands Antilles",
    "New Caledonia",
    "New Zealand",
    "Nicaragua",
    "Niger",
    "Nigeria",
    "Norway",
    "Oman",
    "Pakistan",
    "Palestine",
    "Panama",
    "Papua New Guinea",
    "Paraguay",
    "Peru",
    "Philippines",
    "Poland",
    "Portugal",
    "Puerto Rico",
    "Qatar",
    "Reunion",
    "Romania",
    "Russia",
    "Rwanda",
    "Saint Pierre &amp; Miquelon",
    "Samoa",
    "San Marino",
    "Satellite",
    "Saudi Arabia",
    "Senegal",
    "Serbia",
    "Seychelles",
    "Sierra Leone",
    "Singapore",
    "Slovakia",
    "Slovenia",
    "South Africa",
    "South Korea",
    "Spain",
    "Sri Lanka",
    "St Kitts &amp; Nevis",
    "St Lucia",
    "St Vincent",
    "St. Lucia",
    "Sudan",
    "Suriname",
    "Swaziland",
    "Sweden",
    "Switzerland",
    "Syria",
    "Taiwan",
    "Tajikistan",
    "Tanzania",
    "Thailand",
    "Timor L'Este",
    "Togo",
    "Tonga",
    "Trinidad &amp; Tobago",
    "Tunisia",
    "Turkey",
    "Turkmenistan",
    "Turks &amp; Caicos",
    "Uganda",
    "Ukraine",
    "United Arab Emirates",
    "United Kingdom",
    "Uruguay",
    "Uzbekistan",
    "Venezuela",
    "Vietnam",
    "Virgin Islands (US)",
    "Yemen",
    "Zambia",
    "Zimbabwe"
  ];
  String? selectedPhoneCode = "+91";
  List<String> phoneCodeList = [
    "+93",
    "+355",
    "+213",
    "+376",
    "+244",
    "+672",
    "+54",
    "+374",
    "+297",
    "+61",
    "+43",
    "+994",
    "+973",
    "+880",
    "+375",
    "+32",
    "+501",
    "+229",
    "+975",
    "+591",
    "+387",
    "+267",
    "+55",
    "+673",
    "+359",
    "+226",
    "+95",
    "+257",
    "+855",
    "+237",
    "+1",
    "+238",
    "+236",
    "+235",
    "+56",
    "+86",
    "+61",
    "+61",
    "+57",
    "+269",
    "+242",
    "+682",
    "+506",
    "+385",
    "+53",
    "+357",
    "+420",
    "+45",
    "+253",
    "+670",
    "+593",
    "+20",
    "+503",
    "+240",
    "+291",
    "+372",
    "+251",
    "+500",
    "+298",
    "+679",
    "+358",
    "+33",
    "+689",
    "+241",
    "+220",
    "+995",
    "+49",
    "+233",
    "+350",
    "+30",
    "+299",
    "+502",
    "+224",
    "+245",
    "+592",
    "+509",
    "+504",
    "+852",
    "+36",
    "+91",
    "+62",
    "+98",
    "+964",
    "+353",
    "+44",
    "+972",
    "+39",
    "+225",
    "+1876",
    "+81",
    "+962",
    "+7",
    "+254",
    "+686",
    "+965",
    "+996",
    "+856",
    "+371",
    "+961",
    "+266",
    "+231",
    "+218",
    "+423",
    "+370",
    "+352",
    "+853",
    "+389",
    "+261",
    "+265",
    "+60",
    "+960",
    "+223",
    "+356",
    "+692",
    "+222",
    "+230",
    "+262",
    "+52",
    "+691",
    "+373",
    "+377",
    "+976",
    "+382",
    "+212",
    "+258",
    "+264",
    "+674",
    "+977",
    "+31",
    "+687",
    "+64",
    "+505",
    "+227",
    "+234",
    "+683",
    "+850",
    "+47",
    "+968",
    "+92",
    "+680",
    "+507",
    "+675",
    "+595",
    "+51",
    "+63",
    "+870",
    "+48",
    "+351",
    "+1",
    "+974",
    "+40",
    "+7",
    "+250",
    "+590",
    "+685",
    "+378",
    "+239",
    "+966",
    "+221",
    "+381",
    "+248",
    "+232",
    "+65",
    "+421",
    "+386",
    "+677",
    "+252",
    "+27",
    "+82",
    "+34",
    "+94",
    "+290",
    "+508",
    "+249",
    "+597",
    "+268",
    "+46",
    "+41",
    "+963",
    "+886",
    "+992",
    "+255",
    "+66",
    "+228",
    "+690",
    "+676",
    "+216",
    "+90",
    "+993",
    "+688",
    "+971",
    "+256",
    "+44",
    "+380",
    "+598",
    "+1",
    "+998",
    "+678",
    "+39",
    "+58",
    "+84",
    "+681",
    "+967",
    "+260",
    "+263"
  ];

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: backgroundCyan,
              onPrimary: textBlack,
              onSurface: textBlack,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: backgroundCyan, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        selectedDate = "${picked.day}/${picked.month}/${picked.year}";
      });
    } else {
      setState(() {
        selectedDate = "";
      });
    }
  }

  @override
  void initState() {
    setState(() {
      role = "Male";
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundCyan,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              SizedBox(
                height: height,
                width: width,
                child: Image.asset(AppImages().registerBackground, fit: BoxFit.fill),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 50, bottom: 50),
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          IconButton(
                            icon: Image.asset(AppImages().backArrow, scale: 3.0, color: backgroundWhite),
                            padding: const EdgeInsets.only(right: 20),
                            onPressed: () {
                              Get.back();
                            },
                          ),
                          const Text(
                            "Sign Up",
                            style: TextStyle(color: backgroundWhite, fontSize: 25, fontFamily: ROBOTO_BOLD),
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      "Name*",
                      style: TextStyle(color: backgroundWhite, fontSize: 16, fontFamily: ROBOTO_MEDIUM),
                    ),
                    const SizedBox(height: 5),
                    CustomTextField(
                      textEditingController: name,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      hint: "Enter Your Name",
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Email Address*",
                      style: TextStyle(color: backgroundWhite, fontSize: 16, fontFamily: ROBOTO_MEDIUM),
                    ),
                    const SizedBox(height: 5),
                    CustomTextField(
                      textEditingController: email,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      hint: "example@gmail.com",
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Password*",
                      style: TextStyle(color: backgroundWhite, fontSize: 16, fontFamily: ROBOTO_MEDIUM),
                    ),
                    const SizedBox(height: 5),
                    CustomTextField(
                      textEditingController: password,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      hint: "Enter Your Password",
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Date of Birth*",
                      style: TextStyle(color: backgroundWhite, fontSize: 16, fontFamily: ROBOTO_MEDIUM),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      height: 50,
                      padding: const EdgeInsets.only(left: 20, right: 8),
                      decoration: const BoxDecoration(
                        color: backgroundWhite,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            selectedDate != "" ? selectedDate : "mm/dd/yyyy",
                            style: TextStyle(color: selectedDate != "" ? textBlack : textBlack.withOpacity(0.5), fontSize: 18.0, fontFamily: ROBOTO_REGULAR),
                          ),
                          IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              selectDate(context);
                            },
                            icon: Image.asset(AppImages().calendarIcon, scale: 2.5),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Phone*",
                      style: TextStyle(color: backgroundWhite, fontSize: 16, fontFamily: ROBOTO_MEDIUM),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: const BoxDecoration(
                        color: backgroundWhite,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 60,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                icon: Image.asset(AppImages().dropdownIcon, scale: 2.5),
                                value: selectedPhoneCode,
                                items: phoneCodeList
                                    .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: const TextStyle(color: textBlack, fontSize: 18.0, fontFamily: ROBOTO_REGULAR),
                                        )))
                                    .toList(),
                                onChanged: (item) => setState(() => selectedPhoneCode = item),
                                isExpanded: true,
                              ),
                            ),
                          ),
                          Expanded(
                            child: CustomTextField(
                              textEditingController: phoneNumber,
                              keyboardType: TextInputType.phone,
                              textInputAction: TextInputAction.next,
                              hint: "9876543210",
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Country*",
                              style: TextStyle(color: backgroundWhite, fontSize: 16, fontFamily: ROBOTO_MEDIUM),
                            ),
                            const SizedBox(height: 5),
                            Container(
                              height: 50,
                              width: width / 2 - 30,
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              decoration: const BoxDecoration(
                                color: backgroundWhite,
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  icon: Image.asset(AppImages().dropdownIcon, scale: 2.5),
                                  value: selectedCountry,
                                  items: countryList
                                      .map((item) => DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: const TextStyle(color: textBlack, fontSize: 18.0, fontFamily: ROBOTO_REGULAR),
                                          )))
                                      .toList(),
                                  onChanged: (item) => setState(() => selectedCountry = item),
                                  isExpanded: true,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Pincode",
                              style: TextStyle(color: backgroundWhite, fontSize: 16, fontFamily: ROBOTO_MEDIUM),
                            ),
                            const SizedBox(height: 5),
                            SizedBox(
                              height: 50,
                              width: width / 2 - 30,
                              child: CustomTextField(
                                textEditingController: postalCode,
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                                hint: "Enter Pincode",
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Address",
                      style: TextStyle(color: backgroundWhite, fontSize: 16, fontFamily: ROBOTO_MEDIUM),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      height: 100,
                      decoration: const BoxDecoration(
                        color: backgroundWhite,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: CustomTextField(
                        contentPaddingTop: 5,
                        contentPaddingBottom: 5,
                        textEditingController: address,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        hint: "Enter Your Address",
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Gender",
                      style: TextStyle(color: backgroundWhite, fontSize: 16, fontFamily: ROBOTO_MEDIUM),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 100,
                          child: RadioListTile(
                              title: Transform.translate(
                                offset: const Offset(-15, 0),
                                child: const Text(
                                  'Male',
                                  style: TextStyle(color: backgroundWhite, fontFamily: ROBOTO_REGULAR, fontSize: 16),
                                ),
                              ),
                              dense: true,
                              contentPadding: const EdgeInsets.all(0),
                              selectedTileColor: backgroundWhite,
                              activeColor: backgroundWhite,
                              value: "Male",
                              groupValue: role,
                              onChanged: (value) {
                                setState(() {
                                  role = value;
                                });
                              }),
                        ),
                        SizedBox(
                          width: 120,
                          child: RadioListTile(
                              title: Transform.translate(
                                offset: const Offset(-15, 0),
                                child: const Text(
                                  'Female',
                                  style: TextStyle(color: backgroundWhite, fontFamily: ROBOTO_REGULAR, fontSize: 16),
                                ),
                              ),
                              dense: true,
                              contentPadding: const EdgeInsets.all(0),
                              selectedTileColor: backgroundWhite,
                              activeColor: backgroundWhite,
                              value: "Female",
                              groupValue: role,
                              onChanged: (value) {
                                setState(() {
                                  role = value;
                                });
                              }),
                        ),
                        SizedBox(
                          width: 100,
                          child: RadioListTile(
                              title: Transform.translate(
                                offset: const Offset(-15, 0),
                                child: const Text(
                                  'Other',
                                  style: TextStyle(color: backgroundWhite, fontFamily: ROBOTO_REGULAR, fontSize: 16),
                                ),
                              ),
                              dense: true,
                              contentPadding: const EdgeInsets.all(0),
                              selectedTileColor: backgroundWhite,
                              activeColor: backgroundWhite,
                              value: "Other",
                              groupValue: role,
                              onChanged: (value) {
                                setState(() {
                                  role = value;
                                });
                              }),
                        ),
                      ],
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(top: 40),
                      height: 50,
                      child: CustomButton(
                        label: "SIGN UP",
                        labelColor: backgroundWhite,
                        borderColor: Colors.white,
                        buttonColor: Colors.transparent,
                        onTap: () async {
                          if (name.text.toString().isEmpty) {
                            Get.snackbar("Oops!", "Name required!", icon: const Icon(Icons.error, color: Colors.red), duration: const Duration(seconds: 1), colorText: Colors.white, snackPosition: SnackPosition.TOP, backgroundColor: backgroundCyan);
                          } else if (email.text.toString().isEmpty) {
                            Get.snackbar("Oops!", "Email required!", icon: const Icon(Icons.error, color: Colors.red), duration: const Duration(seconds: 1), colorText: Colors.white, snackPosition: SnackPosition.TOP, backgroundColor: backgroundCyan);
                          } else if (password.text.toString().isEmpty) {
                            Get.snackbar("Oops!", "Password required!", icon: const Icon(Icons.error, color: Colors.red), duration: const Duration(seconds: 1), colorText: Colors.white, snackPosition: SnackPosition.TOP, backgroundColor: backgroundCyan);
                          } else if (selectedDate == "") {
                            Get.snackbar("Oops!", "Date of Birth required!", icon: const Icon(Icons.error, color: Colors.red), duration: const Duration(seconds: 1), colorText: Colors.white, snackPosition: SnackPosition.TOP, backgroundColor: backgroundCyan);
                          } else if (phoneNumber.text.toString().isEmpty) {
                            Get.snackbar("Oops!", "PhoneNumber required!", icon: const Icon(Icons.error, color: Colors.red), duration: const Duration(seconds: 1), colorText: Colors.white, snackPosition: SnackPosition.TOP, backgroundColor: backgroundCyan);
                          } else if (postalCode.text.toString().isEmpty) {
                            Get.snackbar("Oops!", "Pincode required!", icon: const Icon(Icons.error, color: Colors.red), duration: const Duration(seconds: 1), colorText: Colors.white, snackPosition: SnackPosition.TOP, backgroundColor: backgroundCyan);
                          } else if (address.text.toString().isEmpty) {
                            Get.snackbar("Oops!", "Address required!", icon: const Icon(Icons.error, color: Colors.red), duration: const Duration(seconds: 1), colorText: Colors.white, snackPosition: SnackPosition.TOP, backgroundColor: backgroundCyan);
                          } else {
                            print(name.text);
                            print(email.text);
                            print(password.text);
                            print(selectedDate);
                            print(selectedPhoneCode);
                            print(phoneNumber.text);
                            print(selectedCountry);
                            print(postalCode.text);
                            print(address.text);
                            print(role);
                          }
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 30),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already have an account?",
                            style: TextStyle(fontSize: 16, fontFamily: ROBOTO_REGULAR, color: backgroundWhite),
                          ),
                          const SizedBox(width: 2),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.LOGIN_SCREEN);
                            },
                            child: const Text(
                              " Log In",
                              style: TextStyle(fontSize: 16, fontFamily: ROBOTO_MEDIUM, color: backgroundWhite, decoration: TextDecoration.underline),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
