import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.framework(name: Module.presantation.name,
                                dependencies: [.snapKit, .then, .rxSwift, .rxCocoa, .rxGesture] + [Module.util.project]
)
