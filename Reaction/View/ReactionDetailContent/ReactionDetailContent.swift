import SwiftUI

struct ReactionDetailContent: View {
    let localeIdentifier: String
    @State var reactionMechanism: ReactionMechanism

    var body: some View {
        LazyVStack {
            CommonText(text: reactionMechanism.getDisplayTitle(identifier: localeIdentifier), font: Font.system(size: 24))
                .padding(.bottom, 12)

            if !reactionMechanism.generalFormulas.isEmpty {
                VStack(spacing: 0) {
                    CommonText(text: String(localized: "common-general-formula"), font: Font.system(size: 14))
                    ForEach(reactionMechanism.generalFormulas, id: \.self) { generalFormula in
                        CommonWebImage(url: URL(string: reactionMechanism.reactionUrlString + generalFormula.imageName))
                            .scaledToFit()
                            .padding()
                    }
                }
            }

            if !reactionMechanism.mechanisms.isEmpty {
                VStack(spacing: 0) {
                    CommonText(text: String(localized: "common-reaction-mechanism"), font: Font.system(size: 14))
                    ForEach(reactionMechanism.mechanisms, id: \.self) { mechanism in
                        CommonWebImage(url: URL(string: reactionMechanism.reactionUrlString + mechanism.imageName))
                            .scaledToFit()
                            .padding()
                    }
                }
            }

            if !reactionMechanism.examples.isEmpty {
                VStack(spacing: 0) {
                    CommonText(text: String(localized: "common-example"), font: Font.system(size: 14))
                    ForEach(reactionMechanism.examples, id: \.self) { example in
                        CommonWebImage(url: URL(string: reactionMechanism.reactionUrlString + example.imageName))
                            .scaledToFit()
                            .padding()
                    }
                }
            }

            if !reactionMechanism.supplements.isEmpty {
                VStack(spacing: 0) {
                    CommonText(text: String(localized: "common-supplement"), font: Font.system(size: 14))
                    ForEach(reactionMechanism.supplements, id: \.self) { supplement in
                        CommonWebImage(url: URL(string: reactionMechanism.reactionUrlString + supplement.imageName))
                            .scaledToFit()
                            .padding()
                    }
                }
            }

            if !reactionMechanism.youtubeLinks.isEmpty {
                VStack(spacing: 0) {
                    CommonText(text: String(localized: "common-movie"), font: Font.system(size: 14))
                    ForEach(reactionMechanism.youtubeLinks, id: \.self) { youtubeLink in
                        if let youtubeUrl = URL(string: youtubeLink) {
                            Button {
                                openUrl(url: youtubeUrl)
                            } label: {
                                AsyncImage(url: getYoutubeThmbnailUrlString(youtubeUrl: youtubeUrl)) { image in
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .padding()
                                } placeholder: {
                                    ProgressView()
                                        .padding()
                                }
                            }
                        }
                    }
                }
            }
        }
        .padding(.vertical, 16)
        .padding(.bottom, 16)
    }

    private func getYoutubeThmbnailUrlString(youtubeUrl: URL) -> URL {
        let youtubePath = youtubeUrl.path
        return URL(string: "https://img.youtube.com/vi\(youtubePath)/0.jpg")!
    }

    private func openUrl(url: URL) {
        UIApplication.shared.open(url)
    }
}

// struct ReactionDetailContent_Previews: PreviewProvider {
//    static var previews: some View {
//        ReactionDetailContent(selectJapanese: true, reactionMechanism: ReactionMechanism.mock())
//    }
// }
