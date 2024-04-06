import SwiftUI

struct LogInAndSignUp: View {
    
    @State private var showSignup: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.lightBCheck.ignoresSafeArea()
                Login(showSignup: $showSignup)
                    .navigationDestination(isPresented: $showSignup) {
                        SignUp(showSignup: $showSignup)
                    }
            }
            .overlay {
                if #available(iOS 17, *) {
                    CircleView()
                        .animation(.bouncy(duration: 0.45, extraBounce: 0), value: showSignup)
                } else {
                    CircleView()
                        .animation(.easeInOut(duration: 0.3), value: showSignup)
                }
            }
        }
    }
    @ViewBuilder
    func CircleView() -> some View {
        Circle()
            .fill(.linearGradient(colors: [.appYellow, .green1, .blue], startPoint: .top, endPoint: .bottom))
            .frame(width: 200, height: 200)
        
            .offset(x: showSignup ? 90 : -90, y: -90)
            .blur(radius: 15)
            .hSpacing(showSignup ? .trailing : .leading)
            .vSpacing(.top)
    }
}

#Preview {
    ContentView()
}
