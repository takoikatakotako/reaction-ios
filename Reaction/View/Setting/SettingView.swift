import SwiftUI
import LicenseList

struct SettingView: View {
    @StateObject var viewState: SettingViewState
    
    var body: some View {
        NavigationStack {
            List {
                Section("App Setting") {
//                    NavigationLink(destination: SettingLangageView()) {
//                        HStack {
//                            Text("Language")
//                            Spacer()
//                            Text(viewState.langage)
//                        }
//                    }
                    
                    Button {
                        if let url = URL(string: UIApplication.openSettingsURLString), UIApplication.shared.canOpenURL(url) {
                            UIApplication.shared.open(url)
                        }
                    } label: {
                        HStack {
                            Text("Language")
                            Spacer()
                            Text(viewState.langage)
                        }
                    }
                    
                    
                    NavigationLink(destination: SettingThmbnailView()) {
                        HStack {
                            Text("Thmbnail")
                            Spacer()
                            if let thmbnail = viewState.thmbnail {
                                Text(thmbnail ? "Show" : "Hidden")
                            }
                        }
                    }
                }
                
                Section("Developer Info") {
                    Button(action: {
                        if let url = URL(string: GITHUB_REPOSITORY_URL) {
                            UIApplication.shared.open(url)
                        }
                    }, label: {
                        HStack {
                            Text("GitHub")
                            Spacer()
                            Image(systemName: "square.and.arrow.up")
                                .padding(.trailing, 8)
                        }
                    })
                }
                
                Section("App Info") {
                    HStack {
                        Text("Version")
                        Spacer()
                        Text(viewState.appVersion)
                    }
                    NavigationLink {
                        LicenseListView()
                    } label: {
                        Text("License")
                    }
                }
                
                Section("Reset") {
                    Button {
                        viewState.reset()
                    } label: {
                        Text("Remove Cache")
                    }
                }
            }
            .onAppear {
                viewState.onAppear()
            }
            .alert("", isPresented: $viewState.showingAlert, actions: {
                
            }, message: {
                Text("Cache Removed!")
            })
            .listStyle(.grouped)
            .navigationTitle("Config")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SettingView(viewState: SettingViewState())
}
