//
//  Delivery.swift
//  Flipped
//
//  Created by yangjie.layer on 2022/9/11.
//

enum Delivery {
    /// 立即交付，失败时不重试
    case failable
    /// 尽快交付，失败时自动重试
    /// 数据的所有实例将按顺序传输
    case guaranteed
    /// 高优先级数据。 只有最近的值
    /// 任何尚未交付的此类转让将被替换使用新的
    case highPriority
}
