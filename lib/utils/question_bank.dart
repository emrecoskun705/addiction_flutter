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
    Question(
        'Günlük internet kullanım saatlerini değiştirmek Teknoloji Bağımlılığının kontrol alma yöntemlerden biridir.',
        true,
        'Günlük internet kullanım saatlerini değiştirmek Teknoloji Bağımlılığını kontrol altına alabilir. '),
    Question(
        'Bilgisayarınızdan uzak kaldığınız zaman gergin ve boşluktaymış gibi hissetmek Teknoloji Bağımlılığının belirtilerindendir.',
        true,
        'Bilgisayarınızdan uzak kaldığınız zaman gergin ve boşluktaymış gibi hissediyorsanız Teknoloji Bağımlılığısı olabilirsiniz.'),
    Question('Gece geç saatlere kadar bilgisayar başında kalmalıyız.', false,
        'Gece geç saatlere kadar bilgisayar başında kalmamalıyız.'),
    Question(
        'Teknoloji bağımlılığı, teknolojinin insanı kontrol etmesi durumudur.',
        true,
        'Teknoloji bağımlılığı, teknolojinin insanı kontrol etmesi durumuyla teşhis edilip, tanımlanabilir.'),
    Question(
        'Teknoloji bağımlılığı söz konusu olduğunda teknoloji hayatı kolaylaştıran bir unsura dönüşmektedir.',
        false,
        'Teknoloji bağımlılığı söz konusu olduğunda teknoloji hayatı zorlaştıran bir unsura dönüşmektedir.')
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
    Question(
        'Sigara bağımlılığı tedavi edilebilir bir kronik beyin hastalığıdır.',
        true,
        'Sigara bağımlılığı kroniktir yani sürekli tekrar eder fakat tedavi edilebilir bir hastalıktır.'),
    Question(
        'Sigara bağımlılığı tedavi edilmezse ömür boyu devam etmez.',
        false,
        'Sigara bağımlılığı tedavi edilmezse ömür boyu devam eder ve insanın hayatının kısıtlanmasına sebep olur.'),
    Question('Sigara bağımlılığı yüzünden insanlar yoksunluk çekerler.', true,
        'Yoksunluk, vücudun bir şeyi alamadığında vücudun verdiği psikolojik tepkilerdir. Örneğin uzun süre sigara içmeyen birinin sinirlenmesi.'),
    Question('Sigaranın sosyal ilişkilere etkisi yoktur.', false,
        'Sigara okul,aile, arkadaş çevresinin olumsuz şekilde etkilenmesine sebep olur ve sosyal bağlarımızın zayıflamasına sebep olur.'),
    Question(
        'Yeşilay, sigara bağımlılığı ile mücadele eden bir kurumdur.',
        true,
        'Yeşilay alkol, sigara gibi vücuda zararı olan maddelerle savaşan bir kurumdur.'),
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
