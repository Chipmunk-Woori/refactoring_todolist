class SelectedOption {
  SelectedOption(this.options, {this.selectedOption = 0});

  final int selectedOption;
  final List options;

  SelectedOption copyWith({
    int? selectedOption
  }) {
    return SelectedOption(options, selectedOption: selectedOption ?? this.selectedOption);
  }
}