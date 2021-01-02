//
//  DetailViewModel.swift
//  App Store Animation
//
//  Created by 中筋淳朗 on 2020/11/21.
//

import SwiftUI

class DetailViewModel: ObservableObject {
    
    @Published var selectedItem: Item = Item(title: "", userName: "", contentImage: "", profileImage: "")
    
    @Published var show = false
}
