class ApiEndpoints {
  static const String baseUrl =
          'http://103.119.171.89:7001/',
      emailSignup = 'auth/email-signup',
      emailVerification = 'auth/verify-email',
      onboardComplete = 'auth/user-onboard',
      socialLogin = 'auth/social-login',
      userLogin = 'auth/login', uploadProfileImage = 'upload/profile-pic',
      uploadDocs = 'upload/documents',
      expertProfile = 'getExpertprofile',
      setExpertProfile = '${baseUrl}/becomeAnExpertProfile';
}
