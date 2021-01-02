//
//  DetailView.swift
//  App Store Animation
//
//  Created by 中筋淳朗 on 2020/11/21.
//

import SwiftUI

struct DetailView: View {
    
    // MARK: - Property
    
    var animation: Namespace.ID
    
    @ObservedObject var detail: DetailViewModel
    
    @State var scale: CGFloat = 1
    
    
    // MARK: - Body
    
    var body: some View {
        
        ScrollView {
            VStack (spacing: 0) {

                // MARK: - Main Image
                ZStack (alignment: .topTrailing) {
                    Image(detail.selectedItem.contentImage)
                        .resizable()
                        .scaledToFill()
                        .matchedGeometryEffect(id: detail.selectedItem.contentImage, in: animation)
                        .frame(width: UIScreen.main.bounds.width, height: 400)

                    Button(action: {
                        withAnimation {
                            detail.show = false
                        }
                    }, label: {
                        Image(systemName: "multiply")
                            .font(.system(size: 23))
                            .foregroundColor(.white)
                            .padding(10)
                            .background(
                                Color.black.opacity(0.7)
                                    .clipShape(Circle())
                            )
                    }) //: Button
                    .padding()
                    .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                    .opacity((Double(scale) - 0.9) / 0.1)
                } //: ZStack
                // DragGesture
                .gesture(
                    DragGesture(minimumDistance: 0)
                        .onChanged({ value in
                            onChanged(value: value)
                        })
                        .onEnded({ value in
                            onEnded(value: value)
                        })
                ) //: gesture

                // MARK: - User & Image Info
                HStack (spacing: 12) {
                    Image(detail.selectedItem.profileImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 55, height: 55)
                        .cornerRadius(16)

                    VStack (alignment: .leading, spacing: 6) {
                        Text(detail.selectedItem.title)
                            .font(.system(size: 18, weight: .light))
                        Text(detail.selectedItem.userName)
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                    } //: VStack

                    Spacer()

                    Button(action: {}, label: {
                        Text("購入")
                            .kerning(4)
                            .font(.system(size: 16, weight: .semibold))
                            .padding()
                            .frame(width: 100)
                            .background(
                                Color.black.opacity(0.05)
                                    .clipShape(Capsule())
                            )
                    }) //: Button
                } //: HStack
                .padding()
                .matchedGeometryEffect(id: detail.selectedItem.id, in: animation)

                // MARK: - Detail Text
                Text("text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text ")
                    .foregroundColor(Color.black.opacity(0.75))
                    .font(.system(size: 18))
                    .padding()

                Spacer()
            } //: VStack
            .frame(width: UIScreen.main.bounds.width)
            .background(Color.white)

        } //: Scroll
        .scaleEffect(scale)
        .ignoresSafeArea()
        
    }
    
    
    // MARK: - Function
    
    func onChanged(value: DragGesture.Value) {
        let dragHeight = value.translation.height
        
        if scale > 0.8 && 1 >= scale {
            scale = 1 - dragHeight / UIScreen.main.bounds.height
        }
    }
    
    func onEnded(value: DragGesture.Value) {
        
        withAnimation {
            if scale < 0.9 {
                detail.show = false
            } else {
                scale = 1
            }
        }
    }
    
}

// MARK: - Preview

struct DetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
