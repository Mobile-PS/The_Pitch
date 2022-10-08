class ApiConstants {
  final serviceKey = '67shxa42pm9ho574c6wq';
  final clientId = '0';

  Map<String, String> getHeader() => {
    'Content-Type': 'application/json',
  };
  Map<String, String> getHeader1(String token) => {
    'Authorization': token,
    'Content-Type': 'application/json',
  };

  final baseUrl = 'https://thepitchdev.azurewebsites.net/api/';
  final blobProfileUrl = 'https://thestoragepitch.blob.core.windows.net/';


  String candidateUrl() => baseUrl + 'v1/EmployerJob/search-candidates';

  String employerUrl() => baseUrl + 'v1/EmployerProfile/search-employers';

  String getOtpUrl() => baseUrl + 'identity/generate-verification-code';
  String verifyOtpUrl() => baseUrl + 'identity/validate-verification-code';
  String sendRegDataUrl() => baseUrl + 'identity/register';
  String verifyLoginUrl() => baseUrl + 'identity/token';
  String getProfileDataUrl(String version,int type) => baseUrl + '$version/CandidateProfile/get-candidate-profile?ProfileId=$type';
  String getCountryDataUrl(String version) => baseUrl + '$version/Location/countries';
  String getStateDataUrl(String version,int countryId) => baseUrl + '$version/Location/states?countryId=$countryId';
  String getCityDataUrl(String version,int stateId) => baseUrl + '$version/Location/cities?stateId=$stateId';
  String getZipCodeDataUrl(String version,int zipCode) => baseUrl + '$version/Location/city-by-zipcode?zipCode=$zipCode';
  String getUserDataUrl(String version) => baseUrl + '$version/User/GetCurrentUser';
  String saveUserDataUrl(String version) => baseUrl + '$version/CandidateProfile/create';
  String updateUserDataUrl(String version) => baseUrl + '$version/CandidateProfile/update';

  String getEmpDataUrl(String version) => baseUrl + '$version/JobDetail/get-jobdetail-dropdowns';
  String getSkillDataUrl(String version,String token,String serchterm,int pagesize,int pagnum) => baseUrl + '$version/SkillSet/get-skills?SearchTerm=$serchterm&PageNumber=$pagnum&PageSize=$pagesize';
  String saveProfessionalDataUrl(String version) => baseUrl + '$version/JobDetail/create-jobdetail';
  String updateProfessionalDataUrl(String version) => baseUrl + '$version/JobDetail/update-jobdetail';

  String saveResumeDataUrl(String version) => baseUrl + '$version/CandidateProfile/update-resume-video-path';
  String getIndustryDataUrl(String version) => baseUrl + '$version/IndustryType/get-industries';

  String saveComapnyDataUrl(String version) => baseUrl + '$version/EmployerProfile/create';
  String saveAddressUrl(String version) => baseUrl + '$version/EmployerAddress/create';

  String saveBusinessVideoUrl(String version) => baseUrl + '$version/EmployerProfile/update-video-path';


  final tagCuisine = "Cuisine/Region";
  final tagDiet = "Diet";
  final tagKitchenEquipments = "Kitchen Equipments";
  final tagSkillLevel = "Skill level";
  final tagSpiceLevel = "Spice level";
  final tagTypeOfCourse = "Type of course";
  final tagTypeOfMeal = "Type of meal";
  final tagNutritionValue = "Nutritional Value";

  final paramName = 'name';
  final paramEmail = 'email';
  final paramOtp = 'otp';

  final paramFirstname = 'firstName';
  final paramLastname = 'lastName';
  final paramPassword = 'password';
  final paramconfirmPassword = 'confirmPassword';
  final parmUserType = 'userType';
  final paramLoginportal = 'loginPortal';


  final paramMob = 'mobileNumber';
  final paramPhotoPath = 'photoPath';
  final paramAdress1 = 'addressLine1';
  final paramAdress2 = 'addressLine2';
  final paramCity = 'cityId';
  final paramState = 'stateId';
  final paramCountry = 'countryId';
  final paramZipcode = 'zipCode';
  final paramProfileId = 'profileId';



  final candidateId = "candidateProfileId";
  final jobtitle ="jobTitle";
  final profilesummary ="profileSummary";
  final experience = "experience";
  final emptypeId= "employmentTypeId";
  final locationID=  "workLocationTypeId";
  final skillID= "skillIds";
  final otherSkill = "otherSkills";
  final skillID1 = "masterskillids";
  final profileId = "profileId";
  final resumepath = "resumePath";
  final videopath = "videoPath";
  final currentSalary = "currentSalary";
  final expectedSalary = "expectedSalary";

  final jobdetailId = "jobDetailId";
  final videosource = "videoSource";



  final paramUid = 'firebase_uid';
  final paramId = 'id';
  final paramDeviceId = 'device_id';
  final paramPhoneNo = 'phone_number';
  final paramLatitude = 'latitude';
  final paramLongitude = 'longitude';
  final paramUserName = 'user_name';
  final paramPreferredTags = 'preferred_tags';
  final paramAuthorId = 'author_id';
  final paramToFollow = 'to_follow';
  final paramDishId = 'dish_id';
  final paramDishRating = 'dish_rating';
  final paramStepReview = 'step_review';
  final paramComment = 'comment';
  final paramParentCommentId = 'parent_comment_id';
  final paramTagId = 'tag_id';
  final paramTagName = 'tag_name';
  final paramVideoId = 'video_id';
  final paramInfoType = 'info_type';
  final paramAuthorName = 'author_name';
  final paramChannelDescription = 'channel_description';
  final paramChannelUrl = 'channel_url';
  final paramLogoUrl = 'logo_url';
  final paramChannelEmail = 'channel_email';
  final paramChannelLink = 'channel_link';
  final paramLanguage = 'language';
  final paramBankName = 'bank_name';
  final paramAccountNumber = 'account_number';
  final paramIfscCode = 'ifsc_code';
  final paramAccountHolderName = 'account_holder_name';
  final paramIsLike = 'is_like';
  final paramVideoUrl = 'video_url';
  final paramVideoTitle = 'video_title';
  final paramVideoDesc = 'video_description';
  final paramThumbnailUrl = 'thumbnail_url';
  final paramProductList = 'products_list';
  final paramDietTagId = 'diet_tag_id';
  final paramData = 'data';
  final paramQuery = 'query';
  final paramNutrientCategory = 'nutrient_category';
  final paramIngredientId = 'ingredient_ids';
  final paramNutrientCategoryId = 'nutrient_id';
  final paramEqupimentId = 'equipment_tag_id';
  final paramIngridentId = 'equipment_tag_id';
  final productId = 'product_id';
  final productIdList = 'product_id_list';

  final tagTypeQuickSearch = 'Quick Search';
  final paramTagType = "tag_type";
  final paramPageNo = "page_no";
  final paramFilter = "filters";
  final paramImageUrl = "image_url";

  final paramDietFilterTagIds = "diet_filter_tag_ids";
  final paramCuisineFilterTagIds = "cuisine_filter_tag_ids";
  final paramCourseTypeFilterIds = "course_type_filter_ids";
  final paramMealTypeFilterIds = "meal_type_filter_ids";
  final paramNutritionalValueFilterIds = "nutritional_value_filter_ids";
  final paramMaxTime = "max_time";
  final paramMinCalories = "min_calories";
  final paramMaxCalories = "max_calories";

  final paramUnpreferredIngredients = "unpreferred_ingredients";
  final paramUnpreferredTags = "unpreferred_tags";
  final paramPreferredDishesTags = "preferred_dishes";
  final paramunpreferredDishesTags = "unpreferred_dishes";
  final paramPreferredIngredientsTags = "preferred_ingredients";

  final cropImage = "Crop Image";

}
