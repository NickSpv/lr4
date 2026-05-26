import UIKit

final class DoctorProfileViewController: UIViewController {
    private let topRow = UIStackView()
    private let imageView = UIImageView()
    private let fieldsGrid = UIStackView()

    private let firstLabel = UILabel()
    private let middleLabel = UILabel()
    private let lastLabel = UILabel()

    private let firstField = UITextField()
    private let middleField = UITextField()
    private let lastField = UITextField()

    private let descriptionView = UITextView()

    private let buttonsRow = UIStackView()
    private let cancelButton = UIButton(type: .system)
    private let saveButton = UIButton(type: .system)
    private let clearButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = ""

        configureLayout()
        configureStyles()
        wireActions()
    }

    private func configureLayout() {
        topRow.axis = .horizontal
        topRow.spacing = 10
        topRow.alignment = .top
        topRow.translatesAutoresizingMaskIntoConstraints = false

        fieldsGrid.axis = .vertical
        fieldsGrid.spacing = 6
        fieldsGrid.translatesAutoresizingMaskIntoConstraints = false

        [makeFieldRow(label: firstLabel, field: firstField),
         makeFieldRow(label: middleLabel, field: middleField),
         makeFieldRow(label: lastLabel, field: lastField)].forEach {
            fieldsGrid.addArrangedSubview($0)
        }

        topRow.addArrangedSubview(imageView)
        topRow.addArrangedSubview(fieldsGrid)

        descriptionView.translatesAutoresizingMaskIntoConstraints = false
        descriptionView.isScrollEnabled = true

        buttonsRow.axis = .horizontal
        buttonsRow.spacing = 6
        buttonsRow.distribution = .fillEqually
        buttonsRow.translatesAutoresizingMaskIntoConstraints = false
        [cancelButton, saveButton, clearButton].forEach { buttonsRow.addArrangedSubview($0) }

        view.addSubview(topRow)
        view.addSubview(descriptionView)
        view.addSubview(buttonsRow)

        NSLayoutConstraint.activate([
            topRow.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            topRow.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            topRow.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),

            imageView.widthAnchor.constraint(equalToConstant: 104),
            imageView.heightAnchor.constraint(equalToConstant: 92),

            descriptionView.topAnchor.constraint(equalTo: topRow.bottomAnchor, constant: 8),
            descriptionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            descriptionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),

            buttonsRow.topAnchor.constraint(equalTo: descriptionView.bottomAnchor, constant: 8),
            buttonsRow.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            buttonsRow.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            buttonsRow.heightAnchor.constraint(equalToConstant: 42),
            buttonsRow.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8)
        ])
    }

    private func configureStyles() {
        imageView.image = UIImage(named: "flower") ?? UIImage(systemName: "photo")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor.systemGray4.cgColor

        firstLabel.text = "First"
        middleLabel.text = "Middle"
        lastLabel.text = "Last"
        [firstLabel, middleLabel, lastLabel].forEach {
            $0.font = .systemFont(ofSize: 22)
            $0.textColor = .black
        }

        setupField(firstField, placeholder: "First")
        setupField(middleField, placeholder: "Middle")
        setupField(lastField, placeholder: "Last")

        descriptionView.text = "Your description..."
        descriptionView.font = .systemFont(ofSize: 20)
        descriptionView.backgroundColor = UIColor(red: 0.91, green: 0.84, blue: 0.80, alpha: 1)
        descriptionView.textColor = .darkText

        setupButton(cancelButton, title: "Cancel")
        setupButton(saveButton, title: "Save")
        setupButton(clearButton, title: "Clear")
    }

    private func wireActions() {
        clearButton.addTarget(self, action: #selector(clearTapped), for: .touchUpInside)
        saveButton.addTarget(self, action: #selector(saveTapped), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(cancelTapped), for: .touchUpInside)
    }

    @objc private func clearTapped() {
        firstField.text = ""
        middleField.text = ""
        lastField.text = ""
        descriptionView.text = ""
    }

    @objc private func saveTapped() {
        let alert = UIAlertController(title: "Saved", message: "Profile data saved", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }

    @objc private func cancelTapped() {
        firstField.resignFirstResponder()
        middleField.resignFirstResponder()
        lastField.resignFirstResponder()
        descriptionView.resignFirstResponder()
    }

    private func setupField(_ field: UITextField, placeholder: String) {
        field.placeholder = placeholder
        field.borderStyle = .roundedRect
        field.font = .systemFont(ofSize: 20)
        field.textColor = .black
        field.backgroundColor = .white
    }

    private func setupButton(_ button: UIButton, title: String) {
        button.setTitle(title, for: .normal)
        button.backgroundColor = UIColor(red: 0.53, green: 0.80, blue: 0.76, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
    }

    private func makeFieldRow(label: UILabel, field: UITextField) -> UIStackView {
        let row = UIStackView()
        row.axis = .horizontal
        row.spacing = 8
        row.alignment = .center

        label.translatesAutoresizingMaskIntoConstraints = false
        label.widthAnchor.constraint(equalToConstant: 86).isActive = true

        field.translatesAutoresizingMaskIntoConstraints = false
        field.heightAnchor.constraint(equalToConstant: 36).isActive = true

        row.addArrangedSubview(label)
        row.addArrangedSubview(field)
        return row
    }
}
