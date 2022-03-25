import UIKit
import MessageKit
import MessageUI

class ChatViewController: MessagesViewController {
    //MARK: - properties
    private var name: String
    
    init(name: String) {
        self.name = name
        
        super.init(nibName: nil, bundle: nil)
    }
    
    private var messageCollectionView: MessagesCollectionView {
        let layout = MessagesCollectionViewFlowLayout()
        layout.minimumLineSpacing = 5
        let collectionView = MessagesCollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = name
    }
    
    private func messageCollectionViewSetup() {
    }
    
    //MARK: - methods
}

extension ChatViewController: MessagesDataSource, MessageLabelDelegate, MessagesDisplayDelegate {
    func currentSender() -> SenderType {
        let sender = SenderType.self
        return sender as! SenderType
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        let message = MessageType.self
        return message as! MessageType
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return 5
        
    }
}
