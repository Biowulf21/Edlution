import 'package:dialogue_player/dialogue_tree.dart';
import 'package:dialogue_player/response.dart';
import 'package:flutter/foundation.dart';

import 'dialogue_node.dart';

class DialogueProvider with ChangeNotifier {
  static int _relationshipPoints = 0;
  DialogueNode? _currentDialogue;
  late DialogueTree dialogueTree;

  DialogueNode? get currentDialogue => _currentDialogue;

  set currentDialogue(DialogueNode? dialogueNode) {
    _currentDialogue = dialogueNode;
    notifyListeners();
  }

  DialogueProvider() {
    DialogueNode start = DialogueNode(
        npcDialogue: 'Hi, what are you doing here?',
        // nextNPCDialogue:
        playerOptions: [
          Response(
              responseText: 'Let\'s be friends.',
              nextDialogueNode: firstDepthOption1,
              relationsShipPointValue: 5),
          Response(
              responseText: 'I\'m looking for you.',
              nextDialogueNode: firstDepthOption2,
              relationsShipPointValue: 2),
          Response(
              responseText: 'Get away from me!',
              nextDialogueNode: firstDepthOption3,
              relationsShipPointValue: -2),
        ]);
    currentDialogue = start;
    dialogueTree = DialogueTree(start);
  }

  setRelationshipPoints(int points) {
    _relationshipPoints += points;
    notifyListeners();
  }

  resetRelationshipPoints() {
    _relationshipPoints = 0;
    notifyListeners();
  }

  void goToNextNPCDialogue(int playerOption) {
    if (playerOption < currentDialogue!.playerOptions.length) {
      this.setRelationshipPoints(
          currentDialogue!.playerOptions[playerOption].relationsShipPointValue);

      currentDialogue = dialogueTree.getNextNPCDialogue(playerOption);

      notifyListeners();
    }
  }

  int get relationshipPoints => _relationshipPoints;
}
