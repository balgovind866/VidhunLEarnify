import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

const kDefaultPadding=20.0;

const Color kPrimaryColor = Color(0xFF128ba3);
const Color kOtherColor = Color(0xFFF4F6F7);


const sizebox=SizedBox(
  height:kDefaultPadding,
);

const kWidthSizedBox = SizedBox(
  width: kDefaultPadding,
);

const kHalfSizedBox = SizedBox(
  height: kDefaultPadding / 2,
);

const kHalfWidthSizedBox = SizedBox(
  width: kDefaultPadding / 2,
);

final kBottomBorderRadius = BorderRadius.only(
  bottomRight: Radius.circular(SizerUtil.deviceType == DeviceType.tablet ? 40 : 20),
  bottomLeft:
  Radius.circular(SizerUtil.deviceType == DeviceType.tablet ? 40 : 20),
);


