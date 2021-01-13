//
//  TextRelatedViews.swift
//  Demo
//
//  Created by 谢佳培 on 2020/12/4.
//

import SwiftUI

struct TextRelatedViews: View
{
    @State var textFieldInput = ""
    @State var secureFieldInput = ""
    @State var textEditorInput = "TextEditor: 支持点击并编辑多行文字"
    
    var body: some View
    {
        VStack(alignment: .leading, spacing: 50.0, content: {
            Text("Text: 仅显示文本，不支持输入")
            
            Label("Label: 显示文本和图标，不支持输入", systemImage: "message")
            
            TextField("TextField: 支持用户输入单行信息", text: $textFieldInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
           SecureField("SecureField: 支持输入，但不明码显示", text: $secureFieldInput).textFieldStyle(RoundedBorderTextFieldStyle())
            
            Link("Link: 点击并跳转链接", destination: URL(string: "http://www.baidu.com")!)
            
            TextEditor(text: $textEditorInput)
        })
        .padding()
    }
}

struct TextRelatedViews_Previews: PreviewProvider
{
    static var previews: some View
    {
        TextRelatedViews()
    }
}
