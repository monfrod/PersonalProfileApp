//
//  DreamsViewController.swift
//  PersonalProfileApp
//
//  Created by yunus on 07.02.2025.
//
import UIKit

class GoalsViewController: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var models: [GoalsEntity] = []
    
    let tableView: UITableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .done, target: self, action: #selector(addGoal))
        navigationItem.title = "My goals"
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(GoalTableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    @objc
    func addGoal(){
        let alert = UIAlertController(title: "New Goal", message: "Enter your goal details", preferredStyle: .alert)
        
        alert.addTextField { textField in
            textField.placeholder = "Enter goal"
        }
        
        alert.addTextField { textField in
            textField.placeholder = "Enter deadline (yyyy-MM-dd)"
            textField.keyboardType = .numbersAndPunctuation
        }
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
            guard let goalText = alert.textFields?[0].text, !goalText.isEmpty,
                  let deadlineText = alert.textFields?[1].text,
                  let deadlineDate = self.convertToDate(deadlineText) else {
                return
            }
            
            self.createNewGoal(goalText: goalText, isCompleted: false, deadlineData: deadlineDate)
            self.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    private func convertToDate(_ dateString: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.date(from: dateString)
    }
}
    
    
extension GoalsViewController: UITableViewDataSource, UITableViewDelegate {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return models.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GoalTableViewCell
            cell.configure(with: models[indexPath.row])
            return cell
        }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == .delete {
            deleteContact(goal: models[indexPath.row])
            tableView.reloadData()
        }
    }
        
        
    }
    
    //MARK: CoreData
    extension GoalsViewController {
        public func createNewGoal(goalText: String, isCompleted: Bool, deadlineData: Date){
            let newGoal = GoalsEntity(context: context)
            newGoal.goal = goalText
            newGoal.isCompleted = isCompleted
            newGoal.deadlineData = deadlineData
            
            do {
                try context.save()
                getAllGoals()
                tableView.reloadData()
            } catch{
                print(error)
            }
        }
        
        public func getAllGoals(){
            let fetchingContact = GoalsEntity.fetchRequest()
            do {
                models = try context.fetch(fetchingContact)
            } catch{
                print(error)
            }
        }
        
        public func deleteContact(goal: GoalsEntity){
            context.delete(goal)
            
            do{
                try context.save()
            } catch {
                print("Error delete item")
            }
        }
        
        public func updateItem(updatedGoal: GoalsEntity, newGoalText: String, isCompleted: Bool, newDeadline: Date){
            updatedGoal.goal = newGoalText
            updatedGoal.isCompleted = isCompleted
            updatedGoal.deadlineData = newDeadline
            
            do{
                try context.save()
                getAllGoals()
            } catch {
                print("Error update contact")
            }
        }
    }

