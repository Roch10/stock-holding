//
//  ForeignStockHolding.swift
//  Final Project
//
//  Created by Roch on 11/10/2021.
//

import Foundation

class ForeignStockHolding: StockHolding {
    private var conversionRate: Float
    
    init(conversionRate:Float, purchaseSharePrice: Float, currentSharePrice: Float, numberOfShares: Int,
         companyName: String){
        self.conversionRate = conversionRate
        
        super.init(purchaseSharePrice: purchaseSharePrice, currentSharePrice: currentSharePrice, numberOfShares: numberOfShares, companyName: companyName)
    }
    
    override
    func costInDollars() -> Float {
        let cost = super.costInDollars()
        return cost * conversionRate
    }
    
    override
    func valueInDollars() -> Float {
        let value = super.valueInDollars()
        return value * conversionRate
    }
}
