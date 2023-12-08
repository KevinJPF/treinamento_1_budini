import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:treinamento/widgets/app_theme.dart';
import 'package:treinamento/widgets/custom_icon_button.dart';
import 'package:treinamento/widgets/custom_textfield.dart';
import 'package:treinamento/widgets/header.dart';

class SpeechText extends StatefulWidget {
  const SpeechText({super.key});

  @override
  State<SpeechText> createState() => _SpeechTextState();
}

class _SpeechTextState extends State<SpeechText> {
  final controllerName = TextEditingController();
  final controllerSurname = TextEditingController();
  final controllerAddress = TextEditingController();
  final controllerFather = TextEditingController();
  final controllerMother = TextEditingController();

  ValueNotifier valueListenable = ValueNotifier(false);

  SpeechToText _speechToText = SpeechToText();
  bool _felipeListen = false;
  bool _speakName = false;
  String _sobrenome = '';
  String _spokenText = '';
  String keyForSpeak = '';
  String languageID = '';
  List<String> portugueseKeyWords = [''];
  List<String> englishKeyWords = [''];

  @override
  void initState() {
    super.initState();
    _initSpeech();
    obterIdiomaPadrao();
  }

  Future<void> obterIdiomaPadrao() async {
    var selectedLocale = await _speechToText.systemLocale();

    languageID = (selectedLocale!.localeId);
    print(selectedLocale.localeId);
  }

  void setLanguage() async {
    languageID = languageID == 'pt-BR' ? 'en-US' : 'pt-BR';
    portugueseKeyWords = ['sobrenome', 'endereço', 'pai', 'mãe'];
    englishKeyWords = ['surname', 'address', 'father', 'mother'];
    // keyForSpeak = languageID == 'pt-BR' ? 'Felipe' : 'Lucas';
  }

  /// This has to happen only once per app
  void _initSpeech() async {
    await _speechToText.initialize();
    setState(() {});
  }

