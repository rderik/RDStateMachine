class OutOfCreditState: RDState {

  override func isValidNextState(_ state: RDState) -> Bool {
    switch state {
    case is ReadyForCallState, is HangUpState:
      return true
    default:
      print("Wrong action. You can only add more credit or Hang up")
      return false
    }
  }

  override func willExit(to state: RDState) {
    if(state is ReadyForCallState) {
      print("Ready for Call")
    } else if(state is HangUpState) {
      print("Hanging up")
    }
  }
}
