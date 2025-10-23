import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class WhatsappChatsEdit extends StatelessWidget {
  const WhatsappChatsEdit({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> chatData = [
      {
        'image': 'assets/images/310_1626.png',
        'name': 'Martin Randolph',
        'message': 'Yes, 2pm is awesome',
        'time': '11/19/19',
        'statusIcon': const Icon(Icons.done_all, color: Color(0xFF3497FD), size: 18),
      },
      {
        'image': 'assets/images/310_1614.png',
        'name': 'Andrew Parker',
        'message': 'What kind of strategy is better?',
        'time': '11/16/19',
        'statusIcon': const Icon(Icons.done_all, color: Color(0xFF3497FD), size: 18),
      },
      {
        'image': 'assets/images/310_1602.png',
        'name': 'Karen Castillo',
        'message': '0:14',
        'time': '11/15/19',
        'statusIcon': const Icon(Icons.mic, color: Color(0xFF8E8E93), size: 18),
      },
      {
        'image': 'assets/images/310_1590.png',
        'name': 'Maximillian Jacobson',
        'message': 'Bro, I have a good idea!',
        'time': '10/30/19',
        'statusIcon': const Icon(Icons.done_all, color: Color(0xFF3497FD), size: 18),
      },
      {
        'image': 'assets/images/310_1575.png',
        'name': 'Martha Craig',
        'message': 'Photo',
        'time': '10/28/19',
        'statusIcon': const Icon(Icons.photo_camera, color: Color(0xFF8E8E93), size: 18),
      },
      {
        'image': 'assets/images/310_1567.png',
        'name': 'Tabitha Potter',
        'message': 'Actually I wanted to check with you about your online...',
        'time': '8/25/19',
        'statusIcon': null,
      },
      {
        'image': 'assets/images/310_1553.png',
        'name': 'Maisy Humphrey',
        'message': 'Welcome, to make design',
        'time': '8/20/19',
        'statusIcon': const Icon(Icons.done_all, color: Color(0xFF3497FD), size: 18),
      },
      {
        'image': 'assets/images/310_1541.png',
        'name': 'Kieron Dotson',
        'message': 'Ok, have a good trip!',
        'time': '7/29/19',
        'statusIcon': const Icon(Icons.done_all, color: Color(0xFF3497FD), size: 18),
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            _buildActionBar(),
            Expanded(
              child: ListView.builder(
                itemCount: chatData.length,
                itemBuilder: (context, index) {
                  final chat = chatData[index];
                  return _ChatListItem(
                    image: chat['image'],
                    name: chat['name'],
                    message: chat['message'],
                    time: chat['time'],
                    statusIcon: chat['statusIcon'],
                    isLast: index == chatData.length - 1,
                  );
                },
              ),
            ),
            _buildBottomActions(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
              onPressed: () => context.go('/whatsapp_chat'),
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: const Size(50, 30),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                alignment: Alignment.centerLeft,
              ),
              child: Text(
                'Done',
                style: GoogleFonts.lato(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF007AFF),
                  letterSpacing: -0.4,
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Chats',
            style: GoogleFonts.lato(
              fontSize: 34,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              letterSpacing: -0.23,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300, width: 0.5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Broadcast Lists',
            style: GoogleFonts.lato(
              fontSize: 17,
              color: const Color(0xFFC7C7CC),
              letterSpacing: -0.4,
            ),
          ),
          Text(
            'New Group',
            style: GoogleFonts.lato(
              fontSize: 17,
              color: const Color(0xFFC7C7CC),
              letterSpacing: -0.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomActions(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 16 + MediaQuery.of(context).padding.bottom / 2),
      decoration: const BoxDecoration(
        color: Color(0xFFF6F6F6),
        border: Border(
          top: BorderSide(color: Color(0xFFA6A6AC), width: 0.33),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildActionButton(context, 'Archive'),
          _buildActionButton(context, 'Read All'),
          _buildActionButton(context, 'Delete'),
        ],
      ),
    );
  }
  
  Widget _buildActionButton(BuildContext context, String label) {
    return TextButton(
      onPressed: () {},
      child: Text(
        label,
        style: GoogleFonts.lato(
          fontSize: 17,
          color: const Color(0xFFC7C7CC),
          letterSpacing: -0.4,
        ),
      ),
    );
  }
}

class _ChatListItem extends StatelessWidget {
  final String image;
  final String name;
  final String message;
  final String time;
  final Widget? statusIcon;
  final bool isLast;

  const _ChatListItem({
    required this.image,
    required this.name,
    required this.message,
    required this.time,
    this.statusIcon,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.go('/whatsapp_chat'),
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF3C3C43).withOpacity(0.6),
                      width: 1.5,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                ClipOval(
                  child: Image.asset(
                    image,
                    width: 52,
                    height: 52,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: GoogleFonts.lato(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          if (statusIcon != null) ...[
                            statusIcon!,
                            const SizedBox(width: 4),
                          ],
                          Expanded(
                            child: Text(
                              message,
                              style: GoogleFonts.lato(
                                fontSize: 14,
                                color: const Color(0xFF8E8E93),
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  time,
                  style: GoogleFonts.lato(
                    fontSize: 14,
                    color: const Color(0xFF8E8E93),
                  ),
                ),
              ],
            ),
            if (!isLast)
              Padding(
                padding: const EdgeInsets.only(left: 100, top: 12),
                child: Divider(
                  height: 1,
                  thickness: 0.5,
                  color: Colors.grey.shade300,
                ),
              ),
          ],
        ),
      ),
    );
  }
}