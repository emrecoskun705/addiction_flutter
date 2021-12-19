import 'package:addiction_app/models/question.dart';

class QuestionBank {
  static List<Question> technologyAddiction = [
    Question(
        'İnsanlarla internet üzerinden konuşmayı yüz yüze konuşmaya tercih etmek teknoloji bağımlılığının belirtilerinden biridir.',
        true,
        'İnsanlarla çevrimiçi şeklinde konuşmayı tercih etmek teknoloji bağımlılığının bir belirtisidir.'),
    Question(
        'İnternete girmek için yemek öğünlerimizden, derslerimizden ödün vermeliyiz.',
        false,
        'İnternete girmek için sosyal hayatımızdan ve sağlığımızdan ödün vermemeliyiz.'),
    Question(
        'Teknoloji bağımlısı olmamak için, haftalık internet kullanımı çizelgeleri hazırlayıp, uymalıyız.',
        true,
        'Teknoloji bağımlısı olmamak için teknolojiye sınırlı vakit harcamalıyız bu yüzden çizelge hazırlamalıyız.'),
    Question(
        'Elde uyuşukluk, beden duruşunda bozukluk ve gözlerde yanma teknolojiye bağımlı insanlarda görülen bir özelliktir.',
        true,
        'Teknoloji bağımlılığı insanlarda elde uyuşukluk, beden duruşunda bozukluk ve gözlerde yanma gibi durumlara sebep olur.'),
    Question(
        'Okuldaki başarıda düşüş, kişisel, aile, okul sorunları ve aktivitelerde azalma sosyal alanda görülen bir şikayet değildir.',
        false,
        'Teknoloji bağımlısı olan insanlarda derslerde düşüş ve sosyal hayatta başarısızlıklar gözlenir.'),
  ];

  static List<Question> smokeAddiction = [
    Question(
        'Sadece sigara kullanan zarar görür, maruz kalan zarar görmez.',
        false,
        'Sigara içilen ortamda bulunmak sigara içen kişi kadar etkilenmenize sebep olur buna da pasif içicilik denir.'),
    Question(
        'Vücudun her kısmına zarar veren binlerce kimyasal madde içerir.',
        true,
        'Sigarada birçok madde bulunmaktadır ve bu maddeler vücudun her bölümüne zarar verir.'),
    Question('Her dozu zararlı değildir.', false,
        'Sigaranın her düzeyi zararlıdır, bir kez kullanılsa bile vücuda kötü anlamda etkisi olur.'),
    Question(
        'Kalp ve damar hastalıkları gelişir, Kalp krizi geçirme riski artar.',
        true,
        'Sigara birçok kalp hastalığının yanında kalp krizi riskini de arttırır.'),
    Question(
        'Sigara kullananlarda, vücutta yorgunluk, aşırı stres ve uykusuzluk gibi durumlar görülmez.',
        false,
        'Sigara içen kişilerde uyku problemleri ortaya çıkar ve stresli bir yaşam tarzına sahip olurlar.'),
  ];

  static List<Question> alcoholAddiction = [
    Question('Bir kere kullanabilirim, ben bağımlı olmam.', false,
        'Alkol bir kere kullanılsa da vücuda kötü etkileri olduğu gibi bağımlılığa da neden olur.'),
    Question(
        'Sindirim sistemi hücrelerine olumsuz etkileri ile vitamin ve besin değeri olan maddelerin emilimine etki olmaktadır.',
        true,
        'Alkolun sindirimi üzerinde olumsuz etkileri vardır bunlardan en önemlisi vitaminlerin besinlerin emilimini azaltmasıdır.'),
    Question(
        'Alkollü araç önce hızı, sonrada kazayı ve felaketi getirir.',
        true,
        'Alkol bağımlılığı araç kullanan insanların hayatını riske atar, kazaya ve felaketlere sebep olur.'),
    Question('Alkol kullanımı kişiyi güldürür ve mutlu eder.', false,
        'Alkol kişiyi gerçek hayattan uzaklaştırır, gerçeklikleri görmemesine sebep olur ve mutlu etmez.'),
    Question(
        'Dertlerden kaçmanın, unutmanın tek yolu alkol kullanmaktır.',
        false,
        'Dertlerden kaçmanın yolu olarak görmek yanlıştır, sosyal hayatta dertlerimizi çözmek için gerçek hayattan uzak olmamamız gerekir ve bu yüzden alkol kullanılmamalıdır.'),
  ];
}
