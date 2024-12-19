import Foundation

enum TypeOfExpense {
    case food
    case education
    case travel
    case house
    case medical
}

enum ModeOfPayment {
    case card
    case cash
    case upi
}

class Expense {
    var title: String
    var amount: Int
    var type: TypeOfExpense
    var mode: ModeOfPayment
    init(title: String, amount: Int, type: TypeOfExpense, mode: ModeOfPayment) {
        self.title = title
        self.amount = amount
        self.type = type
        self.mode = mode
    }
}

