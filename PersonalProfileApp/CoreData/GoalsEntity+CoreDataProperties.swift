//
//  GoalsEntity+CoreDataProperties.swift
//  PersonalProfileApp
//
//  Created by yunus on 14.02.2025.
//
//

import Foundation
import CoreData


extension GoalsEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GoalsEntity> {
        return NSFetchRequest<GoalsEntity>(entityName: "GoalsEntity")
    }

    @NSManaged public var goal: String
    @NSManaged public var isCompleted: Bool
    @NSManaged public var deadlineData: Date

}

extension GoalsEntity : Identifiable {

}
