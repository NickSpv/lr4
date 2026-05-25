import UIKit

final class DoctorProfileViewController: UIViewController {
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let rootStackView = UIStackView()

    private let photoImageView = UIImageView()
    private let fullNameLabel = UILabel()
    private let specialityLabel = UILabel()
    private let qualificationLabel = UILabel()
    private let experienceLabel = UILabel()
    private let aboutTitleLabel = UILabel()
    private let aboutLabel = UILabel()
    private let actionsStackView = UIStackView()
    private let appointmentButton = UIButton(type: .system)
    private let favoriteButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Doctor Profile"
        view.backgroundColor = .systemBackground

        configureViews()
        layoutViews()
        fillContent()
    }

    private func configureViews() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        rootStackView.translatesAutoresizingMaskIntoConstraints = false
        rootStackView.axis = .vertical
        rootStackView.spacing = 8

        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        photoImageView.image = UIImage(systemName: "person.crop.circle.fill")
        photoImageView.contentMode = .scaleAspectFit
        photoImageView.tintColor = .systemTeal

        fullNameLabel.font = .boldSystemFont(ofSize: 30)
        fullNameLabel.textAlignment = .center
        fullNameLabel.adjustsFontSizeToFitWidth = true
        fullNameLabel.minimumScaleFactor = 0.8

        specialityLabel.font = .systemFont(ofSize: 22)
        specialityLabel.textAlignment = .center
        specialityLabel.textColor = .secondaryLabel

        qualificationLabel.numberOfLines = 0
        experienceLabel.numberOfLines = 0

        aboutTitleLabel.font = .boldSystemFont(ofSize: 22)
        aboutTitleLabel.text = "About doctor"

        aboutLabel.numberOfLines = 0
        aboutLabel.font = .systemFont(ofSize: 17)

        actionsStackView.translatesAutoresizingMaskIntoConstraints = false
        actionsStackView.axis = .horizontal
        actionsStackView.spacing = 12
        actionsStackView.distribution = .fillEqually

        appointmentButton.configuration = .filled()
        appointmentButton.configuration?.title = "Book appointment"

        favoriteButton.configuration = .bordered()
        favoriteButton.configuration?.title = "Add to favorites"
    }

    private func layoutViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(rootStackView)

        [photoImageView, fullNameLabel, specialityLabel, qualificationLabel, experienceLabel, aboutTitleLabel, aboutLabel, actionsStackView].forEach {
            rootStackView.addArrangedSubview($0)
        }

        [appointmentButton, favoriteButton].forEach {
            actionsStackView.addArrangedSubview($0)
        }

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor),

            rootStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            rootStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            rootStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            rootStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),

            photoImageView.heightAnchor.constraint(equalToConstant: 90),
            actionsStackView.heightAnchor.constraint(equalToConstant: 44)
        ])
    }

    private func fillContent() {
        fullNameLabel.text = "Anna Smirnova"
        specialityLabel.text = "Cardiologist"
        qualificationLabel.text = "Top qualification category"
        experienceLabel.text = "Work experience: 12 years"
        aboutLabel.text = "Provides diagnosis and treatment of cardiovascular diseases, and consults on prevention and recovery after therapy."
    }
}
