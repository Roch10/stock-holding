//
//  StockHolding.swift
//  Final Project
//
//  Created by Roch on 11/10/2021.
//

import Foundation

class StockHolding: NSObject {
    private var purchaseSharePrice: Float
    private var currentSharePrice: Float
    private var numberOfShares: Int
    private var companyName: String
    
    init(purchaseSharePrice: Float, currentSharePrice: Float, numberOfShares: Int,
         companyName: String)
    {
        self.purchaseSharePrice = purchaseSharePrice
        self.currentSharePrice = currentSharePrice
        self.numberOfShares = numberOfShares
        self.companyName = companyName
    }
    
    // Create accessor methods for the instance variables.
    func getPurchaseSharePrice() -> Float {
        return purchaseSharePrice
    }
    func setPurchaseSharePrice(purchasePrice:Float) {
        self.purchaseSharePrice = purchasePrice
    }
    
    func getCurrentSharePrice() -> Float {
        return currentSharePrice
    }
    func setCurrentSharePrice(currentPrice:Float) {
        self.currentSharePrice = currentPrice
    }
    
    func getNumberOfShares() -> Int {
        return numberOfShares
    }
    
    func setNumberOfShares(no: Int) {
        self.numberOfShares = no
    }
    
    func getCompanyName() -> String {
        return companyName
    }
    
    func setCompanyName(name:String) {
        self.companyName = name
    }
    
    func printing() -> String {
        return "Purchase Share Price: \(String(describing: getPurchaseSharePrice()))\tCurrent Share Price: \(String(describing: getCurrentSharePrice()))\tNumber of Shares:\(String(describing: getNumberOfShares()))\tCompany Name:\(String(describing: getCompanyName()))"
    }
    // Create two other instance methods
    public func costInDollars()->Float {
        return purchaseSharePrice * Float(numberOfShares)
    }
    
    public func valueInDollars()->Float {
        return currentSharePrice * Float(numberOfShares)
    }
}
