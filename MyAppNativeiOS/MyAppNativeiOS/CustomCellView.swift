//
//  CustomCellView.swift
//  MyAppNativeiOS
//
//  Created by Daniel Sanabria on 14/05/26.
//  Copyright © 2026 SAP. All rights reserved.
//

import SwiftUI

struct CustomCellView: View {
    var headline: String
    var subheadline: String
    var footnote: String
    var status: String

    var body: some View {
        HStack(alignment: .top, spacing: 12) {

            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 40, height: 40)

            VStack(alignment: .leading, spacing: 4) {
                Text(headline)
                    .font(.headline)

                Text(subheadline)
                    .font(.subheadline)
                    .foregroundColor(.gray)

                Text(footnote)
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }

            Spacer()

            VStack(alignment: .trailing) {
                Text(status)
                    .font(.caption)
                    .padding(6)
                    .background(Color.blue.opacity(0.2))
                    .cornerRadius(6)

                Text("Substatus")
                    .font(.caption2)
                    .foregroundColor(.gray)
            }
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    CustomCellView(headline: "Headline", subheadline: "sibHeadline", footnote: "footage", status: "status")
}
