import SwiftUI

struct ContentView: View {

    @State private var showCard = false
    @Namespace private var animation

    var body: some View {
        VStack {
            Spacer()
            if showCard {
                ZStack(alignment: .topLeading) {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(.blue)
                        .frame(maxHeight: 400)
                        .matchedGeometryEffect(id: "RoundedRectangle", in: animation)
                    Button(action: {
                        withAnimation {
                            showCard.toggle()
                        }
                    }, label: {
                        HStack {
                            Image(systemName: "arrowshape.backward.fill")
                            Text("Back")
                        }
                        .opacity(showCard ? 1 : 0)
                    })
                    .foregroundColor(.white)
                    .offset(x: 16, y: 16)
                    .matchedGeometryEffect(id: "Text", in: animation)
                }
                .padding(32)
                Spacer()
            } else {
                HStack() {
                    Spacer()
                    Button(action: {
                        withAnimation {
                            showCard.toggle()
                        }
                    }, label: {
                        Text("Open")
                            .foregroundColor(.white)
                            .opacity(showCard ? 0 : 1)
                            .frame(minWidth: 80, minHeight: 40)
                            .matchedGeometryEffect(id: "Text", in: animation)
                            .background(RoundedRectangle(cornerRadius: 16)
                                .fill(.blue)
                                .matchedGeometryEffect(id: "RoundedRectangle", in: animation)
                            )
                    })
                }
                .padding(16)
            }
        }
    }
}

#Preview {
    ContentView()
}
