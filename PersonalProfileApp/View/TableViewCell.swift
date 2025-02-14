//
//  TableViewCell.swift
//  PersonalProfileApp
//
//  Created by yunus on 14.02.2025.
//
import UIKit

class GoalTableViewCell: UITableViewCell {
    
    // Лейбл с текстом цели
    let goalLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    // Лейбл с дедлайном
    let deadlineLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    // Чекбокс (isCompleted)
    let completedCheckbox: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "circle"), for: .normal)
        button.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .selected)
        button.tintColor = .systemBlue
        return button
    }()
    
    var onCheckboxTapped: (() -> Void)?  // Колбэк для обновления состояния
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(completedCheckbox)
        contentView.addSubview(goalLabel)
        contentView.addSubview(deadlineLabel)
        
        // Отключаем авто-расстановку
        completedCheckbox.translatesAutoresizingMaskIntoConstraints = false
        goalLabel.translatesAutoresizingMaskIntoConstraints = false
        deadlineLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Настройка Auto Layout
        NSLayoutConstraint.activate([
            completedCheckbox.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            completedCheckbox.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            completedCheckbox.widthAnchor.constraint(equalToConstant: 24),
            completedCheckbox.heightAnchor.constraint(equalToConstant: 24),
            
            goalLabel.leadingAnchor.constraint(equalTo: completedCheckbox.trailingAnchor, constant: 10),
            goalLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            goalLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            
            deadlineLabel.leadingAnchor.constraint(equalTo: goalLabel.leadingAnchor),
            deadlineLabel.trailingAnchor.constraint(equalTo: goalLabel.trailingAnchor),
            deadlineLabel.topAnchor.constraint(equalTo: goalLabel.bottomAnchor, constant: 5),
            deadlineLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
        
        // Добавляем обработчик для чекбокса
        completedCheckbox.addTarget(self, action: #selector(checkboxTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Настройка ячейки
    func configure(with goal: GoalsEntity) {
        goalLabel.text = goal.goal
        deadlineLabel.text = "Deadline: \(formatDate(goal.deadlineData))"
        completedCheckbox.isSelected = goal.isCompleted
    }
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy, HH:mm" // Формат даты
        return formatter.string(from: date)
    }
    
    @objc private func checkboxTapped() {
        completedCheckbox.isSelected.toggle()
        onCheckboxTapped?() // Вызываем колбэк
    }
}
