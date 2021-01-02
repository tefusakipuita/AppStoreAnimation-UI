//
//  TopButton.swift
//  App Store Animation
//
//  Created by 中筋淳朗 on 2020/11/21.
//

import SwiftUI

struct TopButton: View {
    
    // MARK: - Property
    
    var imageName: String
    
    
    // MARK: - Body
    
    var body: some View {
        Button(action: {}, label: {
            Image(systemName: imageName)
                .font(.system(size: 24, weight: .light))
        })
    }
}

// MARK: - Preview

struct TopButton_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
