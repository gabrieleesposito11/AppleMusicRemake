//
//  Songs.swift
//  AppleMusic
//
//  Created by Gabriele Esposito on 14/11/23.
//

import Foundation
import SwiftUI

struct Songs : Identifiable{
    var id : UUID = UUID()
    var title : String
    var image : String
    var artist : String
}
