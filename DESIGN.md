#  Design document

1) Programming language
2) Database and Auth
3) Cocopoads
4) Organization


1) Programming language: The project was implemented in Swift UiKit under the MVC (Model, View, 
    VIewController) methodology which is Apple prefered way or architecting apps. Although I started with 
    the idea of implementing MVVM it made the app very complex and harder to implement.
    Also the reason I chose UIKit over storyboards and SwiftUI is becaise after reading and talking to 
    experts, SwiftUI is still a young technology. Now, implementing the project with UIkit made it harder 
    and the amount of documentation is scarce.
    
2) Database and Auth: The selected database was Firebase Auth and Firebase Firestore. The reason
    was because Firebase automatises many things like SignUp and SignIn. For example you can allow 
    users to signup with third party providers like Facebook and Google with very few lines of code. 
    Database management is really simple as well with a very nive GUI. Firebase also manages security. 
    The downside is that as the product scales it could be expensive but if you manage cache well it 
    should not be a problem.
    
3) Cocopoads: The file management system used was Cocopoads and SwiftPackages. With Cocopoads I 
    could manage all the Firebase installation and updates. With SwiftPackages I managed the libraries like 
    Parse. I really preferred Cocopoads for all file management since it is cleaner and command line based 
    which I can control a bit better.
    
4) Organization: The project is separated in:
    a. Screens
    b. Common
    c. Extensions
    d. Pods
    
    a. Screens: Contains all the screens of the project. Each screen has a View and a View Controller. The first screens that I developed where Sign In and Sign Up. Then Home, Photo Screen and Finally the Graph. Each screen communicates with each other via the View Controllers. The Views just display what the user sees.
    b. Common: Contains all the common interface buttons used in the app like buttons, labels, imageButtons, etc. This way I didn't have to re implement those in every singe screen.
    c. Extensions: Are class extensions to be used in the App for things like colors, fonts, etc.
    d. Pods: Are all the files necessary to run third party apps and libraries like Firebase or Parse.
    
    Some other files like App are created automatically by Xcode. 
    Note: Some of the files in Extensions and Common are files that I have been collected since the 
    beginning of the year from other developers and that I've been putting together for future projects. At 
    that point I did not keep track of urls or repos for credit.
    
    

