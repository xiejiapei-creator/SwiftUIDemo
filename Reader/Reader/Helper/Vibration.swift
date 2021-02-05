//
//  Vibration.swift
//  Reader
//
//  Created by 谢佳培 on 2021/1/29.
//

import SwiftUI

enum Vibration
{
    case error
    case success
    case light
    case selection

    func vibrate()
    {
        switch self
        {
        case .error:
            UINotificationFeedbackGenerator().notificationOccurred(.error)
            
        case .success:
            UINotificationFeedbackGenerator().notificationOccurred(.success)
            
        case .light:
            UIImpactFeedbackGenerator(style: .light).impactOccurred()
            
        case .selection:
            UISelectionFeedbackGenerator().selectionChanged()
        }
    }
}
