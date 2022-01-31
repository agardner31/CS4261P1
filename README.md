# CS4261P1
## Instructions for TA
1. Download code on environment that has flutter. 
2. Run application (note: you may need to use the command flutter run --no-sound-null-safety given some plugins that rely on depricated packages)
3. You should see the entrance which says 'MetaGallery'. To enter, you must knock like this - 'knock, knock, knock, knock, knock (short pause) knock, knock" - like you would for a friend or for a secret meeting.
4. Then, you will be prompted to enter your name. If you have come to the gallery before, then you will automatically be guided to your suggested art to admire. If you have not, then you will take a 'Buzzfeed'-like quiz in order to match you with your art piece. 
5. The goal is to make this app much more interactive and visually pleasing in the longrun (and that the suggested art piece be an NFT), but this was my first experience with any backend, so I definitely had a big learning curve for all of the Firebase set-up etc. 
6. Enjoy your suggested content!


## Application Creation Process and Key Learnings:
1. I had to update my Android Studio to Arctic Fox since I had not used it for a long time. Then, I ran 'flutter doctor' to see if the environment was properly set up to create a Flutter app. It indicated that I needed to update my android licenses, but the root issue was that I needed to update the flutter, dart, and kotlin plugins for android studio and restart it as well as update some android sdk tools: https://stackoverflow.com/questions/46402772/failed-to-install-android-sdk-java-lang-noclassdeffounderror-javax-xml-bind-a/51644855 and https://stackoverflow.com/questions/59647791/android-studio-not-installed-when-run-flutter-doctor-while-android-studio-in . Finally the environment was working!
2. I sketched a simple storyboard for my idea, making sure to include the required functionalities. ![alt text](https://github.com/agardner31/CS4261P1/blob/master/storyboard.jpg)
3. Then I set up a simple homepage and lobby for my Virtual Gallery app and pushed this to GitHub :)  
4. The next functionality was a 7-knock requirement to enter the first door of the app and to also add a knock sound to this tap action: https://stackoverflow.com/questions/59625936/flutter-detect-triple-tap 
5. I connected and set up all of the firebase necessities for basic authentication on my app using this entire youtube tutorial series (multiple hours for this step with a lot of debugging and failure because I have never done any backend coding before!): https://www.youtube.com/watch?v=LBJoY4VjECo&list=PL4cUxeGkcC9j--TKIdkb3ISfRbJeJYQwC&index=5 ![alt text]()
6. Then I created a flow chart that the user will go through for the app to decide their personalized art gallery and the UI that goes along with it. ![alt text](https://github.com/agardner31/CS4261P1/blob/master/flowchart.jpg)
8. Joshua Lau helped me define this flow chart and upload images for the virtual gallery to be displayed on the app.
