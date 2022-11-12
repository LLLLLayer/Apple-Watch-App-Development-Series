//
//  Model.swift
//  RandomAddress Watch App
//
//  Created by yangjie.layer on 2022/11/12.
//

import SwiftUI
import ClockKit

struct Address: Decodable {
    var city: String
}

class Model {
    static let shared = Model()
    var address: Address?
    
    func getAddress() async {
        let (data, _) = try! await URLSession.shared.data(from: URL(string: "https://random-data-api.com/api/v2/addresses")!)
        address = try! JSONDecoder().decode(Address.self, from: data)
        print(address!.city)
        DispatchQueue.main.async {
            let server = CLKComplicationServer.sharedInstance()
            server.activeComplications?.forEach {
                server.reloadTimeline(for: $0)
            }
        }
    }
}
