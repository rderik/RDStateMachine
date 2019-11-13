class HangUpState: RDState {

  override func isValidNextState(_ state: RDState) -> Bool {
    switch state {
    case is WaitingForCreditState:
      return true
    default:
      print("Wrong action. You can only pickup the phone")
      return false
    }
  }

  override func willExit(to state: RDState) {
    print("Picking up the phone")
  }
}
