#  User's manual

Project presentation url: https://youtu.be/GMHaDYDOeng
Project website: www.roveapp.co. The website was made by my syster. The website was done in Webflow. The website is just to portray the idea of the project but does not intend to be part of the project.

The idea:
Rove is a an IOs app for networked memory. Basically all photo-storage apps work in a linear way, meaning you store images in folders making it really hard to find and discover photos. Rove is non-linear, it is a graph-like database that works just how our brain and memory works. Non-linear apps are comon for note taking like for example Roam Research, Notion or even Wikipedia. That said, Rove allows users to upload their media, edit, store and share in a way that makes it delightful to discover photos or videos.

Installation:
Although below you can see step by step instructions I made a video just in case https://youtu.be/7I0Jswl2WtE
1) Make sure you have a Mac and latest version of Xcode installed
2) Copy the project folder in your Mac. The folder contains all the Pods needed to run the project so no 
    need to install pods.
3) Double clic on the the Rove.xcworkspace file
4) Xcode should open up and load the project
5) Select Iphone 12 Pro as the default simulator simulator
6) Hit the play button and the project should compile and open up the simulator. 
7) Start with the usage
8) Access to Firebase was sent to guw968@g.harvard.edu. For info on how to see the info on Firebase 
    read the DESIGN.MD

Usage:

1) Sign up
2) Users will be created in Firebase via the AUTH service.
3) Once you SIgn up for the first time you can then login again via Sign In. Forgot password is still not 
    implemented.
4) If you try to sign in but no luck, check your email and password again, alerts are still not implemented so if it is not letting you log in is because the combination is wrong.
5) Click on upload image. Apple will display the image picker and some demo images. Select only one.
6) Select choose or cancel if you want to select another one.
7) You must add a description. You should add a short description with maximum 2 words within double brackets and minimum 2 words in double brackets. If you happen to not do this the app will crash since I did not have time to build the edge cases. An example description would be: "My trip to [[india]] and [[australia]]". Once finished, tap somewhere else in the screen that’s not the keyboard to hide the keyboard. Tap in Store.
8) The first word in double brackets will create the parent node. The second word in double brackets will be the child node. The parent node will be created with the image selected. The child node will be a reference to associate (connect) other nodes. So if you typed “My trip to [[india]] and [[australia]].” a parent node with “india” will be created. Then if another media is uploaded and the description is “My amazing vacation in [[australia]] and [[bali]]”, a line will connect the two nodes. To test the app try first with this description: 
    "My vacation to [[india]] and [[australia]]"
9) Ideally, repeating parent nodes should store the image in the node that's already created. That's still not implemented so try not repeating parent nodes.
10) You are now in the main Graph. If you so far selected 1 image you will see 1 node. To connect your nodes upload another media. Make sure you create it with the child node of the first image to see the connection. 
        Here are descriptions to test other images
        Image 2: "I loved my trip to [[australia]] now heading to [[bali]]"
        Image 3: ''Now [[relaxing]] at [[home]]"

    Since image 3 is not connected to any mode it will not have a line to the other nodes.
11) Do not upload more than 4 images. It will start breaking the app since controls and details are still not 
    implemented.


