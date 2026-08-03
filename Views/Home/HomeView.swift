//
//  HomeView.swift
//  Momentum
//
//  Created by Jumana on 24/07/2026.
//
import SwiftUI
import SwiftData

struct HomeView: View {

    @State private var showingAddHabit = false
    
    @State private var userViewModel = UserViewModel()
    
    @Query(sort: \Habit.createdAt)
    private var habits: [Habit]
    
    @Environment(\.modelContext)
    private var modelContext
    
    private var viewModel = HabitViewModel()
    @State private var habitToDelete: Habit?
    @State private var showingDeleteConfirmation = false
    
    
    private var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter.string(from: Date())
    }
    
    var body: some View {
        
        // REMOVED NavigationStack - it's now in the parent
        
        ZStack {
            
            Colors.background
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: true) { // Show scroll indicators
                
                VStack(alignment: .leading, spacing: Spacing.lg) {
                    
                    // Header
                    HomeHeader(
                        userName: userViewModel.currentUser.name
                    )
                    
                    // Date
                    VStack(alignment: .leading, spacing: Spacing.xs) {
                        
                        Text("Today")
                            .font(Fonts.title)
                            .foregroundStyle(Colors.textPrimary)
                        
                        Text(formattedDate)
                            .font(Fonts.body)
                            .foregroundStyle(Colors.textSecondary)
                        
                        
                    }
                    
                    // Progress
                    ProgressCard(
                        completedHabits: habits.filter { habit in
                            habit.completedDates.contains {
                                Calendar.current.isDateInToday($0)
                            }
                        }.count,
                        totalHabits: habits.count
                    )
                    
                    // Active Habits Header
                    HStack {
                        
                        Text("Active Habits")
                            .font(Fonts.headline)
                        
                        Spacer()
                        
                        Button {
                            showingAddHabit = true
                            
                        } label: {
                            
                            Image(systemName: "plus.circle.fill")
                                .font(.title2)
                                .foregroundStyle(Colors.primary)
                        }
                        
                    }
                    
                    if habits.isEmpty {
                        
                        EmptyStateView {
                            
                            showingAddHabit = true
                            
                        }
                        
                    } else {
                        
                        // Habit Cards
                        VStack(spacing: Spacing.md) {
                            
                            ForEach(habits) { habit in
                                
                                NavigationLink {
                                    
                                    HabitDetailsView(habit: habit)
                                    
                                } label: {
                                    
                                    HabitCard(
                                        title: habit.title,
                                        subtitle: habit.habitDescription,
                                        streak: StreakCalculator.currentStreak(for: habit),
                                        isCompleted: habit.completedDates.contains {
                                            Calendar.current.isDateInToday($0)
                                        }
                                    )
                                    
                                }
                                .buttonStyle(.plain)
                                .contextMenu {
                                    Button {
                                        viewModel.markHabitCompleted(habit)
                                        HapticManager.success()
                                    } label: {
                                        Label("Mark Complete", systemImage: "checkmark.circle")
                                    }
                                    
                                    Button(role: .destructive) {
                                        habitToDelete = habit
                                        showingDeleteConfirmation = true
                                    } label: {
                                        Label("Delete", systemImage: "trash")
                                    }
                                }
                                
                            }
                            
                        }
                    }
                    
                    // Add bottom padding so content isn't cut off
                    Color.clear
                        .frame(height: 20)
                }
                .padding()
                
            }
            
        }//zstack
        .sheet(isPresented: $showingAddHabit) {
            
            NavigationStack {
                
                AddHabitView(habit: nil)
                
            }
            
        }
        .confirmationDialog(
            "Delete Habit?",
            isPresented: $showingDeleteConfirmation,
            titleVisibility: .visible
        ) {
            Button("Delete", role: .destructive) {
                if let habit = habitToDelete {
                    viewModel.deleteHabit(habit, context: modelContext)
                    HapticManager.medium()
                    habitToDelete = nil
                }
            }
            Button("Cancel", role: .cancel) {
                habitToDelete = nil
            }
        } message: {
            Text("This action cannot be undone.")
        }
    }//body
    
}//struct

#Preview {
    HomeView()
}
