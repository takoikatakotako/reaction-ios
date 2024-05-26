import SwiftUI

struct ReactionListView: View {
    @StateObject var viewState: ReactionListViewState

    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                    LazyVStack {
                        ZStack(alignment: .trailing) {
                            TextField("Type your search", text: $viewState.searchText)
                                .padding(8)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            if !viewState.searchText.isEmpty {
                                Button(action: {
                                    viewState.clearSearchText()
                                }) {
                                    Image(systemName: "delete.left")
                                        .foregroundColor(Color(UIColor.opaqueSeparator))
                                }
                                .padding(.trailing, 12)
                            }
                        }
                        ForEach(viewState.showingReactions) { (reactionMechanism: ReactionMechanism) in
                            ReactionListRow(reactionMechanism: reactionMechanism, showingThmbnail: $viewState.showingThmbnail, selectJapanese: $viewState.selectJapanese)
                        }
                    }
                    .padding(.bottom, 62)
                }

                if viewState.isFetching {
                    ProgressView()
                        .scaleEffect(1.5, anchor: .center)
                        .progressViewStyle(CircularProgressViewStyle(tint: Color.white))
                        .padding(36)
                        .background(Color(.appMainText).opacity(0.5))
                        .cornerRadius(24)
                }
            }
            .onAppear {
                viewState.onAppear()
            }
            .sheet(item: $viewState.sheet) { (item: ReactionListViewSheet) in
                switch item {
                case .developer:
                    DeveloperView()
                }
            }
            .navigationTitle("List")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                leading: Button(action: {
                    viewState.sheet = .developer
                }, label: {
                    Text("Info")
                })
            )
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    ReactionListView(viewState: ReactionListViewState(showingThmbnail: true, selectJapanese: false))
}