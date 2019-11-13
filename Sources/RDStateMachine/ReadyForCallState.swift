class ReadyForCallState: RDState {

  override func isValidNextState(_ state: RDState) -> Bool {
    switch state {
    case is ReadyForCallState, is OnCallState, is HangUpState:
      return true
    default:
      print("Wrong action. You can only add more credit, use your credit (make a call), or Hang up")
      return false
    }
  }

  override func willExit(to state: RDState) {
    if(state is ReadyForCallState) {
      print("Ready for Call")
    } else if(state is OnCallState) {
      print("Making a call")
    } else if(state is ReadyForCallState) {
      print("Hanging up")
    }
  }
}
