# WhatsApp Reactions

[![Pub](https://img.shields.io/pub/v/whatsapp_reactions.svg)](https://pub.dev/packages/whatsapp_reactions)

WhatsApp Reactions is a Flutter package that provides a customizable and smooth reaction popup, similar to WhatsApp's reaction feature. It allows users to select from a set of predefined emotions when reacting to content.

## Preview

![Preview 1](https://github.com/kapilsharma-gts/whatsapp_reactions/blob/main/appscreenshots/new%20animation%20.png?raw=true)
![Preview 2](https://github.com/kapilsharma-gts/whatsapp_reactions/blob/main/appscreenshots/new%20iconm.png?raw=true)

<!-- Animation using gft builder - Coming Soon -->

## Installation

Add the following line to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  whatsapp_reactions: ^version_number
```

## Usage

```
import 'package:flutter/material.dart';
import 'package:whatsapp_reactions/whatsapp_reactions.dart';
import 'package:whatsapp_reactions/scr/models/emotions.dart';
import 'package:whatsapp_reactions/scr/models/reaction_box_paramenters.dart';
import 'package:whatsapp_reactions/scr/widgets/reaction_box.dart';

```

```
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

```

## Example

```
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

## Upcoming Feature: Builder

We are thrilled to announce that the upcoming feature in My Awesome App is the "Builder" feature. This feature will revolutionize how you interact with the app.

### Builder Feature Highlights

- Create custom widgets effortlessly.
- Design your own unique user interfaces.
- Take control of app layout with ease.

Stay tuned for more updates on the "Builder" feature, which is coming soon!

## Feedback

We value your feedback and suggestions. If you have any questions or need assistance, please don't hesitate to contact our support team at support@myawesomeapp.com.

Thank you for choosing My Awesome App. We hope you enjoy using it!

---

© 2023 Whatapp_Reaction. All rights reserved. Images and content used in this document are for illustrative purposes only. Actual app features may vary.
