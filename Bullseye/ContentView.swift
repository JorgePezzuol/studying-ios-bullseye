
import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible: Bool = false
    @State var sliderValue: Double = 50.0
    @State var target: Int = Int.random(in: 1...100)
    @State var score: Int = 0
    @State var round: Int = 0
    
    var body: some View {
        VStack {
            
            Spacer()
            
            // Target row
            HStack {
                Text("Put the bullseye as close as you can to:")
                Text("\(self.target)")
            }
            
            Spacer()
            
            HStack {
                Text("1")
                Slider(value: self.$sliderValue, in: 1...100)
                Text("100")
            }
            
            Spacer()
            
            Button(action: {
                self.alertIsVisible = true
                
            }) {
                Text("Hit me!")
            }
                
            .alert(isPresented: $alertIsVisible) {
                
                let roundedValue: Int = Int(self.sliderValue.rounded())
                
                return Alert(title: Text("Value of the slider: \(roundedValue)"),
                             message: Text("You scored: \(self.pointsForCurrentRound())"),
                             dismissButton: .default(Text("OK")) {
                                
                                self.target = Int.random(in: 1...100)
                                self.score += self.pointsForCurrentRound()
                                self.round += 1
                                
                    })
            }
            
            Spacer()
            
            HStack {
                
                Button(action:{
                    self.round = 0
                    self.score = 0
                }) {
                    Text("Start over")
                }
                Spacer()
                Text("Score:")
                Text("\(self.score)")
                Spacer()
                Text("Round:")
                Text("\(self.round)")
                Spacer()
                
                Button(action: {}) {
                    Text("Info")
                }
            }
            .padding(.bottom, 20)
        }
    }
    
    func pointsForCurrentRound() -> Int {
        
        return 100 - abs(self.target - Int(self.sliderValue.rounded()))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}

