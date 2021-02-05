//
//  Setting.swift
//  Reader
//
//  Created by 谢佳培 on 2021/1/29.
//

import SwiftUI

struct Setting: View
{
    @Binding var darkMode: Bool
    
    var body: some View
    {
        Button(action: {
            Vibration.selection.vibrate()
            darkMode.toggle()
        }, label: {
            //Text("切换")
            
            Image(systemName: darkMode ? "sun.max.fill" : "moon.fill")
                .font(.system(.headline, design: .rounded))
        })
    }
}

struct Setting_Previews: PreviewProvider
{
    static var previews: some View
    {
        Setting(darkMode: .constant(false))
    }
}
