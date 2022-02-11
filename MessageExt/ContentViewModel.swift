//
//  ContentViewModel.swift
//  MessageExt
//
//  Created by Brian Dashore on 2/11/22.
//

import Foundation
import Messages

@MainActor
class ContentViewModel: ObservableObject {
    internal var parentMessageController: MSMessagesAppViewController
    @Published var showFileImporter: Bool = true
    @Published var showErrorAlert: Bool = false
    @Published var errorDescription: String = ""

    init(_ messageController: MSMessagesAppViewController) {
        parentMessageController = messageController
    }

    func attachToMessage(path: URL) async {
        defer {
            path.stopAccessingSecurityScopedResource()
        }

        guard let activeConversation = parentMessageController.activeConversation else {
            debugPrint("Couldn't find the current active conversation!")
            await showError(description: "Couldn't find the current active conversation!")

            return
        }

        do {
            if path.startAccessingSecurityScopedResource() {
                try await activeConversation.insertAttachment(path, withAlternateFilename: nil)

                parentMessageController.dismiss()
            } else {
                debugPrint("Couldn't access the secure resource for \(path)")
                await showError(description: "Could not access the selected file, aborted.")
            }
        } catch {
            debugPrint("Message attachment error: \(error)")
            await showError(description: error.localizedDescription)
        }
    }

    func showError(description: String) async {
        errorDescription = description
        showFileImporter = false

        try? await Task.sleep(seconds: 1)
        showErrorAlert.toggle()
    }
}
