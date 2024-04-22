# iOS Completed Test

Hi there! This is a completed test. In this project I completed all 3 main tasks, implemented unit tests, improved code readability by adding clear and concise comments throughout my changes, adhered to Apple's HIG and Clean Architecture principles.

## Completed Tasks

- SwiftUI Migration
  
I migrated ProductDetails module to SwiftUI while using current project architecture.
First of all, I created a new SwiftUI view. I added accessibility labels to each element in the view based on Apple's HIG and create subviews to make code clearer and more readable.

![](https://github.com/oceaniswater/B-W/blob/main/Screenshots/ProductDetailsView.png)
![](https://github.com/oceaniswater/B-W/blob/main/Screenshots/ProductDetailsViewCode.png)

I created a new view model based on SOLID principles using protocol.

![](https://github.com/oceaniswater/B-W/blob/main/Screenshots/ProductDetailsViewModel.png)

To integrate this SwiftUI module with existing UIKit project I wrapped it into UIKit view controller using UIHostingController.

![](https://github.com/oceaniswater/B-W/blob/main/Screenshots/SwiftUIViewWrapper.png)

By adhering to Clean Architecture principles and project architecture, I added GetProductDetailsFlowCoordinator and modified DependencyInjector and AppFlowCoordinator to make sure that I could create and use new module as usual.

![](https://github.com/oceaniswater/B-W/blob/main/Screenshots/DI.png)

- Product Rating Integration
  
  I created a custom reusable UI component for displying current product rating. It can be used everywhere. I made it more flexible by adding a type property:
  
![](https://github.com/oceaniswater/B-W/blob/main/Screenshots/FiveStarsViewCode.png)
![](https://github.com/oceaniswater/B-W/blob/main/Screenshots/fullRating.png)
![](https://github.com/oceaniswater/B-W/blob/main/Screenshots/shortRating.png)
![](https://github.com/oceaniswater/B-W/blob/main/Screenshots/onlyStars.png)

- Image Loading Review
 
  I refactored and optimised image loading by using existing asynchronous network service. I modified APIEndpoints, created useCase for image downloading, and modified generic decode function to handle Data type. I relied on Clean Architecture principles and project architecture.
  
![](https://github.com/oceaniswater/B-W/blob/main/Screenshots/apiendpoints.png)
![](https://github.com/oceaniswater/B-W/blob/main/Screenshots/decodefunc.png)

## Additional

- I implemented unit tests.
- I improved code readability by adding clear and concise comments throughout my changes.
- I used Apple's HIG by adding accessibility to the new SwiftUI view
- Some additional improvements (e.g. added activity view to the ProductDetailsViewCell)


