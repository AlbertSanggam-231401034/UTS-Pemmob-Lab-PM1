import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mbti_quiz/utils/storage_manager.dart';
import 'package:mbti_quiz/data/mbti_data.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<Map<String, dynamic>> _results = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadResults();
  }

  Future<void> _loadResults() async {
    try {
      final results = await StorageManager.getResults();
      setState(() {
        _results = results;
        _isLoading = false;
      });
    } catch (e) {
      print('Error loading results: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _clearHistory() async {
    final shouldClear = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Hapus Riwayat'),
        content: Text('Apakah Anda yakin ingin menghapus semua riwayat tes?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text('Batal'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text('Hapus'),
          ),
        ],
      ),
    );

    if (shouldClear == true) {
      await StorageManager.clearResults();
      setState(() {
        _results = [];
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Riwayat tes berhasil dihapus')),
      );
    }
  }

  String _formatDate(String isoDate) {
    final date = DateTime.parse(isoDate);
    return '${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Riwayat Tes',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: isDarkMode ? Colors.black : Colors.blue.shade800,
        foregroundColor: Colors.white,
        actions: [
          if (_results.isNotEmpty)
            IconButton(
              onPressed: _clearHistory,
              icon: Icon(Icons.delete_outline_rounded),
              tooltip: 'Hapus Riwayat',
            ),
        ],
      ),
      body: _isLoading
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text(
              'Memuat riwayat...',
              style: GoogleFonts.inter(
                color: isDarkMode ? Colors.grey.shade400 : Colors.grey.shade600,
              ),
            ),
          ],
        ),
      )
          : _results.isEmpty
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.history_rounded,
              size: 80,
              color: isDarkMode ? Colors.red.shade400 : Colors.blue.shade600,
            ),
            SizedBox(height: 16),
            Text(
              'Belum Ada Riwayat Tes',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Hasil tes Anda akan muncul di sini',
              style: GoogleFonts.inter(
                color: isDarkMode ? Colors.grey.shade400 : Colors.grey.shade600,
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/main');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: isDarkMode ? Colors.red.shade700 : Colors.blue.shade700,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
              child: Text('Mulai Tes Pertama'),
            ),
          ],
        ),
      )
          : ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: _results.length,
        itemBuilder: (context, index) {
          final result = _results[index];
          final mbtiType = result['mbtiType'] as String;
          final mbtiData = MBTIData.types[mbtiType];
          final date = _formatDate(result['date'] as String);
          final userName = result['userName'] as String;
          final userGender = result['userGender'] as String;

          return Card(
            margin: EdgeInsets.only(bottom: 16),
            color: isDarkMode ? Colors.grey.shade800 : Colors.white,
            elevation: 2,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  // MBTI Type Badge
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: mbtiData != null
                          ? MBTIData.getGroupColor(mbtiData.group).withOpacity(0.1)
                          : Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: mbtiData != null
                            ? MBTIData.getGroupColor(mbtiData.group)
                            : Colors.grey,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          mbtiType,
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: mbtiData != null
                                ? MBTIData.getGroupColor(mbtiData.group)
                                : Colors.grey,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          mbtiData?.name ?? 'Unknown',
                          style: GoogleFonts.inter(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: isDarkMode ? Colors.grey.shade400 : Colors.grey.shade600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16),

                  // Result Details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userName,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: isDarkMode ? Colors.white : Colors.black87,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          mbtiData?.group ?? 'Unknown Group',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: mbtiData != null
                                ? MBTIData.getGroupColor(mbtiData.group)
                                : Colors.grey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          date,
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: isDarkMode ? Colors.grey.shade400 : Colors.grey.shade600,
                          ),
                        ),
                        SizedBox(height: 8),
                        Wrap(
                          spacing: 6,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: isDarkMode ? Colors.grey.shade700 : Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                'Gender: ${userGender.toUpperCase()}',
                                style: GoogleFonts.inter(
                                  fontSize: 10,
                                  color: isDarkMode ? Colors.grey.shade300 : Colors.grey.shade700,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: isDarkMode ? Colors.grey.shade700 : Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                'Test ${_results.length - index}',
                                style: GoogleFonts.inter(
                                  fontSize: 10,
                                  color: isDarkMode ? Colors.grey.shade300 : Colors.grey.shade700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // View Details Button
                  IconButton(
                    onPressed: () {
                      _showResultDetails(context, result, mbtiData);
                    },
                    icon: Icon(
                      Icons.visibility_rounded,
                      color: isDarkMode ? Colors.red.shade400 : Colors.blue.shade600,
                    ),
                    tooltip: 'Lihat Detail',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _showResultDetails(BuildContext context, Map<String, dynamic> result, MBTIType? mbtiData) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final percentages = Map<String, double>.from(result['percentages'] as Map);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: isDarkMode ? Colors.grey.shade900 : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 60,
                height: 4,
                decoration: BoxDecoration(
                  color: isDarkMode ? Colors.grey.shade600 : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Detail Hasil Tes',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : Colors.black87,
              ),
            ),
            SizedBox(height: 16),
            if (mbtiData != null) ...[
              _buildDetailRow('Tipe Kepribadian', '${result['mbtiType']} - ${mbtiData.name}'),
              _buildDetailRow('Kelompok', mbtiData.group),
              _buildDetailRow('Nama', result['userName'] as String),
              _buildDetailRow('Gender', (result['userGender'] as String).toUpperCase()),
              _buildDetailRow('Tanggal Tes', _formatDate(result['date'] as String)),
            ],
            SizedBox(height: 20),
            Text(
              'Persentase Dimensi:',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: isDarkMode ? Colors.white : Colors.black87,
              ),
            ),
            SizedBox(height: 12),
            _buildPercentageBar('Extraversion (E)', percentages['E'] ?? 0, isDarkMode),
            _buildPercentageBar('Sensing (S)', percentages['S'] ?? 0, isDarkMode),
            _buildPercentageBar('Thinking (T)', percentages['T'] ?? 0, isDarkMode),
            _buildPercentageBar('Judging (J)', percentages['J'] ?? 0, isDarkMode),
            SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: isDarkMode ? Colors.red.shade700 : Colors.blue.shade700,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text('Tutup'),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.inter(
              color: isDarkMode ? Colors.grey.shade400 : Colors.grey.shade600,
            ),
          ),
          Text(
            value,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w600,
              color: isDarkMode ? Colors.white : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPercentageBar(String label, double percentage, bool isDarkMode) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  color: isDarkMode ? Colors.grey.shade400 : Colors.grey.shade600,
                ),
              ),
              Text(
                '${percentage.round()}%',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: isDarkMode ? Colors.white : Colors.black87,
                ),
              ),
            ],
          ),
          SizedBox(height: 4),
          Container(
            height: 6,
            width: double.infinity,
            decoration: BoxDecoration(
              color: isDarkMode ? Colors.grey.shade800 : Colors.grey.shade300,
              borderRadius: BorderRadius.circular(3),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: 6,
                width: (percentage / 100) * MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  color: isDarkMode ? Colors.red.shade400 : Colors.blue.shade600,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}