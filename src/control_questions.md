# Контрольные вопросы к лабораторной работе №4

## 1. Класс UIView
`UIView` - базовый класс для визуальных элементов интерфейса в `UIKit`. Он отвечает за отображение содержимого на экране, хранит размеры и положение элемента, поддерживает вложенность других представлений и обработку событий.
Пример:
```swift
let cardView = UIView()
cardView.backgroundColor = .systemGray6
cardView.layer.cornerRadius = 12
```

## 2. Класс UIViewController
`UIViewController` управляет экраном приложения и жизненным циклом его представления. В нём обычно размещают код настройки интерфейса, обработку действий пользователя и координацию между моделью и отображением. Контроллер получает события вроде `viewDidLoad`, `viewWillAppear` и другие.
Пример:
```swift
override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
}
```

## 3. Программное создание элементов интерфейса
Элементы интерфейса можно создавать без `Storyboard`, напрямую в коде: `UILabel()`, `UIButton(type:)`, `UIImageView()` и так далее. После создания элемент настраивают, добавляют через `addSubview` и задают ему констрейнты. Такой подход удобен, когда нужен полный контроль над интерфейсом.
Пример:
```swift
let titleLabel = UILabel()
titleLabel.text = "Профиль врача"
view.addSubview(titleLabel)
```

## 4. Программное создание констрейнтов
При программной верстке обычно отключают `translatesAutoresizingMaskIntoConstraints` и создают ограничения через `NSLayoutConstraint` или `layout anchors`. Например, можно привязать `topAnchor`, `leadingAnchor`, задать ширину, высоту и отступы. После этого ограничения активируют через `NSLayoutConstraint.activate`.
Пример:
```swift
titleLabel.translatesAutoresizingMaskIntoConstraints = false
NSLayoutConstraint.activate([
    titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
    titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
])
```
