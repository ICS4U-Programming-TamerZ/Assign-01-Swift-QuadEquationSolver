import Foundation
//
//  QuadraticEquation.swift
//
//  Created by Tamer Zreg
//  Created on 2024-03-20
//  Version 1.0
//  Copyright (c) Tamer Zreg. All rights reserved.
//
// A Game that solves quadratic equations for not just 0 but every value of y.

// ANSI escape codes for colored text
struct ANSIColors {
    static let ANSI_BLACK_BACKGROUND = "\u{001B}[40m"
    static let ANSI_RESET = "\u{001B}[0m"
    static let ANSI_RED = "\u{001B}[31m"
    static let ANSI_GREEN = "\u{001B}[32m"
    static let ANSI_YELLOW = "\u{001B}[33m"
}

// Method to calculate quadratic roots
func calculateQuadraticRoots(a: Double, b: Double, c: Double) -> [Double]? {
    // Find Discriminant to make sure that no negative roots occur.
    let discriminant = b * b - 4 * a * c
    // Check if Discriminant is Positive
    if discriminant >= 0 {
        // Calculate roots
        let firstRoot = (-b + sqrt(discriminant)) / (2 * a)
        let secondRoot = (-b - sqrt(discriminant)) / (2 * a)
        // Return roots as array
        return [firstRoot, secondRoot]
    } else {
        // No real roots
        return nil
    }
}

// Display introductory message
print("\(ANSIColors.ANSI_BLACK_BACKGROUND)\(ANSIColors.ANSI_RED)\n\n\n\n\n\n\n\n\n\nThis program calculates the roots of a quadratic equation (f(x) = ax^2 + bx + c)!\(ANSIColors.ANSI_RESET)")

// Prompt user to continue or quit
print("Enter 'q' to quit, any other key to continue.")
var quitResponse = readLine()

// Loop until user decides to quit
while quitResponse != "q" {
    // Input coefficients and equated value
    // Output to Console, ask for a, and get input.
    print("\(ANSIColors.ANSI_YELLOW)Enter the value of a: \(ANSIColors.ANSI_RESET)", terminator: "")
    guard let aValue = Double(readLine() ?? "") else {
        print("Invalid input. Please enter a numeric value for a.")
        continue
    }
    // Output to Console, ask for b, and get input.
    print("\(ANSIColors.ANSI_YELLOW)Enter the value of b: \(ANSIColors.ANSI_RESET)", terminator: "")
    guard let bValue = Double(readLine() ?? "") else {
        print("Invalid input. Please enter a numeric value for b.")
        continue
    }
    // Output to Console, ask for c, and get input.
    print("\(ANSIColors.ANSI_YELLOW)Enter the value of c: \(ANSIColors.ANSI_RESET)", terminator: "")
    guard let cValue = Double(readLine() ?? "") else {
        print("Invalid input. Please enter a numeric value for c.")
        continue
    }
    // What is the y value of the equation set to? Get input..
    print("\(ANSIColors.ANSI_YELLOW)What is the equation equated to? (value of f(x)): \(ANSIColors.ANSI_RESET)", terminator: "")
    guard let equatedTo = Double(readLine() ?? "") else {
        print("Invalid input. Please enter a numeric value for the equation equated to value.")
        continue
    }
    let cAdjusted = cValue - equatedTo // Adjusting for equation equated to value
    // Check if the equation is quadratic
    if aValue == 0 {
        print("Your equation must be a quadratic equation where (a) cannot equal zero.")
        break
    }
    // Calculate roots
    if let roots = calculateQuadraticRoots(a: aValue, b: bValue, c: cAdjusted) {
        // Display roots
        print("\(ANSIColors.ANSI_GREEN)The roots of the equation \(aValue)x^2 + \(bValue)x + \(cValue) are:\(ANSIColors.ANSI_RESET)")
        for root in roots {
            print(root)
        }
    } else {
        // No real roots
        print("\(ANSIColors.ANSI_RED)No real Solutions\(ANSIColors.ANSI_RESET)")
    }
    // Prompt user to continue or quit
    print("\(ANSIColors.ANSI_RED)Enter 'q' to quit, any other key to continue.\(ANSIColors.ANSI_RESET)")
    quitResponse = readLine() // Read user response
}
