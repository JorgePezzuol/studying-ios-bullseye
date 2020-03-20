import SwiftUI


struct AboutView: View {
    
    
    struct TextStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .font(Font.custom("Arial Rounded MT Bold", size: 16))
                .padding(.top, 20)
                .padding(.bottom, 20)
        }
    }
    
    
    
    
    
    var body: some View {
        
        Group {
            VStack {
                
                Text("👻First swift project, my goal is to be an iOs developer 👻").modifier(TextStyle()).lineLimit(nil)
            }
            .background(Color.init(red: 1, green: 214 / 255, blue: 179 / 255))
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
