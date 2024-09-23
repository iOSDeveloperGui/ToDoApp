//
//  MenuViewController.swift
//  toDoApp
//
//  Created by iOS Developer on 31/07/24.
//

import UIKit

protocol TaskDelegate: AnyObject{
    func didAddTask()
}

class MenuViewController: UIViewController{
    
    
    
    //private var isSearchActive: Bool = false
    private let taskService: TaskService = TaskService()
    private var tasks: [Taskz] = []
    
    private lazy var taskTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.layer.cornerRadius = 24
        let header = TasksTableViewHeader(frame: .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 64))
        header.delegate = self
        tableView.tableHeaderView = header
        return tableView
    }()
    
    private lazy var taskImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: AssetsaConstants.characterMenu))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // MARK: - LIFECYCLE
    
        override func viewDidLoad(){
            super.viewDidLoad()
            view.backgroundColor = UIColor(named: AssetsaConstants.darkblue)
            setupNavigationBar()
            addSubViews()
            setupConstraints()
            Task{
                await fetchTasks()
            }
        }
        
        private func fetchTasks() async{
            do{
                tasks = try await taskService.getTasks()
                taskTableView.reloadData()
            } catch(let error){
                print(error)
            }
        }
    
    private func setupNavigationBar(){
        navigationItem.hidesBackButton = true
    }
    
    private func addSubViews(){
        view.addSubview(taskImage)
        view.addSubview(taskTableView)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            
            taskImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            taskImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            taskImage.heightAnchor.constraint(equalToConstant: 236),
            taskImage.widthAnchor.constraint(equalToConstant: 236),
            
            taskTableView.topAnchor.constraint(equalTo: taskImage.bottomAnchor),
            taskTableView.leadingAnchor.constraint(equalTo:
            view.leadingAnchor),
            taskTableView.trailingAnchor.constraint(equalTo:
            view.trailingAnchor),
            taskTableView.bottomAnchor.constraint(equalTo:
            view.bottomAnchor)
            
        ])
    }
}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = tasks[indexPath.row].title
        content.secondaryText = tasks[indexPath.row].description
        cell.contentConfiguration = content
        cell.accessoryView = checkmarkButton()
        return cell
    }
    
    private func checkmarkButton() -> UIButton{
        let completeButton = UIButton()
        let symbolName = "checkmark.circle"
        let configuration = UIImage.SymbolConfiguration(pointSize: 20)
        let image = UIImage(systemName: symbolName, withConfiguration: configuration)
        completeButton.setImage(image, for: .normal)
        completeButton.frame = .init(x: 0, y: 0, width: 20, height: 20)
        return completeButton
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            tasks.remove(at: indexPath.row)
            taskTableView.reloadData()
        }
    }
}

extension MenuViewController: TasksTableViewHeaderDelegate{
    func didTapAddTask() {
        let addTaskVC = AddTaskViewController()
        addTaskVC.delegate = self
        navigationController?.present(addTaskVC, animated: true)
    }
}

extension MenuViewController: TaskDelegate{
    func didAddTask() {
        taskTableView.reloadData()
    }
}

#Preview{
    MenuViewController()
}
