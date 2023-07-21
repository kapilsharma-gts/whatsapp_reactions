# WhatsApp Reactions

[![Pub](https://img.shields.io/pub/v/whatsapp_reactions.svg)](https://pub.dev/packages/whatsapp_reactions)

WhatsApp Reactions is a Flutter package that provides a customizable and smooth reaction popup, similar to WhatsApp's reaction feature. It allows users to select from a set of predefined emotions when reacting to content.

## Preview
<p>
<img src="https://github.com/Askany-NDN/reaction_button_askany/blob/main/screenshots/IMG_0470.png?raw=true" width=180/>
<img src="https://github.com/Askany-NDN/reaction_button_askany/blob/main/screenshots/IMG_0471.png?raw=true" width=180/>
<img src="https://github.com/Askany-NDN/reaction_button_askany/blob/main/screenshots/IMG_0465.png?raw=true" width=180/>
<img src="https://github.com/Askany-NDN/reaction_button_askany/blob/main/screenshots/IMG_0467.png?raw=true" width=180/>
</p>

## Installation

Add the following line to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  whatsapp_reactions: ^version_number
Replace version_number with the latest version of the package. You can find the latest version on the whatsapp_reactions package page on pub.dev.

Usage
To use the WhatsApp Reactions package, import the necessary files:

dart
Copy code
import 'package:flutter/material.dart';
import 'package:whatsapp_reactions/whatsapp_reactions.dart';
import 'package:whatsapp_reactions/scr/models/emotions.dart';
import 'package:whatsapp_reactions/scr/models/reaction_box_paramenters.dart';
import 'package:whatsapp_reactions/scr/widgets/reaction_box.dart';
Then, use the Reactionpopup.showReaction method to show the reaction popup:

dart
Copy code
void showReactionPopup(BuildContext context, Offset offset) {
  Reactionpopup.showReaction(
    context,
    offset: offset,
    handlePressed: (Emotions emotion) {
      // Handle the selected emotion here.
      print('Selected emotion: $emotion');
    },
  );
}
In this example, the showReactionPopup function takes the BuildContext and the Offset where you want to display the reaction popup. When the user selects an emotion, the provided callback function (handlePressed) will be called, and you can handle the selected emotion as needed.

Example
Here's an example of how to use the whatsapp_reactions package:

dart
Copy code
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('WhatsApp Reactions Demo')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            final buttonOffset = Offset(100, 100); // Replace with your button's offset.
            showReactionPopup(context, buttonOffset);
          },
          child: Text('Show Reaction Popup'),
        ),
      ),
    ),
  ));
}

void showReactionPopup(BuildContext context, Offset offset) {
  Reactionpopup.showReaction(
    context,
    offset: offset,
    handlePressed: (Emotions emotion) {
      print('Selected emotion: $emotion');
    },
  );
}
```
