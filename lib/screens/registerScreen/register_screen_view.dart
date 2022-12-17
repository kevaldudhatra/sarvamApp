// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sarvam/routes/app_pages.dart';
import 'package:sarvam/screens/registerScreen/register_screen_controller.dart';
import 'package:sarvam/utils/const_colors_key.dart';
import 'package:sarvam/utils/const_fonts_key.dart';
import 'package:sarvam/utils/const_image_key.dart';
import 'package:sarvam/widgets/custom_button.dart';
import 'package:sarvam/widgets/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterScreenController registerScreenController = Get.put(RegisterScreenController());
  bool passwordObscuredText = true;
  bool confirmObscuredText = true;
  RegExp isValidEmail = RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController postalCode = TextEditingController();
  TextEditingController address = TextEditingController();
  final storage = GetStorage();
  var role;
  String selectedDate = "";
  String displayDate = "";
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

  void passwordHideShow() {
    setState(() {
      passwordObscuredText = !passwordObscuredText;
    });
  }

  void confirmPasswordHideShow() {
    setState(() {
      confirmObscuredText = !confirmObscuredText;
    });
  }

  Future<void> selectDate(BuildContext context) async {
    await showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height: MediaQuery.of(context).size.height / 3,
        decoration: const BoxDecoration(color: backgroundWhite, borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        child: Column(
          children: [
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    child: const Text('OK', style: TextStyle(fontFamily: ROBOTO_MEDIUM, color: backgroundCyan)),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  CupertinoButton(
                    child: const Text('CANCEL', style: TextStyle(fontFamily: ROBOTO_MEDIUM, color: backgroundCyan)),
                    onPressed: () {
                      setState(() {
                        selectedDate = "";
                        Navigator.of(context).pop();
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 3 - 50,
              child: CupertinoDatePicker(
                  backgroundColor: backgroundWhite,
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: DateTime.now(),
                  use24hFormat: true,
                  onDateTimeChanged: (DateTime newDate) {
                    setState(() {
                      selectedDate = "${newDate.year}-${newDate.month}-${newDate.day}";
                      displayDate = "${newDate.day}-${newDate.month}-${newDate.year}";
                    });
                  }),
            ),
          ],
        ),
      ),
    );
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
                      style: TextStyle(color: backgroundWhite, fontSize: 15, fontFamily: ROBOTO_MEDIUM),
                    ),
                    const SizedBox(height: 5),
                    CustomTextField(
                      maxLine: 1,
                      textEditingController: name,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      hint: "Enter Your Name",
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Email Address*",
                      style: TextStyle(color: backgroundWhite, fontSize: 15, fontFamily: ROBOTO_MEDIUM),
                    ),
                    const SizedBox(height: 5),
                    CustomTextField(
                      maxLine: 1,
                      textEditingController: email,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      hint: "example@gmail.com",
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Password*",
                      style: TextStyle(color: backgroundWhite, fontSize: 15, fontFamily: ROBOTO_MEDIUM),
                    ),
                    const SizedBox(height: 5),
                    Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        CustomTextField(
                          textEditingController: password,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          contentPaddingRight: 50,
                          maxLine: 1,
                          hint: "**********",
                          obscureText: passwordObscuredText,
                        ),
                        Positioned(
                          right: 15,
                          child: GestureDetector(onTap: passwordHideShow, child: Icon(passwordObscuredText ? Icons.visibility_off_rounded : Icons.visibility_rounded, color: Colors.black, size: 18)),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Confirm Password*",
                      style: TextStyle(color: backgroundWhite, fontSize: 15, fontFamily: ROBOTO_MEDIUM),
                    ),
                    const SizedBox(height: 5),
                    Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        CustomTextField(
                          textEditingController: confirmPassword,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          contentPaddingRight: 50,
                          maxLine: 1,
                          hint: "**********",
                          obscureText: confirmObscuredText,
                        ),
                        Positioned(
                          right: 15,
                          child: GestureDetector(onTap: confirmPasswordHideShow, child: Icon(confirmObscuredText ? Icons.visibility_off_rounded : Icons.visibility_rounded, color: Colors.black, size: 18)),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Date of Birth*",
                      style: TextStyle(color: backgroundWhite, fontSize: 15, fontFamily: ROBOTO_MEDIUM),
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
                            selectedDate != "" ? displayDate : "mm/dd/yyyy",
                            style: TextStyle(color: selectedDate != "" ? textBlack : Colors.grey, fontSize: 15.0, fontFamily: ROBOTO_REGULAR),
                          ),
                          IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              selectDate(context);
                            },
                            icon: Image.asset(AppImages().calendarIcon, scale: 3),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Phone*",
                      style: TextStyle(color: backgroundWhite, fontSize: 15, fontFamily: ROBOTO_MEDIUM),
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
                                icon: Image.asset(AppImages().dropdownIcon, scale: 3),
                                value: selectedPhoneCode,
                                items: phoneCodeList
                                    .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: const TextStyle(color: textBlack, fontSize: 15.0, fontFamily: ROBOTO_REGULAR),
                                        )))
                                    .toList(),
                                onChanged: (item) => setState(() => selectedPhoneCode = item),
                                isExpanded: true,
                              ),
                            ),
                          ),
                          Expanded(
                            child: CustomTextField(
                              maxLine: 1,
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
                              style: TextStyle(color: backgroundWhite, fontSize: 15, fontFamily: ROBOTO_MEDIUM),
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
                                  icon: Image.asset(AppImages().dropdownIcon, scale: 3),
                                  value: selectedCountry,
                                  items: countryList
                                      .map((item) => DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: const TextStyle(color: textBlack, fontSize: 15.0, fontFamily: ROBOTO_REGULAR),
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
                              style: TextStyle(color: backgroundWhite, fontSize: 15, fontFamily: ROBOTO_MEDIUM),
                            ),
                            const SizedBox(height: 5),
                            SizedBox(
                              height: 50,
                              width: width / 2 - 30,
                              child: CustomTextField(
                                maxLine: 1,
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
                      style: TextStyle(color: backgroundWhite, fontSize: 15, fontFamily: ROBOTO_MEDIUM),
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
                      style: TextStyle(color: backgroundWhite, fontSize: 15, fontFamily: ROBOTO_MEDIUM),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: RadioListTile(
                              title: Transform.translate(
                                offset: const Offset(-20, 0),
                                child: const Text(
                                  'Male',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(color: backgroundWhite, fontFamily: ROBOTO_REGULAR, fontSize: 15),
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
                        Expanded(
                          child: RadioListTile(
                              title: Transform.translate(
                                offset: const Offset(-20, 0),
                                child: const Text(
                                  'Female',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(color: backgroundWhite, fontFamily: ROBOTO_REGULAR, fontSize: 15),
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
                        Expanded(
                          child: RadioListTile(
                              title: Transform.translate(
                                offset: const Offset(-20, 0),
                                child: const Text(
                                  'Other',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(color: backgroundWhite, fontFamily: ROBOTO_REGULAR, fontSize: 15),
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
                            Get.snackbar("Oops!", "Name required!", icon: const Icon(Icons.error, color: Colors.red), colorText: textBlack, snackPosition: SnackPosition.TOP, backgroundColor: backgroundWhite);
                          } else if (email.text.toString().isEmpty) {
                            Get.snackbar("Oops!", "Email required!", icon: const Icon(Icons.error, color: Colors.red), colorText: textBlack, snackPosition: SnackPosition.TOP, backgroundColor: backgroundWhite);
                          } else if (!isValidEmail.hasMatch(email.text.toString())) {
                            Get.snackbar("Oops!", "Enter valid email address!", icon: const Icon(Icons.error, color: Colors.red), colorText: textBlack, snackPosition: SnackPosition.TOP, backgroundColor: backgroundWhite);
                          } else if (password.text.toString().isEmpty || password.text.length < 6) {
                            Get.snackbar("Oops!", "You have to enter at least 6 digit password!", icon: const Icon(Icons.error, color: Colors.red), colorText: textBlack, snackPosition: SnackPosition.TOP, backgroundColor: backgroundWhite);
                          } else if (password.text.toString() != confirmPassword.text.toString()) {
                            Get.snackbar("Oops!", "Password and ConfirmPassword not match!", icon: const Icon(Icons.error, color: Colors.red), colorText: textBlack, snackPosition: SnackPosition.TOP, backgroundColor: backgroundWhite);
                          } else if (selectedDate == "") {
                            Get.snackbar("Oops!", "Date of Birth required!", icon: const Icon(Icons.error, color: Colors.red), colorText: textBlack, snackPosition: SnackPosition.TOP, backgroundColor: backgroundWhite);
                          } else if (phoneNumber.text.toString().isEmpty || phoneNumber.text.length < 10) {
                            Get.snackbar("Oops!", "Enter valid phoneNumber!", icon: const Icon(Icons.error, color: Colors.red), colorText: textBlack, snackPosition: SnackPosition.TOP, backgroundColor: backgroundWhite);
                          } else if (postalCode.text.toString().isEmpty) {
                            Get.snackbar("Oops!", "Pincode required!", icon: const Icon(Icons.error, color: Colors.red), colorText: textBlack, snackPosition: SnackPosition.TOP, backgroundColor: backgroundWhite);
                          } else if (address.text.toString().isEmpty) {
                            Get.snackbar("Oops!", "Address required!", icon: const Icon(Icons.error, color: Colors.red), colorText: textBlack, snackPosition: SnackPosition.TOP, backgroundColor: backgroundWhite);
                          } else {
                            registerScreenController.register(name.text.toString(), email.text.toString(), password.text.toString(), selectedDate, selectedPhoneCode!, phoneNumber.text.toString(), selectedCountry!, postalCode.text.toString(), address.text.toString(), role);
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
