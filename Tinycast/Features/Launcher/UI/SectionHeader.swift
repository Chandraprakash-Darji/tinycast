import SwiftUI

/// The TUI section label: an uppercase mono word flanked by hairlines, echoing the portfolio's
/// `─── title ────` grammar. Shared by every palette list.
struct SectionHeader: View {
    let title: String
    /// The first header hugs the top; later ones get spacing above, reading as below.
    var isFirst = false
    /// A gear beside the label, for a section whose membership the reader chooses.
    var configure: (() -> Void)?
    var configureHelp = "Configure…"

    var body: some View {
        HStack(spacing: Theme.Spacing.sm) {
            Rectangle()
                .fill(Theme.Colors.border)
                .frame(width: Theme.Size.sectionRuleWidth, height: 1)
            Text(title.uppercased())
                .font(Theme.Typography.sectionHeader)
                .tracking(Theme.Typography.labelTracking)
                .foregroundStyle(Theme.Colors.textSecondary)
                .lineLimit(1)
                .layoutPriority(1)
            if let configure {
                Button(action: configure) {
                    Image(systemName: "gearshape")
                        .imageScale(.small)
                        .contentShape(Rectangle())
                }
                .buttonStyle(.plain)
                .help(configureHelp)
            }
            Rectangle()
                .fill(Theme.Colors.border)
                .frame(maxWidth: .infinity, maxHeight: 1)
        }
        .padding(.horizontal, Theme.Spacing.md)
        .padding(.top, isFirst ? Theme.Spacing.xs : Theme.Spacing.sectionSpacing)
        .padding(.bottom, Theme.Spacing.sectionHeaderBottom)
    }
}
