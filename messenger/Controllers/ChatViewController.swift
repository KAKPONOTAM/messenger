import UIKit
import MessageKit


class ChatViewController: MessagesViewController {
    //MARK: - properties
    private let currentUser = Sender(senderId: "self", displayName: "Danil Sabitov")
    private let otherUser = Sender(senderId: "other", displayName: "Danil Nurgaliev")
    private lazy var otherUserArray: [MessageType] = [
        Message(sender: currentUser, messageId: "1", sentDate: Date().addingTimeInterval(-86400), kind: .text("How is it going?")),
        Message(sender: otherUser, messageId: "2", sentDate: Date().addingTimeInterval(76400), kind: .text("trying to use messageKit")),
        Message(sender: currentUser, messageId: "3", sentDate: Date().addingTimeInterval(-66400), kind: .text("i love making apps. i love making apps. i love making apps. i love making apps.")),
        Message(sender: otherUser, messageId: "4", sentDate: Date().addingTimeInterval(-56400), kind: .text("today is special day ")),
        Message(sender: currentUser, messageId: "5", sentDate: Date().addingTimeInterval(-46400), kind: .text("every day lived as gift")),
        Message(sender: otherUser, messageId: "6", sentDate: Date().addingTimeInterval(-36400), kind: .text("looking really cool"))
    ]
    
    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Chat"
        messageCollectionViewSetup()
    }
    
    private func messageCollectionViewSetup() {
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
    }
    
    //MARK: - methods
}

extension ChatViewController: MessagesDataSource, MessagesLayoutDelegate, MessagesDisplayDelegate {
    func currentSender() -> SenderType {
      return currentUser
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return otherUserArray[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        otherUserArray.count
    }
}
