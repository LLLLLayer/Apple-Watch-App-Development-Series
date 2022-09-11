//
//  Movie.swift
//  Flipped
//
//  Created by yangjie.layer on 2022/9/10.
//

import SwiftUI

struct Movie: Identifiable {
    
    /// 电影 id
    let id: Int
    
    /// 电影时间
    let time: String
    
    /// 电影名称
    let title: String
    
    /// 电影概要
    let synopsis: String
    
    /// 电影海报
    let poster: String
    
    /// 电影导演
    let director: String
    
    /// 参演演员
    let actors: String
    
    static func preview() -> Self {
        .init(
            id: 23523,
            time: "3:00 PM",
            title: "Africa Screams",
            synopsis: """
            Basic crazy Abbott and Costello movie that also features \
            a couple of the three stooges. Black & White.
            """,
            poster: "africa_screams",
            director: "Charles Barton",
            actors: "Bud Abbot, Lou Costello")
    }
}

extension Movie: Equatable {
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
}

extension Movie: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case id, hour, title, synopsis, poster, director, actors
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        let hour = try values.decode(Int.self, forKey: .hour)
        let date = Calendar.current.date(from: DateComponents(hour: hour)) ?? Date()
        time = date.formatted(.dateTime.hour().minute())
        title = try values.decode(String.self, forKey: .title)
        synopsis = try values.decode(String.self, forKey: .synopsis)
        poster = try values.decode(String.self, forKey: .poster)
        director = try values.decode(String.self, forKey: .director)
        let names = try values.decode([String].self, forKey: .actors)
        actors = names.joined(separator: ", ")
    }
}

extension Movie {
#if os(watchOS)
    func qrCodeImage() -> Image? {
        let path = QRCode.url(for: id).path
        if let image = UIImage(contentsOfFile: path) {
            return Image(uiImage: image)
        } else {
            return Image(systemName: "xmark.circle")
        }
    }
#endif
}
