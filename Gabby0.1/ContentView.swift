import SwiftUI

struct ContentView: View {
    @State private var isRecording = false
    @State private var capturedText: String = "Translation Placeholder"
    
    var body: some View {
            VStack(spacing: 30) {
                // Microphone Button
                Button(action: {
                    withAnimation {
                        isRecording.toggle()
                    }
                    print("Recording state changed to : \(isRecording)")
                    // Placeholder for start/stop recording action
                }) {
                    Image(systemName: isRecording ? "mic.fill" : "mic")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .foregroundColor(isRecording ? .red : .blue)
                        .padding()
                        .background(Color(UIColor.systemGray5))
                        .clipShape(Circle())
                        .shadow(radius: isRecording ? 10 : 5)
                        .scaleEffect(isRecording ? 1.1 : 1.0)
                }
            //Add recording indicator
                if isRecording{
                Text("Translating...")
                        .foregroundColor(.red)
                        .font(.headline)
                        .transition(.opacity)
                }
                
            //Text Area
            ScrollView {
                Text(capturedText)
                    .font(.system(size:18, weight: .regular, design: .default))
                    .foregroundColor(.primary)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                    .shadow(radius: 2)
                    .padding(.horizontal)
            }
        }
            .padding(.top, 50)
            .padding(.bottom, 50)
    }
}

#Preview {
    ContentView()
}
