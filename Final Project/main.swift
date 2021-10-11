import Foundation

// Number 1
var stocks = [StockHolding]()
stocks.append(StockHolding(purchaseSharePrice:123.5, currentSharePrice:245.9,
                           numberOfShares: 100, companyName: "Tesla"))
stocks.append(StockHolding(purchaseSharePrice:224.6, currentSharePrice:195.9,
                           numberOfShares: 75, companyName: "Reliance"))
stocks.append(StockHolding(purchaseSharePrice:200.0, currentSharePrice:296.7,
                           numberOfShares: 150, companyName: "Infosys"))
stocks.append(StockHolding(purchaseSharePrice:195.0, currentSharePrice:102.5,
                           numberOfShares: 50, companyName: "Tata Motors"))
stocks.append(StockHolding(purchaseSharePrice:111.5, currentSharePrice:221.9,
                           numberOfShares: 100, companyName: "Walmart"))
stocks.append(StockHolding(purchaseSharePrice:243.0, currentSharePrice:253.9,
                           numberOfShares: 25, companyName: "Air Canada"))
stocks.append(StockHolding(purchaseSharePrice:125.6, currentSharePrice:135.2,
                           numberOfShares: 29, companyName: "Enbridge"))
stocks.append(StockHolding(purchaseSharePrice:345.5, currentSharePrice:700.5,
                           numberOfShares: 50, companyName: "Bank of Montreal"))
stocks.append(StockHolding(purchaseSharePrice:456.5, currentSharePrice:235.5,
                           numberOfShares: 70, companyName: "TC Energy"))
stocks.append(StockHolding(purchaseSharePrice:674.1, currentSharePrice:921.4,
                           numberOfShares: 80, companyName: "Fortis Inc."))
stocks.append(StockHolding(purchaseSharePrice:412.5, currentSharePrice:934.5,
                           numberOfShares: 100, companyName: "Barric Gold"))

func printSortedArray(isReversed:Bool = false) {
    var sortedStockHolding = stocks.sorted ( by: {
        $0.getCompanyName().lowercased() < $1.getCompanyName().lowercased()
    })
    if isReversed {
        sortedStockHolding = sortedStockHolding.reversed()
    }
    print("The stocks sorted by company name in alphabetical order are as follows:")
    sortedStockHolding.forEach { (stockHolding) in
        print(stockHolding.getCompanyName())
    }
}

printSortedArray()
print("\n*************\n")

// Number 2
stocks.append(ForeignStockHolding(conversionRate: 1.23, purchaseSharePrice: 345.34, currentSharePrice: 347.2, numberOfShares: 5, companyName: "Apple"))
stocks.append(ForeignStockHolding(conversionRate: 2.5, purchaseSharePrice: 422.5, currentSharePrice: 410.6, numberOfShares: 2, companyName: "Samsung"))
stocks.append(ForeignStockHolding(conversionRate: 0.45, purchaseSharePrice: 143.56, currentSharePrice: 145.7, numberOfShares: 8, companyName: "Huwaie"))
printSortedArray(isReversed: true)
print("\n*************\n")

//Numbre 3
print("How many stocks do you want to add?")
let noOfStocks = Int(readLine()!)!

for _ in 1...noOfStocks {
    print("Enter stock type: \n1 - Stock Holding \n2 - Foreign Stock Holding")
    let type = Int(readLine()!)!
    print("Enter company name:")
    let companyName = readLine()!
    print("Enter number of shares:")
    let numberOfShares = Int(readLine()!)!
    print("Enter purchase share price:")
    let purchaseSharePrice = Float(readLine()!)!
    print("Enter current share price:")
    let currentSharePrice = Float(readLine()!)!
    
    if type == 2 {
        stocks.append(StockHolding(purchaseSharePrice: purchaseSharePrice, currentSharePrice: currentSharePrice, numberOfShares: numberOfShares, companyName: companyName))
    } else {
        print("Enter conversion rate:")
        let conversionRate = Float(readLine()!)!
        stocks.append(ForeignStockHolding(conversionRate: conversionRate, purchaseSharePrice: purchaseSharePrice, currentSharePrice: currentSharePrice, numberOfShares: numberOfShares, companyName: companyName))
    }
}
print("\n*************\n")

//minimum stock, num 1
func minStock(){
    var minStock = stocks[0].costInDollars()
    var minStockName = ""
    for i in 0 ... stocks.count-1{
        //checking the minimum value
        if minStock > stocks[i].costInDollars(){
            minStock = stocks[i].costInDollars()
            minStockName = stocks[i].getCompanyName()
        }
    }
    print("The minumum Stock is: ",minStock, "of ", minStockName)

}

//max stock, num 2
func maxStock() {
    var maxStock = stocks[0].costInDollars()
    var maxStockName = ""
    for i in 0 ... stocks.count-1{
        //checking the maximum value
        if maxStock < stocks[i].costInDollars(){
            maxStock = stocks[i].costInDollars()
            maxStockName = stocks[i].getCompanyName()
        }
    }
    print("The maximum Stock is: ",maxStock, "of ", maxStockName)


}
//num 3
func maxProfitStok(){
    var profitstk = stocks[0].costInDollars() - stocks[0].valueInDollars()
    var profitStkName = ""
    for i in 0 ... stocks.count-1{
        let stokProfitCalculation = stocks[i].costInDollars() - stocks[i].valueInDollars()
        //print(stokProfitCalculation)
        if stokProfitCalculation > 0{
            if profitstk < stokProfitCalculation{
                profitstk = stokProfitCalculation
                profitStkName = stocks[i].getCompanyName()
            }
        }

    }
    print("The most profitable stock is: ",profitstk, " of ", profitStkName)
    print("\n*************\n")
}
//num 4
func lossStock(){
    var lossstk = stocks[0].costInDollars() - stocks[0].valueInDollars()
    var lossStkName = ""
    for i in 0 ... stocks.count-1{
        let stokLossCalculation = stocks[i].costInDollars() - stocks[i].valueInDollars()
        //print(stokLossCalculation)
        if stokLossCalculation < 0{
            if lossstk < stokLossCalculation{
                lossstk = stokLossCalculation
                lossStkName = stocks[i].getCompanyName()
            }
        }
    }
    print("The stock with maximum loss is: ",lossstk, " of ", lossStkName)
    print("\n*************\n")
}
//num6
func sortByValue(){

    let sortedStockHoldingByValue = stocks.sorted ( by: {
        $0.valueInDollars() < $1.valueInDollars()
    })
    print("The Stock sorted from the lowest value to the highest value is: ")
    sortedStockHoldingByValue.forEach { (stockHolding) in

        print(stockHolding.valueInDollars(),":",stockHolding.getCompanyName())
    }
}
var continueQ = ""
repeat{
    print("Welcome to Stock Market, please choose from following options:")
    print("Menu:\n1.    Display stock information with the lowest value\n2.    Display stock with the highest value\n3.    Display the most profitable stock\n4.    Display the least profitable stock\n5.    List all stocks sorted by company name (A-Z)\n6.    List all stocks sorted from the lowest value to the highest value\n7.    Exit")
    let inputVal = Int(readLine()!)!

    switch inputVal{
    case 1:
        minStock()

    case 2:
        maxStock()

    case 3:
        maxProfitStok()

    case 4:
        lossStock()
    case 5:
        printSortedArray(isReversed: false)

    case 6:
        sortByValue()

    case 7:
        print("ok")

    default:
        print("Invalid Input")

    }
    print("Do you want to continue? y/n")
    continueQ = readLine()!

}while(continueQ.lowercased() == "y")
