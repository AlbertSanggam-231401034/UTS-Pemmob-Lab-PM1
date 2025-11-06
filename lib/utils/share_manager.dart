import 'package:share_plus/share_plus.dart';
import 'package:mbti_quiz/data/mbti_data.dart';

class ShareManager {
  static Future<void> shareResult({
    required String mbtiType,
    required String userName,
    required Map<String, double> percentages,
  }) async {
    final mbtiData = MBTIData.types[mbtiType];

    final shareText = '''
🎯 HASIL TES KEPRIBADIAN MBTI 🎯

Nama: $userName
Tipe Kepribadian: $mbtiType - ${mbtiData?.name ?? ''}

📊 Hasil Dimensi:
• Extraversion (E): ${percentages['E']?.round()}% 
• Introversion (I): ${percentages['I']?.round()}%
• Sensing (S): ${percentages['S']?.round()}%
• Intuition (N): ${percentages['N']?.round()}%
• Thinking (T): ${percentages['T']?.round()}%
• Feeling (F): ${percentages['F']?.round()}%
• Judging (J): ${percentages['J']?.round()}%
• Perceiving (P): ${percentages['P']?.round()}%

${mbtiData?.description ?? ''}

✨ Coba tes kepribadian MBTI Anda juga!
#MBTI #Kepribadian #${mbtiType}
''';

    await Share.share(shareText);
  }

  static Future<void> shareApp() async {
    final shareText = '''
🎭 MBTI Personality Test

Temukan tipe kepribadian Anda dengan tes MBTI yang akurat dan informatif!

✅ 100 pertanyaan mendalam
✅ 16 tipe kepribadian lengkap 
✅ Hasil dengan analisis detail
✅ Riwayat tes tersimpan
✅ Dark/Light mode

Unduh sekarang dan kenali dirimu lebih dalam! 🧠

#MBTI #PersonalityTest #SelfDiscovery
''';

    await Share.share(shareText);
  }
}