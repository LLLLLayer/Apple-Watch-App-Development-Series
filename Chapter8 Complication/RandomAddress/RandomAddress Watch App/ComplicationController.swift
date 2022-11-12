//
//  ComplicationController.swift
//  RandomAddress Watch App
//
//  Created by yangjie.layer on 2022/11/12.
//

import ClockKit

class ComplicationController: NSObject, CLKComplicationDataSource {
    func currentTimelineEntry(
        for complication: CLKComplication
    ) async -> CLKComplicationTimelineEntry? {
        guard complication.family == .graphicCircular,
              let address = Model.shared.address else {
            return nil
        }
        let template = CLKComplicationTemplateGraphicCircularStackImage(
            line1ImageProvider: .init(fullColorImage: UIImage(systemName: "xmark")!.withTintColor(.white)),
            line2TextProvider: .init(format: address.city))
        return .init(date: Date(), complicationTemplate: template)
    }
    
    func complicationDescriptors() async -> [CLKComplicationDescriptor] {
        return [
            .init(identifier: "layer.practice.RandomAddress",
                  displayName: "RandomAddress",
                  supportedFamilies: [.graphicCircular])
        ]
    }
    
    func localizableSampleTemplate(
        for complication: CLKComplication
    ) async -> CLKComplicationTemplate? {
        guard complication.family == .graphicCircular,
              let image = UIImage(systemName: "xmark")?.withTintColor(.white)
        else { return nil }
        return CLKComplicationTemplateGraphicCircularStackImage(
            line1ImageProvider: .init(fullColorImage: image),
            line2TextProvider: .init(format: "hhh"))
    }
}
