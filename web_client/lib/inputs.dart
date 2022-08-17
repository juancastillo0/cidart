import 'package:jaspr_bootstrap/hooks.dart';

TextInput useTextInput([String initialText = '']) {
  final obs = useObs(() => initialText);
  final obsInput = useRef<Object?>(() => null);
  useEffect(() {
    if (obsInput.value != null) {
      (obsInput.value as dynamic).value = obs.value;
    }
    return null;
  }, [obsInput.value, obs.value]);

  final events = {
    'input': (e) {
      obsInput.value = e.target;
      obs.value = e.target.value!;
    }
  };

  return TextInput(events: events, obs: obs);
}

class TextInput {
  final Obs<String> obs;
  final Map<String, void Function(Object?)> events;

  TextInput({
    required this.obs,
    required this.events,
  });

  String get value => obs.value;
  set value(String newValue) => obs.value = newValue;
}
