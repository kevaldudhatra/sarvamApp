// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sarvam/screens/myProfileScreen/my_profile_screen_controller.dart';
import 'package:sarvam/utils/const_colors_key.dart';
import 'package:sarvam/utils/const_fonts_key.dart';
import 'package:sarvam/utils/const_image_key.dart';
import 'package:sarvam/widgets/custom_button.dart';
import 'package:sarvam/widgets/loading_view.dart';
import 'package:sarvam/widgets/custom_text_field.dart';
import 'package:flutter/cupertino.dart';

class MyProfileScreenView extends StatefulWidget {
  const MyProfileScreenView({Key? key}) : super(key: key);

  @override
  State<MyProfileScreenView> createState() => _MyProfileScreenViewState();
}

class _MyProfileScreenViewState extends State<MyProfileScreenView> {
  MyProfileScreenController myProfileScreenController = MyProfileScreenController();
  RegExp isValidEmail = RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
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
                      selectedDate = DateFormat('yyyy-MM-dd').format(DateTime.parse(newDate.toString()));
                      displayDate = DateFormat('dd/MM/yyyy').format(DateTime.parse(newDate.toString()));
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
    myProfileScreenController.getUserDetails().then((value) => {
          name.text = myProfileScreenController.userDetails["Name"],
          email.text = myProfileScreenController.userDetails["EmailID"],
          selectedDate = myProfileScreenController.userDetails["DOB"],
          displayDate = DateFormat('dd/MM/yyyy').format(DateTime.parse(myProfileScreenController.userDetails["DOB"])),
          selectedPhoneCode = (myProfileScreenController.userDetails["CountryCode"]).toString().contains("+") ? myProfileScreenController.userDetails["CountryCode"] : "+${myProfileScreenController.userDetails["CountryCode"]}",
          phoneNumber.text = myProfileScreenController.userDetails["Mobile"],
          selectedCountry = myProfileScreenController.userDetails["Country"],
          postalCode.text = myProfileScreenController.userDetails["Pincode"],
          address.text = myProfileScreenController.userDetails["Addr"],
          role = myProfileScreenController.userDetails["Gender"],
          setState(() {}),
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundWhite,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          SizedBox(width: width, child: Image.asset(AppImages().subscriptionBackground1, fit: BoxFit.fill)),
          Container(
            margin: EdgeInsets.only(top: height * 0.25),
            width: width,
            alignment: Alignment.bottomCenter,
            decoration: const BoxDecoration(
              color: backgroundWhite,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Image.asset(AppImages().subscriptionBackground2, fit: BoxFit.fill),
          ),
          Container(
            margin: const EdgeInsets.only(top: 50),
            height: height,
            child: Obx(() {
              if (myProfileScreenController.loading.value) {
                return LoadingDialog();
              } else {
                return GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          height: height * 0.25 - 50,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Row(
                                      children: [
                                        Image.asset(AppImages().backArrow, scale: 3.0, color: backgroundWhite),
                                        const SizedBox(width: 10),
                                        const Text(
                                          "Back",
                                          style: TextStyle(fontSize: 15, fontFamily: ROBOTO_BOLD, color: backgroundWhite),
                                        )
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  Image.asset(AppImages().profileIcon, fit: BoxFit.fill, scale: 3)
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(top: height * 0.05),
                                alignment: Alignment.centerLeft,
                                child: const Text(
                                  "My Profile",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(fontFamily: ROBOTO_BOLD, fontSize: 30, color: backgroundWhite),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
                          width: width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Text(
                                  "Name*",
                                  style: TextStyle(color: textBlack, fontSize: 15, fontFamily: ROBOTO_MEDIUM),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Container(
                                margin: const EdgeInsets.symmetric(horizontal: 5),
                                decoration: const BoxDecoration(
                                    color: backgroundWhite,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12, //New
                                        blurRadius: 5,
                                      ),
                                    ]),
                                child: CustomTextField(
                                  maxLine: 1,
                                  textEditingController: name,
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.next,
                                  hint: "Enter Your Name",
                                ),
                              ),
                              const SizedBox(height: 20),
                              const Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Text(
                                  "Email Address*",
                                  style: TextStyle(color: textBlack, fontSize: 15, fontFamily: ROBOTO_MEDIUM),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Container(
                                margin: const EdgeInsets.symmetric(horizontal: 5),
                                decoration: const BoxDecoration(
                                    color: backgroundWhite,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12, //New
                                        blurRadius: 5,
                                      ),
                                    ]),
                                child: CustomTextField(
                                  maxLine: 1,
                                  textEditingController: email,
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next,
                                  hint: "example@gmail.com",
                                ),
                              ),
                              const SizedBox(height: 20),
                              const Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Text(
                                  "Date of Birth*",
                                  style: TextStyle(color: textBlack, fontSize: 15, fontFamily: ROBOTO_MEDIUM),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Container(
                                height: 50,
                                padding: const EdgeInsets.only(left: 20, right: 8),
                                margin: const EdgeInsets.symmetric(horizontal: 5),
                                decoration: const BoxDecoration(color: backgroundWhite, borderRadius: BorderRadius.all(Radius.circular(10)), boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12, //New
                                    blurRadius: 5,
                                  ),
                                ]),
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
                              const Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Text(
                                  "Phone*",
                                  style: TextStyle(color: textBlack, fontSize: 15, fontFamily: ROBOTO_MEDIUM),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Container(
                                height: 50,
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                margin: const EdgeInsets.symmetric(horizontal: 5),
                                decoration: const BoxDecoration(color: backgroundWhite, borderRadius: BorderRadius.all(Radius.circular(10)), boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12, //New
                                    blurRadius: 5,
                                  ),
                                ]),
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
                                              .map(
                                                (item) => DropdownMenuItem<String>(
                                                  value: item,
                                                  child: Text(
                                                    item,
                                                    style: const TextStyle(color: textBlack, fontSize: 15.0, fontFamily: ROBOTO_REGULAR),
                                                  ),
                                                ),
                                              )
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
                                      const Padding(
                                        padding: EdgeInsets.only(left: 5),
                                        child: Text(
                                          "Country*",
                                          style: TextStyle(color: textBlack, fontSize: 15, fontFamily: ROBOTO_MEDIUM),
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Container(
                                        height: 50,
                                        width: width / 2 - 30,
                                        padding: const EdgeInsets.symmetric(horizontal: 20),
                                        margin: const EdgeInsets.only(left: 5),
                                        decoration: const BoxDecoration(color: backgroundWhite, borderRadius: BorderRadius.all(Radius.circular(10)), boxShadow: [
                                          BoxShadow(
                                            color: Colors.black12, //New
                                            blurRadius: 5,
                                          ),
                                        ]),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                            icon: Image.asset(AppImages().dropdownIcon, scale: 3),
                                            value: selectedCountry,
                                            items: countryList
                                                .map(
                                                  (item) => DropdownMenuItem<String>(
                                                    value: item,
                                                    child: Text(
                                                      item,
                                                      style: const TextStyle(color: textBlack, fontSize: 15.0, fontFamily: ROBOTO_REGULAR),
                                                    ),
                                                  ),
                                                )
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
                                        style: TextStyle(color: textBlack, fontSize: 15, fontFamily: ROBOTO_MEDIUM),
                                      ),
                                      const SizedBox(height: 5),
                                      Container(
                                        height: 50,
                                        width: width / 2 - 30,
                                        margin: const EdgeInsets.only(right: 5),
                                        decoration: const BoxDecoration(color: backgroundWhite, borderRadius: BorderRadius.all(Radius.circular(10)), boxShadow: [
                                          BoxShadow(
                                            color: Colors.black12, //New
                                            blurRadius: 5,
                                          ),
                                        ]),
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
                              const Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Text(
                                  "Address",
                                  style: TextStyle(color: textBlack, fontSize: 15, fontFamily: ROBOTO_MEDIUM),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Container(
                                height: 100,
                                margin: const EdgeInsets.symmetric(horizontal: 5),
                                decoration: const BoxDecoration(color: backgroundWhite, borderRadius: BorderRadius.all(Radius.circular(10)), boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12, //New
                                    blurRadius: 5,
                                  ),
                                ]),
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
                              const Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Text(
                                  "Gender",
                                  style: TextStyle(color: textBlack, fontSize: 15, fontFamily: ROBOTO_MEDIUM),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  SizedBox(
                                    width: 95,
                                    child: RadioListTile(
                                        title: Transform.translate(
                                          offset: const Offset(-20, 0),
                                          child: const Text(
                                            'Male',
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(color: textBlack, fontFamily: ROBOTO_REGULAR, fontSize: 15),
                                          ),
                                        ),
                                        dense: true,
                                        contentPadding: const EdgeInsets.all(0),
                                        selectedTileColor: backgroundCyan,
                                        activeColor: backgroundCyan,
                                        value: "Male",
                                        groupValue: role,
                                        onChanged: (value) {
                                          setState(() {
                                            role = value;
                                          });
                                        }),
                                  ),
                                  SizedBox(
                                    width: 110,
                                    child: RadioListTile(
                                        title: Transform.translate(
                                          offset: const Offset(-20, 0),
                                          child: const Text(
                                            'Female',
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(color: textBlack, fontFamily: ROBOTO_REGULAR, fontSize: 15),
                                          ),
                                        ),
                                        dense: true,
                                        contentPadding: const EdgeInsets.all(0),
                                        selectedTileColor: backgroundCyan,
                                        activeColor: backgroundCyan,
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
                                          offset: const Offset(-20, 0),
                                          child: const Text(
                                            'Other',
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(color: textBlack, fontFamily: ROBOTO_REGULAR, fontSize: 15),
                                          ),
                                        ),
                                        dense: true,
                                        contentPadding: const EdgeInsets.all(0),
                                        selectedTileColor: backgroundCyan,
                                        activeColor: backgroundCyan,
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
                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                height: 50,
                                child: CustomButton(
                                  label: "UPDATE",
                                  labelColor: backgroundWhite,
                                  borderColor: backgroundCyan,
                                  buttonColor: backgroundCyan,
                                  onTap: () async {
                                    if (name.text.toString().isEmpty) {
                                      Get.snackbar("Oops!", "Name required!", icon: const Icon(Icons.error, color: Colors.red), colorText: textBlack, snackPosition: SnackPosition.TOP, backgroundColor: backgroundWhite);
                                    } else if (email.text.toString().isEmpty) {
                                      Get.snackbar("Oops!", "Email required!", icon: const Icon(Icons.error, color: Colors.red), colorText: textBlack, snackPosition: SnackPosition.TOP, backgroundColor: backgroundWhite);
                                    } else if (!isValidEmail.hasMatch(email.text.toString())) {
                                      Get.snackbar("Oops!", "Enter valid email address!", icon: const Icon(Icons.error, color: Colors.red), colorText: textBlack, snackPosition: SnackPosition.TOP, backgroundColor: backgroundWhite);
                                    } else if (selectedDate == "") {
                                      Get.snackbar("Oops!", "Date of Birth required!", icon: const Icon(Icons.error, color: Colors.red), colorText: textBlack, snackPosition: SnackPosition.TOP, backgroundColor: backgroundWhite);
                                    } else if (phoneNumber.text.toString().isEmpty || phoneNumber.text.length < 10) {
                                      Get.snackbar("Oops!", "Enter valid phoneNumber!", icon: const Icon(Icons.error, color: Colors.red), colorText: textBlack, snackPosition: SnackPosition.TOP, backgroundColor: backgroundWhite);
                                    } else if (postalCode.text.toString().isEmpty) {
                                      Get.snackbar("Oops!", "Pincode required!", icon: const Icon(Icons.error, color: Colors.red), colorText: textBlack, snackPosition: SnackPosition.TOP, backgroundColor: backgroundWhite);
                                    } else if (address.text.toString().isEmpty) {
                                      Get.snackbar("Oops!", "Address required!", icon: const Icon(Icons.error, color: Colors.red), colorText: textBlack, snackPosition: SnackPosition.TOP, backgroundColor: backgroundWhite);
                                    } else {
                                      myProfileScreenController.updateUserDetails(name.text.toString(), email.text.toString(), selectedDate, selectedPhoneCode!, phoneNumber.text.toString(), selectedCountry!, postalCode.text.toString(), address.text.toString(), role).then((value) => {
                                            if (value)
                                              {
                                                name.clear(),
                                                email.clear(),
                                                selectedDate = "",
                                                displayDate = "",
                                                selectedPhoneCode = "+91",
                                                phoneNumber.clear(),
                                                selectedCountry = "India",
                                                postalCode.clear(),
                                                address.clear(),
                                                role = "Male",
                                                setState(() {}),
                                              }
                                          });
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            }),
          )
        ],
      ),
    );
  }
}
