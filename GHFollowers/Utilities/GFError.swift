//
//  GFError.swift
//  GHFollowers
//
//  Created by Peyton Shetler on 4/8/20.
//  Copyright © 2020 Peyton Shetler. All rights reserved.
//
import Foundation

enum GFError: String, Error {
    case invalidUsername = "This username created an invalid request. Please try again."
    case unableToComplete = "Unable to complete your request. Please check your internet connection."
    case invalidResponse = "Invalid response from the server. Please try again."
    case statusCode400 = "Invalid request. Please try again."
    case statusCode404 =  "Resource not found. Please try again."
    case statusCode500 = "Server error. Please try again."
    case unknownError = "Unknown error occurred. Please try again."
    case invalidData =  "The data recieved from the server was invalid. Please try again."
}
