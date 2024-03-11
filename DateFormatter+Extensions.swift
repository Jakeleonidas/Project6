//
//  DateFormatter+Extensions.swift
//  BeReal.
//
//  Created by Jorge Marquez on 2/25/24.
//

import Foundation

extension DateFormatter {
    static var postFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter
    }()
}
