import 'package:addiction_app/models/question.dart';

class QuestionBank {
  static List<Question> technologyAddiction = [
    Question(
        'İnsanlarla internet üzerinden konuşmayı yüz yüze konuşmaya tercih etmek teknoloji bağımlılığının belirtilerinden biridir.',
        true),
    Question(
        'İnternete girmek için yemek öğünlerimizden, derslerimizden ödün vermeliyiz.',
        false),
    Question(
        'Teknoloji bağımlısı olmamak için, haftalık internet kullanımı çizelgeleri hazırlayıp, uymalıyız.',
        true),
    Question(
        'Elde uyuşukluk, beden duruşunda bozukluk ve gözlerde yanma teknolojiye bağımlı insanlarda görülen bir özelliktir.',
        true),
    Question(
        'Okuldaki başarıda düşüş, kişisel, aile, okul sorunları ve aktivitelerde azalma sosyal alanda görülen bir şikayet değildir.',
        false),
  ];

  static List<Question> smokeAddiction = [
    Question(
        'Sadece sigara kullanan zarar görür, maruz kalan zarar görmez.', false),
    Question('Vücudun her kısmına zarar veren binlerce kimyasal madde içerir.',
        true),
    Question('Her dozu zararlı değildir.', false),
    Question(
        'Kalp ve damar hastalıkları gelişir, Kalp krizi geçirme riski artar.',
        true),
    Question(
        'Sigara kullananlarda, vücutta yorgunluk, aşırı stres ve uykusuzluk gibi durumlar görülmez.',
        false),
  ];

  static List<Question> alcoholAddiction = [
    Question('Bir kere kullanabilirim, ben bağımlı olmam.', false),
    Question(
        'Sindirim sistemi hücrelerine olumsuz etkileri ile vitamin ve besin değeri olan maddelerin emilimine etki olmaktadır.',
        true),
    Question(
        'Alkollü araç önce hızı, sonrada kazayı ve felaketi getirir.', true),
    Question('Alkol kullanımı kişiyi güldürür ve mutlu eder.', false),
    Question(
        'Dertlerden kaçmanın, unutmanın tek yolu alkol kullanmaktır.', false),
  ];
}
