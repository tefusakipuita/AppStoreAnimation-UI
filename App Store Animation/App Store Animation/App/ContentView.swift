//
//  ContentView.swift
//  App Store Animation
//
//  Created by 中筋淳朗 on 2020/11/21.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Property
    
    @Namespace var animation
    
    @ObservedObject var detail = DetailViewModel()
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            
            // MARK: - Home
            ScrollView (showsIndicators: false) {
                VStack (spacing: 24) {
                    
                    // MARK: - Top Bar
                    HStack {
                        Spacer()
                        TopButton(imageName: "paintbrush")
                        Spacer()
                        TopButton(imageName: "scale.3d")
                        Spacer()
                        TopButton(imageName: "camera.filters")
                        Spacer()
                        TopButton(imageName: "selection.pin.in.out")
                        Spacer()
                    } //: HStack
                    .foregroundColor(Color.black.opacity(0.75))
                    .padding(.top, 20)
                    .padding(.bottom, 20)
                    
                    // MARK: - Main
                    ForEach(Data.itemData) { item in
                        CardView(item: item, animation: animation)
                            .onTapGesture(perform: {
                                withAnimation (.spring(response: 0.5, dampingFraction: 0.8, blendDuration: 0.8)) {
                                    detail.show = true
                                    detail.selectedItem = item
                                }
                            })
                    } //: ForEach
                    
                    Spacer()
                } //: VStack
            } //: Scroll
            .opacity(detail.show ? 0 : 1)
            
            
            // MARK: - Detail
            if detail.show {
                DetailView(animation: animation, detail: detail)
            }
            
        } //: ZStack
    }
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
