import SwiftUI


struct AboutView: View {
    
    
    struct TextStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .font(Font.custom("Arial Rounded MT Bold", size: 14))
                .foregroundColor(Color.white)
                .padding(.top, 20)
                .padding(.bottom, 20)
                .shadow(color: Color.black, radius: 5, x: 2, y: 2)
        }
    }
    
    
    
    
    
    var body: some View {
        
        Group {
            VStack {
                
                Text("First swift project!").modifier(TextStyle()).lineLimit(nil)
                Text("my goal is to be an iOs developer 👻").modifier(TextStyle()).lineLimit(nil)
                
            }
                
            .navigationBarTitle(Text("About"))
        }
        .background(Image("Background"))
        
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView().previewLayout(.fixed(width: 896, height: 414))
    }
}
