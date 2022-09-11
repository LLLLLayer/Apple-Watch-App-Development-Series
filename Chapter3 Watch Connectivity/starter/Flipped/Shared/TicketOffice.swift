//
//  TicketOffice.swift
//  Flipped
//
//  Created by yangjie.layer on 2022/9/10.
//

import SwiftUI
import Combine

class TicketOffice: ObservableObject {
    
    /// 电影票服务单例
    static let shared = TicketOffice()
    
    /// 上映的电影
    var movies: [Movie]
    
    /// 已购的电影票
    @Published var purchased: [Movie] = [] {
        didSet {
            let ids = purchased.map { $0.id }
            UserDefaults.standard.setValue(ids, forKey: "purchased")
        }
    }
    
    init() {
        // 加载电影
        let decoder = JSONDecoder()
        guard let file = Bundle.main.url(forResource: "Movies", withExtension: "json"),
              let data = try? Data(contentsOf: file),
              let movies = try? decoder.decode([Movie].self, from: data) else {
            fatalError("Can't find Movies!")
        }
        self.movies = movies
        
        // 加载已购的电影票
        let purchasedIds = UserDefaults.standard.array(forKey: "purchased") as? [Int] ?? []
        purchased = movies.filter { purchasedIds.contains($0.id) }
    }
}

extension TicketOffice {
    
    /// 是否已购买某电影电影票
    func isPurchased(_ movie: Movie) -> Bool {
        purchased.contains(movie)
    }
    
    /// 购买电影票
    func purchase(_ movie: Movie) {
        guard !isPurchased(movie) else {
            return
        }
        purchased.append(movie)
    }
    
    /// 删除电影票
    func delete(at offsets: IndexSet) {
        purchased.remove(atOffsets: offsets)
    }
    
    /// 以时间分组的可购买的电影票
    func purchasableMovies() -> [String: [Movie]] {
        let notPurchased = movies.filter { !isPurchased($0) }
        return Dictionary(grouping: notPurchased, by: \.time)
    }
}
