print("Welcome to our payphone!")
let hangUpState = HangUpState()
let waitingForCreditState = WaitingForCreditState()
let readyForCallState = ReadyForCallState()
let onCallState = OnCallState()
let outOfCreditState = OutOfCreditState()
let sm = RDStateMachine(states: [hangUpState, waitingForCreditState, readyForCallState, onCallState, outOfCreditState] )

sm.enter(hangUpState)
mainLoop: while true {
  print("Enter your actions(1. Pick up | 2. Add credit | 3. Put down | 4. Make a call | 5. Exit): ", terminator: "")
  let option = readLine(strippingNewline: true)!

  switch option {
  case "1":
    sm.enter(waitingForCreditState)
  case "2":
    sm.enter(readyForCallState)
  case "3":
    sm.enter(hangUpState)
  case "4":
    if sm.currentState is WaitingForCreditState {
      sm.enter(onCallState)
    } else if sm.currentState is ReadyForCallState {
      sm.enter(onCallState)
    } else if sm.currentState is OnCallState {
      sm.enter(outOfCreditState)
    }
  case "5":
    print("bye bye.")
    break mainLoop
  default:
    print("Invalid option")
  }
}
