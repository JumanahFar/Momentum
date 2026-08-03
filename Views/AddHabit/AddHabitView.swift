//
//  AddHabitView.swift
//  Momentum
//
//  Created by Jumana on 20/07/2026.
//
import SwiftUI
import SwiftData
struct AddHabitView: View {
    
    let habit: Habit?
    
    @State private var habitName = ""
    
    @State private var note = ""

    @State private var selectedCategory = "Category"

    @State private var reminderTime = Date()

    @State private var remindersEnabled = true

    @State private var repeatOption = "Daily"
    
    @State private var viewModel = HabitViewModel()

    @Environment(\.modelContext)
    private var modelContext

    @Environment(\.dismiss)
    private var dismiss
    
    
    var body: some View {


            ScrollView {

                VStack(alignment: .leading, spacing: Spacing.lg) {

                    // Header
                    HStack {

                        Button {
                            dismiss()
                        } label: {

                            Image(systemName: "xmark")
                                .font(.title3)
                                .foregroundStyle(Colors.textSecondary)

                        }

                        Spacer()

                        Text(habit == nil ? "New Habit" : "Edit Habit")
                            .font(Fonts.headline)

                        Spacer()

                        // Keeps the title centered
                           Color.clear
                               .frame(width: 20)


                    }

                    // Habit Name
                    VStack(alignment: .leading, spacing: Spacing.sm){
                        
                        Text("NAME YOUR HABIT")
                            .font(Fonts.caption)
                            .foregroundStyle(Colors.textSecondary)
                        
                        CustomTextField(title:"e.g. Morning Meditation" , text: $habitName)
                        
                    }
                    

                    // Note + Category
                    HStack(spacing: Spacing.md) {

                        CustomTextField(
                            title: "Add Note",
                            text: $note
                        )

                        Picker("Category", selection: $selectedCategory) {

                            Text("Health").tag("Health")
                            Text("Study").tag("Study")
                            Text("Fitness").tag("Fitness")
                            Text("Personal").tag("Personal")

                        }

                    }

                    // Configuration
                    VStack(alignment: .leading, spacing: Spacing.sm) {

                        Text("Reminder Time")
                            .font(Fonts.caption)
                            .foregroundStyle(Colors.textSecondary)

                        DatePicker(
                            "",
                            selection: $reminderTime,
                            displayedComponents: .hourAndMinute
                        )
                        .labelsHidden()

                    }
                    .padding()
                    .background(Colors.surface)
                    .clipShape(
                        RoundedRectangle(
                            cornerRadius: Constants.cornerRadius
                        )
                    )

                    // Repeat
                    Picker(
                        "Repeat",
                        selection: $repeatOption
                    ) {

                        Text("Daily")
                            .tag("Daily")

                        Text("Weekly")
                            .tag("Weekly")

                        Text("Custom")
                            .tag("Custom")

                    }
                    .pickerStyle(.segmented)

                    Spacer()
                    // Button
                    Button {

                        guard !habitName.trimmingCharacters(in: .whitespaces).isEmpty else {
                            return
                        }

                        if let habit {

                            viewModel.updateHabit(
                                habit,
                                title: habitName,
                                description: note,
                                category: selectedCategory,
                                frequency: repeatOption,
                                reminderTime: remindersEnabled ? reminderTime : nil
                            )
                            
                            HapticManager.success()

                        } else {

                            viewModel.addHabit(
                                title: habitName,
                                description: note,
                                category: selectedCategory,
                                frequency: repeatOption,
                                reminderTime: remindersEnabled ? reminderTime : nil,
                                context: modelContext
                            )
                            
                            HapticManager.success()

                        }

                        dismiss()

                    } label: {

                        PrimaryButton(
                            title: habit == nil
                                ? "Start this Habit"
                                : "Save Changes"
                        )

                    }
                    .frame(maxWidth: .infinity)

                }
                .padding()

            }
            .navigationBarHidden(true)
            
            .task {

                guard let habit else { return }

                habitName = habit.title
                note = habit.habitDescription
                selectedCategory = habit.category
                repeatOption = habit.frequency

                if let reminder = habit.reminderTime {
                    reminderTime = reminder
                    remindersEnabled = true
                } else {
                    remindersEnabled = false
                }

            }


    }
}

#Preview {
    AddHabitView(habit: nil)
}
