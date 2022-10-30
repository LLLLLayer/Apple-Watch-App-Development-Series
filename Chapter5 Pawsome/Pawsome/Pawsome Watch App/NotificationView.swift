//
//  NotificationView.swift
//  Pawsome Watch App
//
//  Created by yangjie.layer on 2022/10/16.
//

import SwiftUI

struct NotificationView: View {
  let message: String
  let image: Image
    
  var body: some View {
    ScrollView {
      Text(message)
        .font(.headline)
      image
        .resizable()
        .scaledToFit()
    }
  }
}
struct NotificationView_Previews: PreviewProvider {
  static var previews: some View {
    NotificationView(
      message: "QWQ",
      image: Image("cat\(Int.random(in: 1...20))")
    )
  }
}
