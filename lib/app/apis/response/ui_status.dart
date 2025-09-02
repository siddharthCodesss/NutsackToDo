class UIStatus {
  bool? isOnScreenLoading;
  bool? isDialogLoading;
  String? successWithAlertMessage;
  String? successWithoutAlertMessage;
  String? failureWithAlertMessage;
  String? failureWithoutAlertMessage;
  String? otpSentSuccessfully;
  String? otpSentFailure;
  String? otpVerifySuccess;
  String? otpVerifyFailure;
  bool? doNavigation;
  bool? isRideCancelled;
  String? alertMessage;
  bool? isBack;
  bool? connectionStatus;
  bool? goToHome;

  UIStatus({
    this.isOnScreenLoading = false,
    this.doNavigation = false,
    this.isDialogLoading,
    this.successWithAlertMessage = '',
    this.successWithoutAlertMessage = '',
    this.failureWithAlertMessage = '',
    this.otpSentSuccessfully = '',
    this.otpSentFailure = '',
    this.otpVerifySuccess = '',
    this.otpVerifyFailure = '',
    this.failureWithoutAlertMessage = '',
    this.isRideCancelled = false,
    this.alertMessage = '',
    this.isBack = false,
    this.connectionStatus = false,
    this.goToHome = false
  });
}
