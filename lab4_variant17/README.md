# Лабораторная работа №4

В этой работе тот же экран профиля врача сверстан программно, без `Storyboard`.

Состав файлов:
- `DoctorProfileViewController.swift` - экран, полностью созданный кодом;
- `AppDelegate.swift`, `SceneDelegate.swift` - запуск `UIKit`-экрана без `Storyboard`;
- `control_questions.md` - ответы на контрольные вопросы.

Экран использует `UIScrollView`, `UIStackView` и `Auto Layout` констрейнты, заданные программно.

## Минимальный запуск в Xcode

1. `File -> New -> Project -> iOS App (UIKit, Swift, Storyboard)`.
2. Добавить в проект файлы:
   - `DoctorProfileViewController.swift`
   - `AppDelegate.swift`
   - `SceneDelegate.swift`
3. Удалить автосозданный `ViewController.swift`.
4. В `Signing & Capabilities` выбрать `Team`.
5. Запустить на симуляторе (`Cmd+R`).
