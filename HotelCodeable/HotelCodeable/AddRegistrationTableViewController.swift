
import UIKit

class AddRegistrationTableViewController: UITableViewController {
    // 1st section Text Fields
    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    
    
    @IBOutlet weak var checkInDateLabel: UILabel!
    @IBOutlet weak var checkoutDateLabel: UILabel!
    
    @IBOutlet weak var checkInDatePicker: UIDatePicker!
    
    @IBOutlet weak var checkoutDatePicker: UIDatePicker!
    
    let checkinDateLabelIndexPath = IndexPath(row: 0, section: 1)
    let checkinDatePickerIndexPath = IndexPath(row: 1, section: 1)
    let checkoutDateLabelIndexPath = IndexPath(row: 2, section: 1)
    let checkoutDatePickerIndexPath = IndexPath(row: 3, section: 1)
    var isCheckinDatePickerAvailable : Bool = false{
        didSet{
            checkInDatePicker.isHidden = !isCheckinDatePickerAvailable
        }
    }
    var isCheckoutDatePickerAvailable: Bool = false{
        didSet{
            checkoutDatePicker.isHidden = !isCheckoutDatePickerAvailable
        }
    }
    
    var roomType:RoomType?
    
    
    @IBOutlet weak var numberOfAdults: UILabel!
    @IBOutlet weak var numberOfChildren: UILabel!
    
    @IBOutlet weak var numberOfAdultsStepper: UIStepper!

    @IBOutlet weak var numberOfChildrenStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        let midnight = Date()
        let today = Calendar.current.startOfDay(for: midnight)
        
        checkInDatePicker.minimumDate = today
        updateViews()
        updateCount()

    }
    
    @IBAction func handleDone(_ sender: UIBarButtonItem) {
        if firstNameTF.text == ""{
            let alertController = UIAlertController(title: "Error", message: "Please enter your First Name", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(cancelAction)
                                             
            self.present(alertController, animated: true, completion: nil)
            return
        }
        guard let lastName = lastNameTF.text else{
            return
        }
        guard let email = emailTF.text else{
            return
        }
        
        print(firstNameTF.text ?? "",lastName,email)
    }
    
    func updateViews(){
        let checkoutDate = Calendar.current.date(byAdding: .day,value:1, to: checkInDatePicker.date)
        checkoutDatePicker.minimumDate = checkoutDate
        checkInDateLabel.text = checkInDatePicker.date.formatted(date: .abbreviated, time: .omitted)
        checkoutDateLabel.text = checkoutDatePicker.date.formatted(date:.abbreviated,time:.omitted)
        
    }
    func updateCount(){
        numberOfAdults.text = "\(Int(numberOfAdultsStepper.value))"
        numberOfChildren.text = "\(Int(numberOfChildrenStepper.value))"
    }
    
    // IBAction for the segue
    
    
    @IBAction func handleStepperChange(_ sender: UIStepper) {
        updateCount()
    }
    

    @IBAction func handleDateChange(_ sender: UIDatePicker) {
        updateViews()
    }
    
    // MARK: TABLE VIEW DELEGATE METHODS
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if(indexPath == checkinDateLabelIndexPath && isCheckoutDatePickerAvailable == false){
            isCheckinDatePickerAvailable.toggle()
        }
        else if(indexPath == checkoutDateLabelIndexPath && isCheckinDatePickerAvailable == false){
            isCheckoutDatePickerAvailable.toggle()
        }
        else if(indexPath == checkinDateLabelIndexPath || indexPath == checkoutDateLabelIndexPath){
            isCheckinDatePickerAvailable.toggle()
            isCheckoutDatePickerAvailable.toggle()
        }
        else{
            return
        }
        tableView.beginUpdates()
        tableView.endUpdates()
//        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath{
        case checkinDatePickerIndexPath where isCheckinDatePickerAvailable == false:
            return 0
        case checkoutDatePickerIndexPath where isCheckoutDatePickerAvailable == false:
            return 0
        default :
            return UITableView.automaticDimension
        }
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath{
        case checkinDatePickerIndexPath:
            return 190
        case checkoutDatePickerIndexPath:
            return 190
        default:
            return UITableView.automaticDimension
        }
    }
}
