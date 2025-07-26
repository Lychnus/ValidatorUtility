//
//  ContentView.swift
//  ValidatorUtility
//
//  Created by Tahir Anil Oghan on 25.07.2025.
//

import SwiftUI

// MARK: - Implementation
struct ContentView {
    @State private var input: String = ""
    @State private var resultMessages: [String] = []
    
    private let validator = DevTools.validator
}

// MARK: - View
extension ContentView: View {
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Input")) {
                    TextField("Enter a value...", text: $input)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .onChange(of: input) { oldValue, newValue in
                            if oldValue != newValue {
                                validate()
                            }
                        }
                }
                
                Section(header: Text("Validation Results")) {
                    if resultMessages.isEmpty {
                        Text("No input yet.")
                            .foregroundStyle(.secondary)
                    } else {
                        ForEach(resultMessages, id: \.self) { result in
                            Label(result, systemImage: "checkmark.seal.fill")
                                .foregroundColor(.green)
                        }
                    }
                }
            }
            .navigationTitle("Validator Demo")
        }
        .onAppear { validate() }
    }
}

// MARK: - Private Helpers
extension ContentView {
    
    private func validate() {
        resultMessages = []
        
        guard !input.isEmpty else { return }
        
        if validator.isLowercased(input) { resultMessages.append("Lowercased ✅") }
        if validator.isUppercased(input) { resultMessages.append("Uppercased ✅") }
        if validator.onlyAlphabet(input) { resultMessages.append("Only Alphabet ✅") }
        if validator.onlyNumber(input) { resultMessages.append("Only Number ✅") }
        if validator.onlyAlphanumeric(input) { resultMessages.append("Only Alphanumeric ✅") }
        if validator.onlySymbol(input) { resultMessages.append("Only Symbols ✅") }
        if validator.onlyEmoji(input) { resultMessages.append("Only Emojis ✅") }
        if validator.containsWhitespace(input) { resultMessages.append("Contains Whitespace ⚠️") }
        if validator.matchesPattern(input, pattern: .email) { resultMessages.append("Valid Email ✅") }
        if validator.matchesPattern(input, pattern: .password(minLength: 8, requiresUppercase: true, requiresNumber: true, requiresSymbol: true)) {
            resultMessages.append("Strong Password ✅")
        }
    }
}

// MARK: - Preview
#Preview {
    ContentView()
}
