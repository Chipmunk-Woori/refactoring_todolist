class SelectedOption {
  SelectedOption(this.options, {this.selectedOption = ''});

  final String selectedOption;
  final List options;

  SelectedOption copyWith({
    List? option,
    String? selectedOption
  }) {
    return SelectedOption(options, selectedOption: selectedOption ?? this.selectedOption);
  }
}