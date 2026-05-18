# iOS Project Structure (Lab 4)

Папки:
- `App/` - жизненный цикл приложения
- `Models/` - модели данных
- `Views/` - кастомные UIView/ячейки
- `ViewControllers/` - контроллеры экранов
- `Resources/` - storyboard/xib/assets
- `Supporting/` - вспомогательные файлы

Для этой лабы:
- `App/AppDelegate.swift`
- `App/SceneDelegate.swift`
- `ViewControllers/DoctorProfileViewController.swift`

Как запустить в Xcode:
1. Создать новый UIKit App проект.
2. Заменить AppDelegate/SceneDelegate на файлы из `App/`.
3. Добавить контроллер из `ViewControllers/`.
4. Назначить его стартовым (через SceneDelegate или Storyboard).
5. Выбрать Team/Bundle ID и нажать Run.
