
import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible: Bool = false
    @State var sliderValue: Double = 50.0
    @State var target: Int = Int.random(in: 1...100)
    @State var score: Int = 0
    @State var round: Int = 0
    
    let midnightBlue = Color.init(red: 0.0 / 255.0, green: 51.0 / 255.0, blue: 102.0 / 255.0)
    
    // protocols
    struct TextStyle: ViewModifier {
        
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.white)
                .modifier(ShadowStyle())
                .font(Font.custom("Arial Rounded MT Bold", size: 18))
        }
    }
    
    struct ValueStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.yellow)
                .font(Font.custom("Arial ROunded MT Bold", size: 24))
                .modifier(ShadowStyle())
        }
    }
    
    struct ShadowStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .shadow(color: Color.black, radius: 5, x: 2, y: 2)
        }
    }
    
    struct ButtonSmallTextStyle: ViewModifier {
        
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.black)
                .font(Font.custom("Arial Rounded MT Bold", size: 12))
        }
    }
    
    struct ButtonLargeTextStyle: ViewModifier {
        
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.black)
                .font(Font.custom("Arial Rounded MT Bold", size: 18))
        }
    }
    
    var body: some View {
        VStack {
            
            Spacer()
            
            // Target row
            HStack {
                Text("Put the bullseye as close as you can to:").modifier(TextStyle())
                Text("\(self.target)").modifier(ValueStyle())
            }
            
            Spacer()
            
            HStack {
                Text("1").modifier(TextStyle())
                Slider(value: self.$sliderValue, in: 1...100).accentColor(Color.green)
                Text("100").modifier(TextStyle())
            }
            
            Spacer()
            
            Button(action: {
                self.alertIsVisible = true
                
            }) {
                Text("Hit me!")
            }
            .background(Image("Button")).modifier(ButtonLargeTextStyle())
                
            .alert(isPresented: $alertIsVisible) {
                
                let roundedValue: Int = Int(self.sliderValue.rounded())
                let points = self.pointsForCurrentRound()
                
                return Alert(title: Text("\(self.alertTitle()) Value of the slider: \(roundedValue)"),
                             message: Text("You scored: \(points) this round"),
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
                    self.sliderValue = 50.0
                    self.target = Int.random(in: 1...100)
                }) {
                    HStack {
                        Image("StartOverIcon")
                        Text("Start over")
                    }
                    
                }
                .background(Image("Button")).modifier(ButtonSmallTextStyle())
                Spacer()
                Text("Score:").modifier(TextStyle())
                Text("\(self.score)").modifier(ValueStyle())
                Spacer()
                Text("Round:").modifier(TextStyle())
                Text("\(self.round)").modifier(ValueStyle())
                Spacer()
                
                NavigationLink(destination: AboutView()) {
                    HStack {
                        Image("InfoIcon")
                        Text("Info")
                    }
                    
                }
                .background(Image("Button")).modifier(ButtonSmallTextStyle())
                
            }
            .padding(.bottom, 20)
        }
            
        .background(Image("Background"), alignment: .center)
        .accentColor(midnightBlue)
        .navigationBarTitle(Text("Bullseye"))
    }
    
    func pointsForCurrentRound() -> Int {
        
        let diff = abs(self.target - Int(self.sliderValue.rounded()))
        let bonus: Int
        
        if diff == 0 {
            bonus = 100
        }
        else if diff == 1 {
            bonus = 50
        }
        else {
            bonus = 0
        }
        
        return 100 - diff + bonus
    }
    
    
    func alertTitle() -> String {
        
        let title: String
        let diff = abs(self.target - Int(self.sliderValue.rounded()))
        
        if diff == 0 {
            title = "Perfect!"
        }
        else if diff < 5 {
            title = "Almost there"
        }
        else if diff <= 10 {
            title = "che figo!"
        }
        else {
            title = "Are you even trying?"
        }
        
        return title
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}

