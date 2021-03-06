import SwiftUI
import SDWebImageSwiftUI

struct ReactionListRow: View {
    let reactionMechanism: ReactionMechanism
    @Binding var showingThmbnail: Bool
    @Binding var selectJapanese: Bool
    
    var body: some View {
        NavigationLink(
            destination: ReactionDetailView(selectJapanese: selectJapanese, reactionMechanism: reactionMechanism)) {
            VStack(alignment: .leading) {
                Text(selectJapanese ? reactionMechanism.japanese : reactionMechanism.english)
                    .foregroundColor(Color.black)
                if showingThmbnail {
                    WebImage(url: reactionMechanism.thmbnailUrl)
                        .resizable()
                        .placeholder(Image("placeholder-list"))
                        .scaledToFit()
                }
                Divider()
            }
        }
        .padding(.top, 8)
        .padding(.horizontal, 16)
    }
}

//struct ReactionListRow_Previews: PreviewProvider {
//    static var previews: some View {
//        ReactionListRow(reactionMechanism: ReactionMechanism.mock(), showingThmbnail: true)
//    }
//}
