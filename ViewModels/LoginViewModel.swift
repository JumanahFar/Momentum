//
//  LoginViewModel.swift
//  Momentum
//
//  Created by Jumana on 21/07/2026.
//
import Foundation
import Observation
import SwiftData

@Observable
class LoginViewModel {
    
    var email = ""
    var password = ""
    var isLoading = false
    var errorMessage: String?
    var isAuthenticated = false
    
    func login() {
        // Reset states
        isLoading = true
        errorMessage = nil
        
        // Simulate network delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            guard let self = self else { return }
            
            // Simple validation
            if self.email.isEmpty || self.password.isEmpty {
                self.errorMessage = "Please fill in all fields"
                self.isLoading = false
                return
            }
            
            if !self.email.contains("@") {
                self.errorMessage = "Please enter a valid email"
                self.isLoading = false
                return
            }
            
            // In a real app, you'd authenticate with a backend
            // For now, just accept any valid input
            self.isAuthenticated = true
            self.isLoading = false
            
            // Save user session
            UserDefaults.standard.set(true, forKey: "isLoggedIn")
        }
    }
    
    func logout() {
        isAuthenticated = false
        UserDefaults.standard.removeObject(forKey: "isLoggedIn")
        email = ""
        password = ""
    }
    
    func checkAuthentication() {
        isAuthenticated = UserDefaults.standard.bool(forKey: "isLoggedIn")
    }
}
