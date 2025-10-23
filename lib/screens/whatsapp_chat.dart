import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'dart:ui';

class WhatsappChat extends StatelessWidget {
  const WhatsappChat({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: _ChatAppBar(),
      body: _ChatBody(),
      bottomNavigationBar: _MessageInputBar(),
    );
  }
}

class _ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _ChatAppBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFF6F6F6),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFa6a6aa),
            offset: Offset(0, 0.33),
            blurRadius: 0,
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF007AFF)),
                onPressed: () => context.pop(),
              ),
              const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/images/310_1975.png'),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Martha Craig',
                      style: GoogleFonts.lato(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'tap here for contact info',
                      style: GoogleFonts.lato(
                        fontSize: 12,
                        color: const Color(0xFF8E8E93),
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.videocam_outlined, color: Color(0xFF007AFF)),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.call_outlined, color: Color(0xFF007AFF)),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(88.0);
}

class _ChatBody extends StatelessWidget {
  const _ChatBody();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/images/310_1783.png',
            fit: BoxFit.cover,
          ),
        ),
        ListView(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20.0),
          children: const [
            _SentMessageBubble(text: 'I will write from Japan', time: '17:47'),
            _SentMessageBubble(text: 'Good bye!', time: '17:47'),
            _DateSeparator(date: 'Fri, Jul 26'),
            _SentMessageBubble(text: 'Good morning!', time: '10:10'),
            _SentMessageBubble(text: 'Japan looks amazing!', time: '10:10'),
            _FileMessageBubble(fileName: 'IMG_0475', fileSize: '2.4 MB', fileType: 'png', time: '10:15'),
            _FileMessageBubble(fileName: 'IMG_0481', fileSize: '2.8 MB', fileType: 'png', time: '10:15'),
            _ReceivedMessageBubble(text: 'Do you know what time is it?', time: '11:40'),
            _SentMessageBubble(text: 'It’s morning in Tokyo 😎', time: '11:43'),
            _ReceivedMessageBubble(text: 'What is the most popular meal in Japan?', time: '11:45'),
            _ReceivedMessageBubble(text: 'Do you like it?', time: '11:45'),
            _SentMessageBubble(text: 'I think top two are:', time: '11:50'),
            _FileMessageBubble(fileName: 'IMG_0483', fileSize: '2.8 MB', fileType: 'png', time: '11:51'),
            _FileMessageBubble(fileName: 'IMG_0484', fileSize: '2.6 MB', fileType: 'png', time: '11:51'),
          ],
        ),
      ],
    );
  }
}

class _DateSeparator extends StatelessWidget {
  final String date;
  const _DateSeparator({required this.date});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 16.0),
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
        decoration: BoxDecoration(
          color: const Color(0xFFDDE2E9),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          date,
          style: GoogleFonts.lato(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF3C3C43),
          ),
        ),
      ),
    );
  }
}

class _SentMessageBubble extends StatelessWidget {
  final String text;
  final String time;

  const _SentMessageBubble({required this.text, required this.time});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8.0, left: 50.0),
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: const Color(0xFFDCF7C5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Wrap(
          alignment: WrapAlignment.end,
          crossAxisAlignment: WrapCrossAlignment.end,
          spacing: 8.0,
          children: [
            Text(
              text,
              style: GoogleFonts.lato(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  time,
                  style: GoogleFonts.lato(
                    fontSize: 11,
                    color: Colors.black.withOpacity(0.4),
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(
                  Icons.done_all,
                  size: 16,
                  color: Color(0xFF3498DB),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ReceivedMessageBubble extends StatelessWidget {
  final String text;
  final String time;

  const _ReceivedMessageBubble({required this.text, required this.time});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8.0, right: 50.0),
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: const Color(0xFFFAFAFA),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Wrap(
          alignment: WrapAlignment.end,
          crossAxisAlignment: WrapCrossAlignment.end,
          spacing: 8.0,
          children: [
            Text(
              text,
              style: GoogleFonts.lato(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            Text(
              time,
              style: GoogleFonts.lato(
                fontSize: 11,
                color: Colors.black.withOpacity(0.4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FileMessageBubble extends StatelessWidget {
  final String fileName;
  final String fileSize;
  final String fileType;
  final String time;

  const _FileMessageBubble({
    required this.fileName,
    required this.fileSize,
    required this.fileType,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8.0, left: 50.0),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: const Color(0xFFDCF7C5),
          borderRadius: BorderRadius.circular(12),
        ),
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFF767680).withOpacity(0.12),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                children: [
                  const Icon(Icons.insert_drive_file, color: Colors.grey, size: 30),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      fileName,
                      style: GoogleFonts.lato(
                        fontSize: 16,
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '$fileSize ⋅ $fileType',
                  style: GoogleFonts.lato(
                    fontSize: 11,
                    color: Colors.black.withOpacity(0.4),
                  ),
                ),
                const Spacer(),
                Text(
                  time,
                  style: GoogleFonts.lato(
                    fontSize: 11,
                    color: Colors.black.withOpacity(0.4),
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(
                  Icons.done_all,
                  size: 16,
                  color: Color(0xFF3498DB),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _MessageInputBar extends StatelessWidget {
  const _MessageInputBar();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFFF6F6F6),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.add, color: Color(0xFF007AFF)),
                onPressed: () {},
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0x73FFFFFF),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: const BorderSide(width: 0.5, color: Color(0xFF8E8E93)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: const BorderSide(width: 0.5, color: Color(0xFF8E8E93)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: const BorderSide(width: 0.5, color: Color(0xFF007AFF)),
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.sentiment_satisfied_outlined, color: Color(0xFF007AFF)),
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.camera_alt_outlined, color: Color(0xFF007AFF)),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.mic_none_outlined, color: Color(0xFF007AFF)),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}