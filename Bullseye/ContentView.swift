
import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible: Bool = false
    @State var whosThereIsVisible: Bool = false
    @State var test: Bool = false
    
    var body: some View {
        HStack {
            
            Button(action: {
                print("Hello World")
                self.whosThereIsVisible = true
            }) {
                Text("Button")
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color.purple)
                    .font(.title)
            }
            Text("Teste")
            .alert(isPresented: $whosThereIsVisible) {
                Alert(title: Text("Important message"),
                      message: Text("Wear sunscreen"),
                      dismissButton: .default(Text("Got it!")))
                    
            }
            Button(action: {
                self.test = true
            }) {
                Text(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/)
                .padding()
                    .foregroundColor(Color.white)
                    .background(Color.blue)
                    .font(.title)
            }
            .alert(isPresented: $test) {
                Alert(title: Text("Test alert"),
                      message: Text("Message"),
                      dismissButton: .default(Text("Dismiss Button")))
            }
            
            .alert(isPresented: $test) {
                Alert(title: Text("Testtttt"),
                      message: Text("messageeeee"),
                      dismissButton: .default(Text("Defaultttt")))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}

