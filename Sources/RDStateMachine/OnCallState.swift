class OnCallState: RDState {


  override func isValidNextState(_ state: RDState) -> Bool {
    switch state{
    case is OutOfCreditState, is HangUpState:
      return true
    default:
      print("Wrong action. You can only use your credit or Hang up")
      return false
    }
  }

  override func willExit(to state: RDState) {
    if (state is OutOfCreditState) {
      print("Ran out of credit")
    } else if (state is HangUpState) {
      print("Hanging up")
    }
  }
}
