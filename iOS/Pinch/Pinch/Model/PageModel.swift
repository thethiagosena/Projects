//
//  PageModel.swift
//  Pinch
//
//  Created by Thiago Sena on 20/02/2025.
//

import Foundation


struct Page: Identifiable {
    let id: Int
    let imageName: String
}


extension Page {
    var thumbnailName: String{
        return "thumb-" + imageName
    }
}
