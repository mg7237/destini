import 'package:destini_challenge_starting/story_brain.dart';
import 'package:flutter/material.dart';
import 'story_brain.dart';

void main() => runApp(Destini());

class Destini extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

//NTODO: Step 9 - Create a new storyBrain object from the StoryBrain class.
StoryBrain storyBrain = StoryBrain();
String strChoice1 = storyBrain.getChoice1();
String strChoice2 = storyBrain.getChoice2();
String strStory = storyBrain.getStoryTitle();
bool boolButtonVisible = true;

class StoryPage extends StatefulWidget {
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
//            color: Colors.lightBlue.shade200,
            image: DecorationImage(
          image: AssetImage('images/background.png'),
        )),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    //NTODO: Step 10 - use the storyBrain to get the first story title and display it in this Text Widget.
                    storyBrain.getStory(),
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: FlatButton(
                  onPressed: () {
                    //Choice 1 made by user.
                    //NTODO: Step 18 - Call the nextStory() method from storyBrain and pass the number 1 as the choice made by the user.
                    setState(() {
                      storyBrain.nextStory(1);
                      strChoice1 = storyBrain.getChoice1();
                      strChoice2 = storyBrain.getChoice2();
                      strStory = storyBrain.getStoryTitle();
                      boolButtonVisible = storyBrain.buttonShouldBeVisible();
                    });
                  },
                  color: Colors.red,
                  child: Text(
                    //NTODO: Step 13 - Use the storyBrain to get the text for choice 1.
                    strChoice1,
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                child: Visibility(
                  visible: boolButtonVisible,
                  child: FlatButton(
                    onPressed: () {
                      //Choice 2 made by user.
                      //NTODO: Step 19 - Call the nextStory() method from storyBrain and pass the number 2 as the choice made by the user.
                      setState(() {
                        storyBrain.nextStory(2);
                        strChoice1 = storyBrain.getChoice1();
                        strChoice2 = storyBrain.getChoice2();
                        strStory = storyBrain.getStoryTitle();
                        boolButtonVisible = storyBrain.buttonShouldBeVisible();
                      });
                    },
                    color: Colors.blue,
                    child: Text(
                      //NTODO: Step 14 - Use the storyBrain to get the text for choice 1.
                      strChoice2,
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
