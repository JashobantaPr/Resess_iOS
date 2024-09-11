class Url {
  static const String baseUrl = 'http://103.119.171.89:7001';

  static const String imageUrl =
      "https://api-ap-south-mum-1.openstack.acecloudhosting.com:8080/recess/Recess/images/";
// Onboarding
  static const String registration = "${baseUrl}/userRegistration";
  static const String userOtp = "${baseUrl}/userOtpVerify";
  static const String createPassword = "${baseUrl}/createNewPassword";
  static const String userLogin = "${baseUrl}/userLogin";
  static const String forgetPassword = "${baseUrl}/forgetPassword";

  // Settings
  static const String termsandconditions = '${baseUrl}/getAllTerms';
  static const String privacypolicy = '${baseUrl}/getAllPrivacy';
  static const String deleteaccount = '${baseUrl}/deleteAccount';
  static const String myPrivacy = '${baseUrl}/myPrivacySettings';
  static const String getmyPrivacy = '${baseUrl}/getPrivacySetting';
  static const String getUsers = '${baseUrl}/getUsers';
  static const String changepassword = '${baseUrl}/changePassword';
  static const String updatedetails = '${baseUrl}/updateDetails';
  static const String UpcomingUserBookings =
      "${baseUrl}/getUpcomingUserBookings";
  static const String getPastUserBookings = "${baseUrl}/getPastUserBookings";
  static const String addRating = "${baseUrl}/addRating";

  // Expert Profile
  static const String getpxpertprofile = '${baseUrl}/getExpertprofile';
  static const String getallaanguages = '${baseUrl}/getAllLanguages';
  static const String getallsubjects = '${baseUrl}/getAllSubject';
  static const String updateexpertprofile = '${baseUrl}/ExpertProfile';
  static const String becomeexpertprofile = '${baseUrl}/becomeAnExpertProfile';
  static const String useronlineoffline = '${baseUrl}/userOnlineOffline';
  static const String getuseronlineoffline = '${baseUrl}/getUserOnlineOffline';
  static const String bookmarkforsubject = '${baseUrl}/bookMarkForSubject';
  static const String getbookmarksubjectbyid =
      '${baseUrl}/getBookMarkSubjectById';
  static const String getbookmarkeduserbyid =
      '${baseUrl}/getBookmarkedUserById';
  static const String bookmarkforuser = '${baseUrl}/bookMarkForUser';
  static const String status = "${baseUrl}/status";
  static const String upcomingData = "${baseUrl}/getPastExpertBookings";

// Dashboard
  static const String getAllApprovedExpertProfile =
      "${baseUrl}/getAllApprovedExpertProfile";
  static const String getAllCategory = "${baseUrl}/getAllCategory";
  static const String getAllSubCategory = "${baseUrl}/getAllSubCategory";
  static const String getMySubject = "${baseUrl}/getMySubjectById";
  static const String getCategoryFilter = "${baseUrl}/getCategoryFilter";
//otherProfile

  static const String userOtherProfile = "${baseUrl}/viewOtherUserProfile";
  static const String getExpertSettingById = "${baseUrl}/getExpertSettingById";
  static const String bookingSession = "${baseUrl}/bookExpert";
  static const String cancelBooking = "${baseUrl}/cancelBooking";

//expert

  static const String getUpcomingExpertBookings =
      "${baseUrl}/getUpcomingExpertBookings";
  static const String getPastExpertBookings =
      "${baseUrl}/getPastExpertBookings";

  static const String uploadImageOrDocuments =
      "${baseUrl}/uploadImageOrDocuments";

  static const String addExpertProfile = "${baseUrl}/becomeAnExpertProfile";
  static const String adminStatus = "${baseUrl}/getBexomeExpertById";
  static const String preBookSession = "${baseUrl}/preBookSession";
  static const String expertProfile = "${baseUrl}/getExpertprofile";

  //notification

  static const String getNotification = "${baseUrl}/getNotification";
  static const String approveSession = "${baseUrl}/expertApprove";
  static const String cancelSession = "${baseUrl}/expertReject";

  //calls

  static const String createChannel = "${baseUrl}/createChannel";
}