  /// Each time to start a speech recognition session
  void _startListening({bool speakName = false}) async {
    _speakName = speakName;
    _felipeListen = false;
    await _speechToText.listen(
      onResult: _onSpeechResult,
      localeId: languageID,
      listenFor: Duration(seconds: 10),
      pauseFor: Duration(seconds: 60),
      cancelOnError: true,
    );
    setState(() {});
  }

  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.
  void _stopListening() async {
    _felipeListen = false;
    _speakName = false;
    print('Chamou o stop!!!!!!!!!!!!');

    await _speechToText.stop();
    setState(() {});
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      if (_speakName) {
        controllerName.text = result.recognizedWords;
      } else if (!_felipeListen) {
        _spokenText = result.recognizedWords;
        var targetKeywords =
            languageID == 'pt-BR' ? portugueseKeyWords : englishKeyWords;

        if (targetKeywords.any((keyword) =>
            _spokenText.toLowerCase().contains(keyword.toLowerCase()))) {
          _felipeListen = true;
          keyForSpeak = targetKeywords.firstWhere(
              (keyword) => _spokenText.contains(keyword.toLowerCase()));
        }
      } else if (_felipeListen) {
        var validText = result.recognizedWords.substring(
          result.recognizedWords.indexOf(keyForSpeak) + keyForSpeak.length + 1,
          result.recognizedWords.length,
        );

        print(keyForSpeak);
        switch (keyForSpeak) {
          case 'sobrenome':
            controllerSurname.text = validText;
            break;
          case 'surname':
            controllerSurname.text = validText;
            break;
          case 'endereço':
            controllerAddress.text = validText;
            break;
          case 'address':
            controllerAddress.text = validText;
            break;
          case 'pai':
            controllerFather.text = validText;
            break;
          case 'father':
            controllerFather.text = validText;
            break;
          case 'mãe':
            controllerMother.text = validText;
            break;
          case 'mother':
            controllerMother.text = validText;
            break;
        }
        // RegExp regex = RegExp(
        //   r'\b(\d+(?:,\d+)?)\s*(?:metro|m|altura|height|tall)?(?:\s*(?:e|and)\s*(\d+(?:,\d+)?)\s*(?:metro|m|altura|height|tall)?)?\b',
        //   caseSensitive: false,
        // );
        // Match? match = regex.firstMatch(result.recognizedWords.substring(
        //   result.recognizedWords.indexOf(keyForSpeak) + keyForSpeak.length + 1,
        //   result.recognizedWords.length,
        // ));
        // if (match != null) {
        //   double numero = double.parse(match.group(0)!.replaceAll(',', '.'));

        //   double parteInteira =
        //       double.parse(match.group(1)!.replaceAll(',', '.'));

        //   double parteDecimal = match.group(2) != null
        //       ? double.parse(match.group(2)!.replaceAll(',', '.'))
        //       : 0;

        //   double altura = parteInteira + parteDecimal / 100;

        //   controllerSurname.text = altura.toString() + " metro(s)";
        // }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppTheme.customColors['background-top']!,
                    AppTheme.customColors['background-bottom']!,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                children: [
                  Header(
                    tituloHeader: languageID == 'en-US'
                        ? 'My Assistant Lucas'
                        : 'Meu Assistente Felipe',
                    hasLeftIcon: true,
                    leftIcon: CupertinoIcons.arrow_left,
                    hasRightIcon: false,
                    onPressedLeft: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    width: double.infinity,
                    alignment: Alignment.center,
                    // color: Colors.green,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            padding: EdgeInsets.only(right: 16, bottom: 16),
                            // height: 100,
                            // color: Colors.blue,
                            child: CustomTextField(
                              controllerText: controllerName,
                              hintText: languageID == 'pt-BR' ? 'Nome' : 'Name',
                              isPassword: false,
                              removeSpaces: false,
                              titleText:
                                  languageID == 'pt-BR' ? 'Nome' : 'Name',
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.only(bottom: 16),
                            // color: Colors.red,
                            child: CustomIconButton(
                              onPressed: () {
                                setState(() {
                                  print('nameButton: $languageID');
                                  print('nameButton: $keyForSpeak');
                                  !_speakName
                                      ? _startListening(speakName: true)
                                      : _stopListening();
                                });
                              },
                              buttonHeight: 48,
                              buttonMarginTop: 0,
                              buttonMarginBottom: 0,
                              buttonMarginLeft: 0,
                              buttonMarginRight: 0,
                              buttonBackColor: _speakName
                                  ? AppTheme.customColors['white-100']!
                                  : AppTheme.customColors['white-54']!,
                              buttonBorderWidth: 0,
                              buttonBorderColor: Colors.transparent,
                              buttonTopLeftRadius: 6,
                              buttonTopRightRadius: 6,
                              buttonBottomLeftRadius: 6,
                              buttonBottomRightRadius: 6,
                              buttonIcon: _speakName
                                  ? CupertinoIcons.mic
                                  : CupertinoIcons.mic_off,
                              buttonIconColor: Colors.black,
                              buttonIconSize: 30,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                    alignment: Alignment.center,
                    // color: Colors.blue,
                    child: CustomTextField(
                      controllerText: controllerSurname,
                      hintText: languageID == 'pt-BR' ? 'Sobrenome' : 'Surname',
                      isPassword: false,
                      removeSpaces: false,
                      titleText:
                          languageID == 'pt-BR' ? 'Sobrenome' : 'Surname',
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                    alignment: Alignment.center,
                    // color: Colors.blue,
                    child: CustomTextField(
                      controllerText: controllerAddress,
                      hintText: languageID == 'pt-BR' ? 'Endereço' : 'Address',
                      isPassword: false,
                      removeSpaces: false,
                      titleText: languageID == 'pt-BR' ? 'Endereço' : 'Address',
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                    alignment: Alignment.center,
                    // color: Colors.blue,
                    child: CustomTextField(
                      controllerText: controllerFather,
                      hintText: languageID == 'pt-BR' ? 'Pai' : 'Father',
                      isPassword: false,
                      removeSpaces: false,
                      titleText: languageID == 'pt-BR' ? 'Pai' : 'Father',
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                    alignment: Alignment.center,
                    // color: Colors.blue,
                    child: CustomTextField(
                      controllerText: controllerMother,
                      hintText: languageID == 'pt-BR' ? 'Mãe' : 'Mother',
                      isPassword: false,
                      removeSpaces: false,
                      titleText: languageID == 'pt-BR' ? 'Mãe' : 'Mother',
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    width: double.infinity,
                    alignment: Alignment.center,
                    color: _speechToText.isListening
                        ? Colors.green[600]
                        : Colors.red,
                    child: Text(
                      _spokenText == '' ? '-' : _spokenText,
                      style: AppTheme.customTextStyles['medium-14'],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    width: double.infinity,
                    alignment: Alignment.center,
                    color: _speechToText.isListening
                        ? Colors.green[600]
                        : Colors.red,
                    child: Text(
                      _speechToText.isListening
                          ? languageID == 'en-US'
                              ? 'Speak Now'
                              : 'Fale agora'
                          : languageID == 'en-US'
                              ? 'Touch the button to speak'
                              : 'Toque no botão para falar',
                      style: AppTheme.customTextStyles['medium-14'],
                    ),
                  ),
                  Container(
                    width: 60,
                    margin: EdgeInsets.only(top: 16),
                    child: CustomIconButton(
                      onPressed: () {
                        setState(() {
                          _speechToText.isNotListening
                              ? {
                                  setLanguage(),
                                  print('languageButton: $languageID'),
                                  print('languageButton: $keyForSpeak'),
                                }
                              : null;
                        });
                      },
                      buttonHeight: 60,
                      buttonMarginTop: 0,
                      buttonMarginBottom: 0,
                      buttonMarginLeft: 0,
                      buttonMarginRight: 0,
                      buttonBackColor: _speechToText.isNotListening
                          ? (languageID == 'en-US'
                              ? AppTheme.customColors['dark-blue-100']!
                              : AppTheme.customColors['green-100']!)
                          : (languageID == 'en-US'
                              ? AppTheme.customColors['dark-blue-54']!
                              : AppTheme.customColors['green-54']!),
                      buttonBorderWidth: 0,
                      buttonBorderColor: Colors.transparent,
                      buttonTopLeftRadius: 6,
                      buttonTopRightRadius: 6,
                      buttonBottomLeftRadius: 6,
                      buttonBottomRightRadius: 6,
                      buttonIcon: CupertinoIcons.flag_fill,
                      buttonIconColor: _speechToText.isNotListening
                          ? (languageID == 'en-US'
                              ? AppTheme.customColors['white-100']!
                              : AppTheme.customColors['black-100']!)
                          : (languageID == 'en-US'
                              ? AppTheme.customColors['white-54']!
                              : AppTheme.customColors['black-54']!),
                      buttonIconSize: 30,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      languageID == 'en-US' ? 'Inglês' : 'Português',
                      style: AppTheme.customTextStyles['medium-14'],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _speechToText.isNotListening ? _startListening() : _stopListening();
            print('floatingButton: $languageID');
            print('floatingButton: $keyForSpeak');
            print('floatingButton: $_felipeListen');
          });
        },
        tooltip: 'Listen',
        backgroundColor:
            _speechToText.isNotListening ? Colors.red : Colors.blue,
        child: Icon(_speechToText.isNotListening ? Icons.mic_off : Icons.mic),
      ),
    );
  }
}
