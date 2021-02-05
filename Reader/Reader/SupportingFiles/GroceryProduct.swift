//
//  GroceryProduct.swift
//  Reader
//
//  Created by 谢佳培 on 2021/1/20.
//

import Foundation

struct GroceryProduct: Codable
{
    var name: String
    var points: Int
    var description: String?
}

func encoderGroceryProduct()
{
    let pear = GroceryProduct(name: "Pear", points: 250, description: "A ripe pear.")

    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted

    do
    {
        let data = try encoder.encode(pear)
        print(String(data: data, encoding: .utf8)!)
    }
    catch
    {
        print("error.")
    }
}

func decoderGroceryProduct()
{
    let json = """
    {
        "name":"Durian",
        "points":600,
        "description":"A fruit with a distinctive scent."
    },
    """.data(using: .utf8)!
    
    let decoder = JSONDecoder()
    do
    {
        let product = try decoder.decode(GroceryProduct.self, from: json)
        print(product.name)
    }
    catch
    {
        print("error.")
    }
}
