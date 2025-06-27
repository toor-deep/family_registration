class HeadRegistrationState {
  final String? errorMessage;
  final bool isLoading;

  const HeadRegistrationState({
    this.errorMessage,
    this.isLoading = false,
  });

  HeadRegistrationState copyWith({
    String? errorMessage,
    bool? isLoading,
  }) {
    return HeadRegistrationState(
      errorMessage: errorMessage ?? this.errorMessage,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}