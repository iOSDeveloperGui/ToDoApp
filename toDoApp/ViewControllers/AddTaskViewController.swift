//
//  AddTaskViewController.swift
//  toDoApp
//
//  Created by iOS Developer on 01/08/24.
//

import UIKit

class AddTaskViewController: UIViewController {

    weak var delegate: TaskDelegate?
    private var taskService: TaskService = TaskService()
        
    private lazy var titleHeader: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Insert a new task or a new idea"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.textColor = UIColor(named: AssetsaConstants.darkPurple)
        return label
    }()
    
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.textColor = UIColor(named: AssetsaConstants.darkblue)
        label.text = "Title"
        return label
    }()
    
    private lazy var titleTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter the task"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private lazy var TitleDescribe: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.textColor = UIColor(named: AssetsaConstants.darkblue)
        label.text = "Description"
        return label
    }()
    
    private lazy var describeTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter the task"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private lazy var saveTaskButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Save Task", for: .normal)
        button.addTarget(self, action: #selector(didTapSaveTaskButton), for: .touchUpInside)
        button.titleLabel?.font = .systemFont(ofSize: 24, weight: .semibold)
        return button
    }()
    
    private lazy var characterTask: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: AssetsaConstants.characterTask))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    @objc private func didTapSaveTaskButton(){
       /* let alert = UIAlertController(title: "New Task", message: "Enter task title", preferredStyle: .alert)
        alert.addTextField{ textField in
            textField.placeholder = "Task title"
        }
        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { _ in
            if let title = alert.textFields?.first?.text, !title.isEmpty{
                let task = self.taskService.createTams
            }
        }))
        */
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubviews()
        setupConstraints()
    }
    
    private func addSubviews(){
        view.addSubview(titleHeader)
        view.addSubview(titleLabel)
        view.addSubview(titleTextField)
        view.addSubview(TitleDescribe)
        view.addSubview(describeTextField)
        view.addSubview(saveTaskButton)
        view.addSubview(characterTask)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            titleHeader.topAnchor.constraint(equalTo: view.topAnchor, constant: 36),
            titleHeader.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            titleLabel.bottomAnchor.constraint(equalTo: titleHeader.bottomAnchor, constant: 42),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            titleTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            titleTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            titleTextField.heightAnchor.constraint(equalToConstant: 44),
            
            TitleDescribe.bottomAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 24),
            TitleDescribe.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            describeTextField.topAnchor.constraint(equalTo: TitleDescribe.bottomAnchor, constant: 8),
            describeTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            describeTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            describeTextField.heightAnchor.constraint(equalToConstant: 44),
            
            saveTaskButton.bottomAnchor.constraint(equalTo: describeTextField.bottomAnchor, constant: 56),
            saveTaskButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            characterTask.centerYAnchor.constraint(equalTo: saveTaskButton.centerYAnchor, constant: 236),
            characterTask.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    /*
    @objc private func didTapSaveTaskButton(){
        guard let title = titleTextField.text, !title.isEmpty else{
            return
        }
        let newTaks = Task(title: title, description: describeTextField.text)
        
        tasks.append(newTaks)
        delegate?.didAddTask()
        
        dismiss(animated: true)
    }
    */
    

}
