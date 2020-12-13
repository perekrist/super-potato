//
//  Task.swift
//  super-potato
//
//  Created by Кристина Перегудова on 20.11.2020.
//

import Foundation

struct Task {
  let title: String
  let decsription: String
  let priority: Priority
  let category: Category
}

struct Priority {
  let id: Int
  let name: String
  let color: String
}

struct Category {
  let id: Int
  let name: String
}

