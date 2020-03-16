
import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible: Bool = false
    @State var whosThereIsVisible: Bool = false
    @State var test: Bool = false
    
    var body: some View {
        VStack {
            
            // Target row
            HStack {
                Text("Put the bullseye as close as you can to:")
                Text("100")
            }
            
            HStack {
                Text("1")
                Slider(value: .constant(100))
                Text("100")
            }
            
            
            Button(action: {
                print("button pressed")
            }) {
                Text("Hit me!")
            }
            
            HStack {
                
                VStack {
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Text(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/)
                    }
                    Text("Start over")
                }
                
                
                VStack {
                    Text("Text")
                    Text("Score:")
                }
                
                VStack {
                    Text("Text")
                    Text("9999")
                }
                
                VStack {
                    Text("Text:")
                    Text("Round")
                    
                }
                
                VStack {
                    Text("Text")
                    Text("9999")
                }
                
                VStack {
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Text(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/)
                    }
                    Text("Info")
                }
                
                
            }
            
            
            // Slider row
            
            // Button row
            //            Button(action: {
            //                print("Button pressed!")
            //                self.alertIsVisible = true
            //            }) {
            //                Text("Button")
            //                    .padding()
            //                    .foregroundColor(Color.white)
            //                    .background(Color.purple)
            //                    .font(.title)
            //            }
            //            .alert(isPresented: $whosThereIsVisible) {
            //                Alert(title: Text("Important message"),
            //                      message: Text("Wear sunscreen"),
            //                      dismissButton: .default(Text("Got it!")))
            //
            //            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}

