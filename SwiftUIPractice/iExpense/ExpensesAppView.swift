//
//  ExpensesAppView.swift
//  SwiftUIPractice
//
//  Created by Maksym Hushlenko on 21/02/2024.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

@Observable
final class Expenses {
    var items = [ExpenseItem]() {
        didSet {
            if let encode = try? JSONEncoder().encode(items) {
                UserDefaults.standard.setValue(encode, forKey: "Items")
            }
        }
    }
    
    init() {
        guard let savedItemsData = UserDefaults.standard.data(forKey: "Items"),
              let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItemsData)
        else {
            items = []
            return
        }
        
        items = decodedItems
    }
}

struct ExpensesAppView: View {
    @State private var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading, spacing: 8) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                                .foregroundStyle(item.type == "Personal" ? .green : .yellow)
                        }
                        
                        Spacer()
                        
                        Text(item.amount, format: .currency(code: "USD"))
                            .foregroundStyle(item.amount > 10 ? .red : .green)
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("Expenses")
            .toolbar {
                Button("Add expenses", systemImage: "plus") {
                    showingAddExpense = true
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

#Preview {
    iExpenseMainView()
}
