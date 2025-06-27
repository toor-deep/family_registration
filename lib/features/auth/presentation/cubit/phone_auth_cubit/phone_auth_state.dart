class PhoneAuthState {
  final String? verificationId;
  final String? errorMessage;
  final bool isLoading;

  const PhoneAuthState({
    this.verificationId,
    this.errorMessage,
    this.isLoading = false,
  });

  PhoneAuthState copyWith({
    String? verificationId,
    String? errorMessage,
    bool? isLoading,
  }) {
    return PhoneAuthState(
      verificationId: verificationId ?? this.verificationId,
      errorMessage: errorMessage ?? this.errorMessage,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}