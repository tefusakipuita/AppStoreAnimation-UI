//
//  CardView.swift
//  App Store Animation
//
//  Created by 中筋淳朗 on 2020/11/21.
//

import SwiftUI

struct CardView: View {
    
    // MARK: - Property
    
    var item: Item
    
    var animation: Namespace.ID
    
    
    // MARK: - Body
    
    var body: some View {
        VStack (spacing: 0) {
            Image(item.contentImage)
                .resizable()
                .scaledToFill()
                .matchedGeometryEffect(id: item.contentImage, in: animation)
            
            HStack (spacing: 12) {
                Image(item.profileImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 55, height: 55)
                    .cornerRadius(16)
                
                VStack (alignment: .leading, spacing: 6) {
                    Text(item.title)
                        .font(.system(size: 18, weight: .light))
                    Text(item.userName)
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
            .matchedGeometryEffect(id: item.id, in: animation)
            
        } //: VStack
        .frame(width: UIScreen.main.bounds.width - 50)
        .cornerRadius(16)
        .background(
            Color.white
                .cornerRadius(16)
                .shadow(color: Color.black.opacity(0.15), radius: 6)
        )
    }
}

// MARK: - Preview

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
