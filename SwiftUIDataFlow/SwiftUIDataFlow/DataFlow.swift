//
//  DataFlow.swift
//  SwiftUIDataFlow
//
//  Created by 谢佳培 on 2021/1/9.
//

import SwiftUI

struct DataFlow: View
{
    @State var toggleValue = true
    @State var pickerValue = 0
    var pickerOptions = ["步行","自行车","汽车"]
    @State var userInput = ""
    
    var body: some View
    {
        VStack
        {
            Toggle("自动登录", isOn: $toggleValue)
            
            Divider()
            
            Picker("选择器", selection: $pickerValue)
            {
                ForEach(0 ..< pickerOptions.count)
                { index in
                    Text(pickerOptions[index])
                        .tag(index)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Divider()
            
            TextField("输入用户名", text: $userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Divider()
            
            TextView(userInput: $userInput)
            
            Divider()
            
            
        }
    }
}

struct TextView: View
{
    @Binding var userInput: String
    
    var body: some View
    {
        TextField("输入用户名", text: $userInput)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
    }
}

struct DataFlow_Previews: PreviewProvider
{
    static var previews: some View
    {
        DataFlow()
            .environment(\.allowsTightening, true)
            .allowsTightening(true)
    }
}

struct LifeCycleAPP: App
{
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene
    {
        WindowGroup
        {
            DataFlow()
        }
        .onChange(of: scenePhase)
        { newPhase in
            switch newPhase
            {
            case .background:
                print("Background")
            case .inactive:
                print("ForeGround Inactive")
            case .active:
                print("ForeGround Active")
            @unknown default:
                print("Error")
            }
        }
    }
}
