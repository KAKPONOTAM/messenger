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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = name
        messageCollectionViewSetup()
    }
    
    private func messageCollectionViewSetup() {
        messagesCollectionView.delegate = self
        messagesCollectionView.dataSource = self
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
