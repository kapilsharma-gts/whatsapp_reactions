library whatsapp_reactions;

export 'scr/whatsapp_reactions.dart';
export 'package:whatsapp_reactions/scr/widgets/reaction_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_reactions/scr/models/emotions.dart';
import 'package:whatsapp_reactions/scr/models/reaction_box_paramenters.dart';
import 'package:whatsapp_reactions/scr/widgets/reaction_box.dart';

class Reactionpopup {
  static void showReaction(
    BuildContext context, {
    required Offset offset,
    Function(Emotions)? handlePressed,
    Emotions? emotionPicked,
    ReactionBoxParamenters? boxParamenters,
  }) async {
    final double left = offset.dx;
    final double top = offset.dy;

    final ReactionBoxParamenters paramenters =
        boxParamenters ?? ReactionBoxParamenters();

    await showMenu(
      context: context,
      color: Colors.transparent,
      position: RelativeRect.fromLTRB(
        left,
        top - paramenters.reactionBoxHeight - paramenters.iconSpacing * 2,
        left,
        top - paramenters.iconSpacing * 3,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          paramenters.radiusBox,
        ),
      ),
      constraints: BoxConstraints(
        maxWidth: paramenters.reactionBoxWidth,
      ),
      items: [
        PopupMenuItem(
          padding: EdgeInsets.zero,
          enabled: false,
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Brightness.light == paramenters.brightness
                    ? Colors.grey.shade300
                    : Colors.grey.shade800,
                width: .2,
              ),
              color: Brightness.light == paramenters.brightness
                  ? Colors.white
                  : Colors.black,
              borderRadius: BorderRadius.circular(
                paramenters.radiusBox,
              ),
            ),
            height: paramenters.reactionBoxHeight,
            width: paramenters.reactionBoxWidth,
            padding: const EdgeInsets.symmetric(
              vertical: 4.0,
            ),
            child: ReactionBox(
              emotions: Emotions.values,
              handlePressed: handlePressed ?? (Emotions emo) {},
              boxParamenters: paramenters,
              emotionPicked: emotionPicked,
            ),
          ),
        ),
      ],
      elevation: 0,
    );
  }
}
