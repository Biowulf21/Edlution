import 'dialogue_node.dart';

class Response {
  String responseText;
  DialogueNode? nextDialogueNode;
  int relationsShipPointValue;

  Response({
    required this.responseText,
    this.nextDialogueNode,
    required this.relationsShipPointValue,
  });
}
