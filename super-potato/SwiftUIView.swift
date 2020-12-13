//
//  SwiftUIView.swift
//  super-potato
//
//  Created by Кристина Перегудова on 20.11.2020.
//

import SwiftUI

struct SwiftUIView: View {
  @State var tasks: [Task] = [Task(title: "cheburek?3",
                                   decsription: "da da on samii!",
                                   priority: Priority(id: 5, name: "May be never", color: "#45D3EB"),
                                   category: Category(id: 3, name: "cotikgoria3")),
                              Task(title: "cheburek?1",
                                   decsription: "da da on samii!",
                                   priority: Priority(id: 5, name: "May be never", color: "#45D3EB"),
                                   category: Category(id: 1, name: "cotikgoria1")),
                              Task(title: "cheburek?2",
                                   decsription: "da da on samii!",
                                   priority: Priority(id: 5, name: "May be never", color: "#45D3EB"),
                                   category: Category(id: 2, name: "cotikgoria2")),
                              Task(title: "cheburek?1",
                                   decsription: "da da on samii!",
                                   priority: Priority(id: 5, name: "May be never", color: "#45D3EB"),
                                   category: Category(id: 1, name: "cotikgoria1"))
  ]
  @State var categories: [Catgr] = []
  @State var t: [String] = []
  var body: some View {
    NavigationView {
      List(categories, id: \.self.name) { cat in
        VStack {
          Text(cat.name)
          
          VStack {
            ForEach(cat.task, id: \.self) {t in
              Text(t)
                .padding()
            }
          }
        }
        
      }
    }
    .onAppear {
      var cat = tasks
        .map({ $0.category.name })
      
      cat = Array(Set(cat)).sorted()
      
      
      for i in cat {
        t = tasks
          .filter({ $0.category.name == i })
          .map({ $0.title })
        categories.append(Catgr(name: i, task: t ))
      }
    }
  }
  private func onDelete(offsets: IndexSet) {
    categories.remove(atOffsets: offsets)
  }
  
  private func onMove(source: IndexSet, destination: Int) {
    categories.move(fromOffsets: source, toOffset: destination)
  }
}

struct Catgr {
  let name: String
  let task: [String]
}

struct SwiftUIView_Previews: PreviewProvider {
  static var previews: some View {
    SwiftUIView()
  }
}

extension Array where Element: Equatable {
  func removeDuplicates() -> [Element] {
    var result = [Element]()
    
    for value in self {
      if !result.contains(value) {
        result.append(value)
      }
    }
    return result
  }
}


/*
 {
 "title": "cheburek?",
 "description": "da da on samii!",
 "done": 0,
 "created": 1605477408,
 "deadline": 1604613403,
 "priority": {
 "id": 5,
 "name": "May be never",
 "color": "#45D3EB"
 },
 "id": 285,
 "category": {
 "id": 59,
 "name": "cotikgoria"
 }
 }
 */
