import Foundation

class ExpenseDataController {
    private var allMyExpenses: [Expense] = []
    
    private init() {
        loadDummyData()
    }
    static var shared: ExpenseDataController = ExpenseDataController()
    
    func loadDummyData() {
        allMyExpenses = [
            Expense(title: "Semester Fees", amount : 100000, type: .education, mode: .card),
            Expense(title: "Travel", amount: 20000, type: .travel, mode: .cash),
            Expense(title: "House Rent", amount: 120000, type: .house, mode: .upi),
            Expense(title: "Medical", amount: 5000, type: .medical, mode: .card),
            Expense(title: "Lunch", amount: 500, type: .food, mode: .card)
        ]
    }
    
    func allExpenses() -> [Expense] {
        return allMyExpenses
    }
    func expense(index: Int) -> Expense {
        return allMyExpenses[index]
    }
    func deleteExpense(index: Int) -> Expense {
        return allMyExpenses.remove(at: index)
    }
    func appendExpense(_ newExpense: Expense) {
        allMyExpenses.append(newExpense)
    }
    func changeExpense(index: Int, with : Expense) {
        allMyExpenses[index] = with
    }
    func insertExpense(index: Int, newExpense : Expense) {
        allMyExpenses.insert(newExpense, at: index)
    }
    func totalExpenses() -> Int {
        return allMyExpenses.count
    }
}
