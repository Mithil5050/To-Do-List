//
//  ToDoTableViewController.swift
//  To-Do List
//
//  Created by Mithil on 23/11/25.
//

import UIKit

class ToDoTableViewController: UITableViewController , AddingTaskDelegate {
    
    func addingTaskDonewithResult(newtask: Task) {
        TaskManager.shared.addTask(ntask: newtask)
        allTasks.append(newtask)
        tableView.reloadData()
    }
    
    func addingTaskCancelled() {
        
    }
    
    
    var allTasks = TaskManager.shared.tasks
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TaskManager.shared.tasks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let task = TaskManager.shared.tasks[indexPath.row]
        cell.textLabel?.text = task.name
        cell.detailTextLabel?.text = task.dateCreated.description
        cell.backgroundColor = task.isUrgent ? .red : .green
        return cell
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            TaskManager.shared.deleteTask(at: indexPath.row)
            allTasks = TaskManager.shared.tasks
            tableView.reloadData()
        }
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

        // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        var addingVC = segue.destination as? AddTaskViewController
        addingVC?.delegate = self
    }
    
    
}
