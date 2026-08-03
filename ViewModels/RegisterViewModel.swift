//
//  RegisterViewModel.swift
//  Momentum
//
//  Created by Jumana on 21/07/2026.
//
import Foundation
import Observation

@Observable
class RegisterViewModel {
    
    var fullName = ""
    var email = ""
    var password = ""
    var confirmPassword = ""
    var isLoading = false
    var errorMessage: String?
    var isRegistered = false
    
    func register() {
        // Reset states
        isLoading = true
        errorMessage = nil
        
        // Validate
        if fullName.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty {
            errorMessage = "Please fill in all fields"
            isLoading = false
            return
        }
        
        if !email.contains("@") {
            errorMessage = "Please enter a valid email"
            isLoading = false
            return
        }
        
        if password.count < 6 {
            errorMessage = "Password must be at least 6 characters"
            isLoading = false
            return
        }
        
        if password != confirmPassword {
            errorMessage = "Passwords do not match"
            isLoading = false
            return
        }
        
        // Simulate network delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            guard let self = self else { return }
            
            // In a real app, you'd register with a backend
            // For now, just accept valid input
            self.isRegistered = true
            self.isLoading = false
            
            // Save user session
            UserDefaults.standard.set(true, forKey: "isLoggedIn")
            UserDefaults.standard.set(self.fullName, forKey: "userName")
            UserDefaults.standard.set(self.email, forKey: "userEmail")
        }
    }
}
