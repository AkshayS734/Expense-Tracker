import UIKit

class AllExpensesTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    //MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ExpenseDataController.shared.totalExpenses()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExpenseTableViewCell", for: indexPath)
        let expense = ExpenseDataController.shared.expense(index: indexPath.row)
        var content = cell.defaultContentConfiguration()
        content.text = expense.title
        content.secondaryText = "\(expense.amount)"
        
        switch expense.type {
            case .food:
            content.image = UIImage(systemName: "fork.knife")
            case .education:
            content.image = UIImage(systemName: "book")
            case .travel:
            content.image = UIImage(systemName: "airplane")
            case .medical:
            content.image = UIImage(systemName: "heart.fill")
            case .house:
            content.image = UIImage(systemName: "house")
        }
        cell.showsReorderControl = true
        cell.contentConfiguration = content
        return cell
    }
    
    //MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let deletedExpense = ExpenseDataController.shared.deleteExpense(index: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedExpense = ExpenseDataController.shared.deleteExpense(index: sourceIndexPath.row)
        ExpenseDataController.shared.insertExpense(index: destinationIndexPath.row, newExpense: movedExpense)
    }
}
