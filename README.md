# iOS Complited Test

Hi there! This is complited test. In this project I complited all 3 main task, implemented unit tests, improved code readability by adding clear and concise comments throughout my changes, adhered Apple's HIG and Clean Architecture principles.

## Complited Tasks

- SwiftUI Migration.
I migrated ProductDetails module to SwiftUI while using current project architecture.
Firt of all, I created a new SwiftUI view. I added accessibility labels to each element in the view based on Apple's HIG and create subviews to make code more clear and readable.
[Screenshot of the view]
I created new view model based on SOLID principles using protocol.
[Screenshot of the viewModel]
To integrate this SwiftUI module to existing UIKit project I wrapped it into UIKit view controller using UIHostingController.
[Screenshot of the wrapper]
I adhered Clean Architecture principles and project architecture creating GetProductDetailsFlowCoordinator and modifying DependencyInjector and AppFlowCoordinator to make sure that I can create and use new module as usual. 
[Screenshot of the DependencyInjector]

- Integrate product rating.
  I created a custom reusable UI component for displying current product rating. It can be used everywhere. It made it more flexible by adding type property:
  [Screenshot of the View Code]
  [Screenshot of the Enum]
  [Screenshot of the View type]
  [Screenshot of the View type]
  [Screenshot of the View type]

  

- Image Loading Review.
  I refactored and optimised image loading by using existing asynchronus network service. I modified APIEndpoints, created useCase for image downloading, and modified generic decode function to handle Data type. I used it adhering Clean Architecture principles and project architecture.
  [Screenshot of the endpoints]
  [Screenshot of the decode func]

## Editional

- I implemented unit tests.
- I improved code readability by adding clear and concise comments throughout my changes.
- I use Apple's HIG by adding accessibility to the new SwiftUI view

