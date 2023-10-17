//Class to calculate the values provided in the calculator which we show in the screen
class Calculator {
  double _currentValue = 0.0;
  StringBuffer _currentString = StringBuffer('0');

  //Add char to string when user clicks on any button in soft calculator shown on the screen
  double inputDigit(String digit) {
    if (digit == '.') {
      if (_currentString.toString().contains('.')) {
        // Ignore additional periods
        return _currentValue;
      } else {
        _currentString.write(digit);
      }
    } else {
      _currentString.write(digit);
    }

    // Convert the current string to a double and update the current value
    _currentValue = double.tryParse(_currentString.toString()) ?? 0.0;

    _currentValue = convertValueToTwoDecimal(_currentValue);

    return _currentValue;
  }

  //Convert normal double value to 2 decimals double number
  double convertValueToTwoDecimal(double value) {
    var formatted = value.toStringAsFixed(2);
    return double.tryParse(formatted) ?? 0.0;
  }

  //Returns current value of the entered string
  double currentValue() {
    return _currentValue;
  }

  //Reset all things for the calculator
  double resetCalculator() {
    _currentString = StringBuffer('0');
    _currentValue = 0.0;
    return _currentValue;
  }
}
