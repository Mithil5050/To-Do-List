//
//  AddTaskViewController.swift
//  To-Do List
//
//  Created by Mithil on 23/11/25.
//

import UIKit

protocol AddingTaskDelegate {
    func addingTaskDonewithResult(newtask: Task)
    func addingTaskCancelled()
}

class AddTaskViewController: UIViewController {

    var delegate: AddingTaskDelegate?
    @IBOutlet weak var taskTitle: UITextField!
    @IBOutlet weak var isUrgentSwitch: UISwitch!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveClicked(_ sender: Any) {
        if let title = taskTitle.text, !title.isEmpty {
            let newTask = Task(
                name: title,
                isUrgent: isUrgentSwitch.isOn,
                dateCreated: datePicker.date
            )
            delegate?.addingTaskDonewithResult(newtask: newTask)
            dismiss(animated: true)
        } else {
            let alert = UIAlertController(title: "Error", message: "Please enter a task", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true)
        }
    }
    
    @IBAction func cancelClicked(_ sender: Any) {
        delegate?.addingTaskCancelled()
        dismiss(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
