//
//  HabitDetailsView.swift
//  Momentum
//
//  Created by Jumana on 20/07/2026.
//
import SwiftUI
import SwiftData

struct HabitDetailsView: View {

    let habit: Habit
    @State private var showingEditSheet = false
    @State private var showingDeleteConfirmation = false
    @State private var showingMoreOptions = false

        @Environment(\.modelContext)
        private var modelContext

        @Environment(\.dismiss)
        private var dismiss

        @State private var viewModel = HabitViewModel()

    
    
    
    private var completedToday: Bool {

        habit.completedDates.contains {
            Calendar.current.isDateInToday($0)
        }

    }
    
    var body: some View {

        VStack(spacing: 0) {

            //Content

            ScrollView {

                VStack(alignment: .leading, spacing: Spacing.xl) {

                    //Header

                    HStack {

                        Button {

                            dismiss()

                        } label: {

                            Image(systemName: "chevron.left")
                                .font(.title3)
                                .foregroundStyle(Colors.textPrimary)

                        }

                        Spacer()
                        
                        Text("Habit Details")
                            .font(Fonts.headline)

                        Spacer()

                        // More options button
                        Menu {
                            Button {
                                    showingEditSheet = true
                                } label: {
                                            Label("Edit Habit", systemImage: "pencil") }
                                                   
                             Button(role: .destructive) {
                                    showingDeleteConfirmation = true
                                } label: {
                                            Label("Delete Habit", systemImage: "trash")}
                                } label: {
                                            Image(systemName: "ellipsis")
                                                .font(.title3)
                                                .foregroundStyle(Colors.textPrimary)
                                               }
                                           }
                                           .padding(.horizontal, 16)
                  

                    //Habit Info

                    VStack(alignment: .center,
                           spacing: Spacing.sm) {

                        Text(habit.title)
                            .font(Fonts.title)
                            

                        Text(habit.habitDescription)
                            .font(Fonts.body)
                            .foregroundStyle(Colors.textSecondary)
                            
                            

                    }.padding(.horizontal,16)

                    //Statistics

                    HStack(spacing: Spacing.md) {

                        StatisticCard(
                            icon: "flame.fill",
                            iconBackground: Colors.primary,
                            title: "Current Streak",
                            value: "\(StreakCalculator.currentStreak(for: habit)) Days"
                        )

                        StatisticCard(
                            icon: "trophy",
                            iconBackground: Colors.secondary,
                            title: "Best Streak",
                            value: "\(StreakCalculator.bestStreak(for: habit)) Days"
                        )

                        StatisticCard(
                            icon: "target",
                            iconBackground: .gray,
                            title: "Consistency",
                            value: "\(StreakCalculator.consistency(for: habit))%"
                        )

                    }

                    //Weekly Progress

                    WeeklyProgressCard(
                        completedDays: StreakCalculator.weeklyProgress(for: habit),
                        weekRange: StreakCalculator.currentWeekRange()
                    )

                    //Complete Button

                    Button {

                        withAnimation(.spring()) {

                               viewModel.markHabitCompleted(habit)

                           }

                           HapticManager.success()

                    } label: {

                        Text(
                            completedToday
                            ? "Completed Today ✓"
                            : "Mark Complete for Today"
                        )
                            .font(Fonts.headline)
                            .frame(width: Constants.buttonWidth)
                            .frame(height: Constants.buttonHeight)
                            .foregroundStyle(
                                completedToday
                                ? .gray
                                : Colors.secondary
                            )
                            .overlay(
                                RoundedRectangle(
                                    cornerRadius: Constants.cornerRadius
                                )
                                .stroke(
                                    completedToday
                                    ? .gray
                                    : Colors.secondary,
                                    lineWidth: 1.5
                                )
                                )
                            

                    }
                    .frame(maxWidth: .infinity)


                }
                .padding()

            }


        }
        
        .sheet(isPresented: $showingEditSheet) {

            AddHabitView(habit: habit)

        }
        
        .confirmationDialog(
            "Delete Habit?",
            isPresented: $showingDeleteConfirmation,
            titleVisibility: .visible
        ) {

            Button("Delete", role: .destructive) {

                viewModel.deleteHabit(
                       habit,
                       context: modelContext
                   )

                   HapticManager.medium()


                dismiss()

            }

            Button("Cancel", role: .cancel) { }

        } message: {

            Text("This action cannot be undone.")

        }

    }

}

#Preview {
    HabitDetailsView(
        habit: Habit(
            title: "Morning Meditation",
            habitDescription: "10 minutes of breathing",
            category: "Health",
            frequency: "Daily"
        )
    )
}
