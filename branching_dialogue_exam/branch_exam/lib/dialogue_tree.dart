import 'package:dialogue_player/response.dart';

import 'dialogue_node.dart';

class DialogueTree {
  DialogueNode? currentDialogueNode;

  DialogueTree(this.currentDialogueNode);

  DialogueNode? getNextNPCDialogue(int playerOption) {
    if (playerOption < currentDialogueNode!.playerOptions.length) {
      currentDialogueNode =
          currentDialogueNode!.playerOptions[playerOption].nextDialogueNode;
      return currentDialogueNode;
    }
    throw Exception('Invalid player option');
  }

  Response getResponse(int playerOption) {
    if (playerOption > 0 &&
        playerOption < currentDialogueNode!.playerOptions.length) {
      return currentDialogueNode!.playerOptions[playerOption];
    }
    throw Exception('Invalid player option');
  }

  bool hasNextDialogue() {
    return currentDialogueNode!.nextNPCDialogue != null;
  }

  DialogueNode? getNextDialogue() {
    if (hasNextDialogue()) {
      DialogueNode nextNode = currentDialogueNode!.nextNPCDialogue!;
      return nextNode;
    }
    return null;
  }
}

// FIRST DEPTH OF CHOICES
DialogueNode firstDepthOption1 = DialogueNode(
    npcDialogue:
        'That took a lot of guts to say. Thank you for being so honest with me.',
    playerOptions: [
      // {'reponse': , 'relationship_points_value': 5},
      Response(
          responseText: 'We are buddies now.',
          nextDialogueNode: thirdDepthOption1,
          relationsShipPointValue: 5),

      Response(
          responseText: 'I\'m looking forward to seeing you again next time',
          nextDialogueNode: null,
          relationsShipPointValue: 2),

      Response(
          responseText: 'Want to eat together?',
          nextDialogueNode: secondDepthOption1,
          relationsShipPointValue: 2),
    ]);

DialogueNode firstDepthOption2 =
    DialogueNode(npcDialogue: 'Hmmm, do I know you?', playerOptions: [
  // {'reponse': , 'relationship_points_value': 5},
  Response(
      responseText: 'No, but I want to be friends.',
      nextDialogueNode: firstDepthOption1,
      relationsShipPointValue: 5),

  Response(
      responseText: 'Yup, we\'ve met before.',
      nextDialogueNode: secondDepthOption2,
      relationsShipPointValue: 1),

  Response(
      responseText: 'No, but do you want to eat together?',
      nextDialogueNode: thirdDepthOption2,
      relationsShipPointValue: 0),
]);

DialogueNode firstDepthOption3 =
    DialogueNode(npcDialogue: 'Did I say sooomething wrong?', playerOptions: [
  // {'reponse': , 'relationship_points_value': 5},
  Response(
      responseText: 'I hate you.',
      nextDialogueNode: null,
      relationsShipPointValue: 0),

  Response(
      responseText: 'Leave, I love being alone',
      nextDialogueNode: null,
      relationsShipPointValue: -2),

  Response(
      responseText: 'Get away from me, grrrr!',
      nextDialogueNode: null,
      relationsShipPointValue: -3),
]);

// SECOND DEPTH OF CHOICES
DialogueNode secondDepthOption1 =
    DialogueNode(npcDialogue: 'Yup, let\'s eat together?', playerOptions: [
  Response(
      responseText: 'Can you lend me some money?',
      nextDialogueNode: null,
      relationsShipPointValue: -3),
  Response(
      responseText: 'Thank you for going with me.',
      nextDialogueNode: null,
      relationsShipPointValue: 2),
  Response(
      responseText: 'Order what you want. It\'s on me!',
      nextDialogueNode: null,
      relationsShipPointValue: 5),
]);

DialogueNode secondDepthOption2 = DialogueNode(
    npcDialogue: 'I remember now, we\'re in the same class. Can I help you?',
    playerOptions: [
      Response(
          responseText: 'Let\'s be friends, please',
          nextDialogueNode: firstDepthOption1,
          relationsShipPointValue: 5),
      Response(
          responseText: 'Nevermind, bye.',
          nextDialogueNode: null,
          relationsShipPointValue: 0),
      Response(
          responseText: 'Can you lend me some money?',
          nextDialogueNode: null,
          relationsShipPointValue: -3),
    ]);

// THIRD DEPTH OF CHOICES

DialogueNode thirdDepthOption1 =
    DialogueNode(npcDialogue: 'Want to eat together now?', playerOptions: [
  Response(
      responseText: 'Yup, let\'s eat together',
      nextDialogueNode: null,
      relationsShipPointValue: 5),
  Response(
      responseText: 'Maybe next time.',
      nextDialogueNode: null,
      relationsShipPointValue: 0),
  Response(
      responseText: 'Can you lend me some money?',
      nextDialogueNode: null,
      relationsShipPointValue: -2),
]);

DialogueNode thirdDepthOption2 = DialogueNode(
    npcDialogue: 'I\'m sorry, but maybe next time.',
    playerOptions: [
      Response(
          responseText: 'I hate you',
          nextDialogueNode: null,
          relationsShipPointValue: -3),
      Response(
          responseText: 'Okay, looking forward.',
          nextDialogueNode: null,
          relationsShipPointValue: 2),
      Response(
          responseText: 'You are rude.',
          nextDialogueNode: firstDepthOption3,
          relationsShipPointValue: -5),
    ]);
