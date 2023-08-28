import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './dialogue_provider.dart';
import './constant.dart';

class DialogueStart extends StatefulWidget {
  const DialogueStart({super.key});

  @override
  State<DialogueStart> createState() => _DialogueStartState();
}

class _DialogueStartState extends State<DialogueStart> {
  late DialogueProvider _provider;

  @override
  void initState() {
    super.initState();
    _provider = DialogueProvider();
  }

  @override
  void dispose() {
    super.dispose();
    _provider.resetRelationshipPoints();
    _provider.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Let\'s Go'),
      ),
      body: ChangeNotifierProvider(
        create: (context) => _provider,
        child: Consumer<DialogueProvider>(
          builder: (context, provider, _) {
            if (provider.currentDialogue != null) {
              return SizedBox(
                height: double.maxFinite,
                width: double.maxFinite,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        character,
                        style: TextStyle(fontSize: 3),
                      ),
                      Text(
                        provider.currentDialogue!.npcDialogue,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount:
                            provider.currentDialogue!.playerOptions.length,
                        itemBuilder: (context, index) {
                          return ElevatedButton(
                              onPressed: () {
                                provider.goToNextNPCDialogue(index);
                              },
                              child: Text(provider.currentDialogue!
                                  .playerOptions[index].responseText));
                        },
                      )
                    ],
                  ),
                ),
              );
            } else {
              return Center(
                child: Text(
                  'FRIENDSHIP STAT : ${provider.relationshipPoints}',
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
