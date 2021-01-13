//
//  Poem.swift
//  SwiftUIAnimation
//
//  Created by 谢佳培 on 2021/1/9.
//

import SwiftUI

struct Poem: View
{
    let firstRow = ["似","花","非","花","独","异","芳",","]
    let secondRow = ["谁","家","小","狐","试","新","妆","。"]
    let thirdRow = ["世","味","纷","纭","千","百","变",","]
    let fourthRow = ["争","如","兰","圃","一","枝","香","。"]
    var rows = [[String]]()
    
    
    @State var delayTime = 0.0
    @State var showText: Bool = true
    
    init()
    {
        self.rows = [firstRow, secondRow, thirdRow, fourthRow].reversed()
    }
    
    var body: some View
    {
        HStack(spacing: 10)
        {
            ForEach(0 ..< self.rows.count)
            { index in
                VStack(spacing: 8)
                {
                    ForEach(self.rows[index], id: \.self)
                    { text in
                        Group
                        {
                            Text("\(text)")
                                .font(.custom("FZKai-Z03S", size: 35))
                                .fontWeight(.semibold)
                                .opacity(self.showText ? 1 : 0)
                                .foregroundColor(.black)
                                .onTapGesture {
                                    self.showText.toggle()
                                }
                                .animation(Animation.easeIn(duration: 1.0).delay(Double(self.rows.firstIndex(of: self.rows[3-index])! * 8 + self.rows[index].firstIndex(of: text)!)/4))
                        }
                    }
                }
            }
        }
    }
}

struct Poem_Previews: PreviewProvider
{
    static var previews: some View
    {
        Poem()
    }
}

