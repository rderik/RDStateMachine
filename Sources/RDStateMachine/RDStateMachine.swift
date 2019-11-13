public class RDStateMachine {

  private(set) var currentState: RDState?
  var states: [RDState]

  init(states: [RDState]) {
    self.states = states
    self.currentState = nil
  }

  func enter(_ state: RDState) -> Bool {
    if currentState == nil {
      currentState = state
      return true
    } else if !currentState!.isValidNextState(state) {
      return false 
    }
    currentState!.willExit(to: state)
    currentState = state
    return true
  }
}
