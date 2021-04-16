//
//  IAP.swift
//  Reader
//
//  Created by 谢佳培 on 2021/3/21.
//

import SwiftUI
import CoreHaptics

struct IAP: View
{
    @StateObject var store = Store()
    @State var engine: CHHapticEngine?
    
    var body: some View
    {
        ForEach(store.allProducts, id: \.self)
        { product in
            Group
            {
                if !product.isLocked
                {
                    Text("已解锁 Pro 版")
                }
                else
                {
                    if let price = product.price, product.isLocked
                    {
                        HStack
                        {
                            Button(action: {
                                if let product = store.product(for: product.id)
                                {
                                    store.purchaseProduct(product)
                                }
                            }) {
                                Text(price)
                                    .padding(.vertical, 5)
                                    .padding(.horizontal, 15)
                                    .foregroundColor(.orange)
                                    .cornerRadius(12)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 6)
                                            .stroke(Color.orange, lineWidth: 2)
                                    )
                                    .padding(.vertical, 10)
                                    .font(Font.system(size: 19, weight: .semibold))
                            }
                            .buttonStyle(PlainButtonStyle())
                            
                            Spacer()
                            
                            Button(action: { store.restorePurchases() })
                            {
                                Text("恢复购买")
                                    .font(.headline)
                                    .foregroundColor(.orange)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
            }
        }
        .onAppear
        {
            store.loadStoredPurchases()
        }
    }
    
    func createHaptics()
    {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        do
        {
            engine = try CHHapticEngine()
            try engine?.start()
        }
        catch
        {
            print(error.localizedDescription)
        }
    }
    
    func playHapticsFile(named filename: String)
    {
        guard let path = Bundle.main.path(forResource: filename, ofType: "ahap") else { return }

        do
        {
            try engine?.start()
            try engine?.playPattern(from: URL(fileURLWithPath: path))
        }
        catch
        {
            print("当播放AHAP文件的时候发生了错误，文件名为：\(filename)，错误信息为:\(error)")
        }
    }
}
