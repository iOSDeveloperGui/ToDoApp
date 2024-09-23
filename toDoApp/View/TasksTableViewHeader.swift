//
//  TasksTableViewHeader.swift
//  toDoApp
//
//  Created by iOS Developer on 01/08/24.
//

import UIKit

protocol TasksTableViewHeaderDelegate: AnyObject{
    func didTapAddTask()
}

class TasksTableViewHeader: UIView {
    
    weak var delegate: TasksTableViewHeaderDelegate?
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = AssetsaConstants.textLabel 
        label.textColor = UIColor(named: AssetsaConstants.darkPurple)
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private lazy var addTaskButton: UIButton = {
        let button = UIButton()
        let plusImage = UIImage(systemName:"plus")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(plusImage, for: .normal)
        button.addTarget(self, action: #selector(didTapAddTask), for: .touchUpInside)
        return button
    }()
    
    @objc private func didTapAddTask(){
        delegate?.didTapAddTask()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubViews(){
        addSubview(titleLabel)
        addSubview(addTaskButton)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            addTaskButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            addTaskButton.centerYAnchor.constraint(equalTo: centerYAnchor)
        
        ])
    }
}
