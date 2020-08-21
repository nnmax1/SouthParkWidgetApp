//
//  CircularImageView.swift
//  SouthParkWidgetApp
//
//  Created by Admin on 8/21/20.
//

import SwiftUI

struct CircularImageView: View {
    var image : Image
    var body: some View {
        image.resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.blue,lineWidth: 5))
            .shadow(radius: 15)
    }
}

struct CircularImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircularImageView(image:
            Image("cartman"))
    }
}
