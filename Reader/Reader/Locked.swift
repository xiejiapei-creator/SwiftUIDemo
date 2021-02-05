//
//  Locked.swift
//  Reader
//
//  Created by 谢佳培 on 2021/1/29.
//

import SwiftUI

struct Locked: View
{
    let authorize: () -> ()
    
    var body: some View
    {
        VStack
        {
            Image(systemName: "lock.shield")
                .font(.system(.largeTitle, design: .rounded))
                .padding(.bottom, 50)
            
            Button(action: {
                authorize()
                Vibration.light.vibrate()
            }) {
                Text("轻点再次尝试解锁")
                    .bold()
            }
        }
    }
}

 
