# iOS Complited Test

Hi there! This is complited test. In this project I complited all 3 main task, implemented unit tests, improved code readability by adding clear and concise comments throughout my changes, adhered Apple's HIG and Clean Architecture principles.

## Complited Tasks

- SwiftUI Migration.
  
I migrated ProductDetails module to SwiftUI while using current project architecture.
Firt of all, I created a new SwiftUI view. I added accessibility labels to each element in the view based on Apple's HIG and create subviews to make code more clear and readable.

![](https://github.com/oceaniswater/B-W/blob/main/Screenshots/ProductDetailsView.png)
![](https://github.com/oceaniswater/B-W/blob/main/Screenshots/ProductDetailsViewCode.png)

I created new view model based on SOLID principles using protocol.

![](https://github.com/oceaniswater/B-W/blob/main/Screenshots/ProductDetailsViewModel.png)

To integrate this SwiftUI module to existing UIKit project I wrapped it into UIKit view controller using UIHostingController.

![](https://github.com/oceaniswater/B-W/blob/main/Screenshots/SwiftUIViewWrapper.png)

I adhered Clean Architecture principles and project architecture creating GetProductDetailsFlowCoordinator and modifying DependencyInjector and AppFlowCoordinator to make sure that I can create and use new module as usual.

![](https://github.com/oceaniswater/B-W/blob/main/Screenshots/DI.png)

- Integrate product rating.
  
  I created a custom reusable UI component for displying current product rating. It can be used everywhere. It made it more flexible by adding type property:
  
![](https://github.com/oceaniswater/B-W/blob/main/Screenshots/FiveStarsViewCode.png)
![](https://github.com/oceaniswater/B-W/blob/main/Screenshots/fullRating.png)
![](https://github.com/oceaniswater/B-W/blob/main/Screenshots/shortRating.png)
![](https://github.com/oceaniswater/B-W/blob/main/Screenshots/onlyStars.png)

- Image Loading Review.
- 
  I refactored and optimised image loading by using existing asynchronus network service. I modified APIEndpoints, created useCase for image downloading, and modified generic decode function to handle Data type. I used it adhering Clean Architecture principles and project architecture.
  
  [Screenshot of the endpoints]
  [Screenshot of the decode func]

## Editional

- I implemented unit tests.
- I improved code readability by adding clear and concise comments throughout my changes.
- I use Apple's HIG by adding accessibility to the new SwiftUI view

