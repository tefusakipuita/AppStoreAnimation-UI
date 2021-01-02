//
//  Item.swift
//  App Store Animation
//
//  Created by 中筋淳朗 on 2020/11/21.
//

import SwiftUI

struct Item: Identifiable {
    
    var id = UUID().uuidString
    var title: String
    var userName: String
    var contentImage: String
    var profileImage: String
}
