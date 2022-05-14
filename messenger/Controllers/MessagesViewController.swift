import UIKit

class MessagesViewController: UIViewController {
    //MARK: - properties
    private let messagesTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Messages"
        tableViewSetup()
        addSubview()
        constraintsSetup()
    }
    
    //MARK: - methods
    private func tableViewSetup() {
        messagesTableView.delegate = self
        messagesTableView.dataSource = self
        
        messagesTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    private func addSubview() {
        view.addSubview(messagesTableView)
    }
    
    private func constraintsSetup() {
        NSLayoutConstraint.activate([
            messagesTableView.topAnchor.constraint(equalTo: view.topAnchor),
            messagesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            messagesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            messagesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension MessageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Danil Sabitov"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
