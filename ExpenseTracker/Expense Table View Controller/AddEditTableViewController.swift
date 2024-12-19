import UIKit

class AddEditTableViewController: UITableViewController {
    var expenseAtAddEditTBVC: Expense?
    init?(coder : NSCoder, expense: Expense?){
        expenseAtAddEditTBVC = expense
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let expense = expenseAtAddEditTBVC{
            print(expense.title)
        } else {
            print("Expense is nil")
        }
    }

    
    @IBSegueAction func AddEditExpenseSegueA(_ coder: NSCoder, sender: Any?, segueIdentifier: String?) -> AddEditTableViewController? {
        return <#AddEditTableViewController(coder: coder)#>
    }
    
}
