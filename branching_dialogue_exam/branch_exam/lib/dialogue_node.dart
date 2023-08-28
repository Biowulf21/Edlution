import 'response.dart';

class DialogueNode {
  String npcDialogue;
  List<Response> playerOptions;
  DialogueNode? nextNPCDialogue;

  DialogueNode({
    required this.npcDialogue,
    required this.playerOptions,
  });
}
