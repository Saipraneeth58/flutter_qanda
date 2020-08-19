class questions{
  int _queno=0;
  List<String> _questionbank=[
    'Some cats are actually allergic to humans',
    'You can lead a cow down stairs but not up stairs.',
    'Approximately one quarter of human bones are in the feet.',
    'A slug\'s blood is green.',
    'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".',
    'It is illegal to pee in the Ocean in Portugal.',
    'No piece of square dry paper can be folded in half more than 7 times.',
    'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
  ];
  void nextQuestion(){
    if (_queno<_questionbank.length-1)
    {
      _queno++;
    }
    else {
      isfinished();
    }

  }
  String getQuestionText()
  {
    return _questionbank[_queno];
  }
  bool isfinished()
  {
    if (_queno<_questionbank.length-1)
    {
      return false;
    }
    else {
      return true;
    }

  }
  void reset(){
    _queno=0;
  }
}

