import 'package:the_new_pitchapp/utility/const_image.dart';
import 'package:the_new_pitchapp/utility/const_string.dart';

const kAnimationDuration = Duration(microseconds: 100);

final constString = ConstString();
final constImage = ConstImage();

const String oneRatingHeader = "Nah!";
const String twoRatingHeader = "Bad";
const String threeRatingHeader = "Neutral";
const String fourRatingHeader = "Good";
const String fiveRatingHeader = "Awesome!";

const String oneRatingContent =
    "Far below my expectations, need immense\nimprovement";
const String twoRatingContent =
    "Could definitely improve as it did not meet\nexpectations";
const String threeRatingContent = "It was not bad but could definitely improve";
const String fourRatingContent = "It was fine but could have been better";
const String fiveRatingContent = "Great experience, absolutely loved it!";

const String oneRatingQuestion = "What went wrong?";
const String twoRatingQuestion = "What went wrong?";
const String threeRatingQuestion = "What went wrong?";
const String fourRatingQuestion = "What could be better?";
const String fiveRatingQuestion = "What did you like?";

List<Map<String, String>> onboardingData = [
  {
    "text": "Get an edge over other buyers",
    "text1":
        "Use Refoyer to make an offer, and we'll back it with our cash to make it stand out to sellers",
    "image": constImage.onboardImage1
  },
  {
    "text": "Get an edge over other buyers",
    "text1":
        "Use Refoyer to make an offer, and we'll back it with our cash to make it stand out to sellers",
    "image": constImage.onboardImage2
  },
  {
    "text": "Get an edge over other buyers",
    "text1":
        "Use Refoyer to make an offer, and we'll back it with our cash to make it stand out to sellers",
    "image": constImage.onboardImage3
  },
];
