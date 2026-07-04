import 'package:flutter/material.dart';

class NewsArticle extends StatelessWidget {
  final String title;
  final String urlToImage;
  final String content;
  final bool isSaved;
  final VoidCallback onSaveButtonPressed;
  const NewsArticle({
    super.key,
    required this.title,
    required this.urlToImage,
    required this.content,
    required this.isSaved,
    required this.onSaveButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
          child: Row(
            children: [
              Text(
                'TECHNOLOGY',
                style: theme.textTheme.labelSmall?.copyWith(
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.w700,
                  color: Colors.blueGrey,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 4,
                height: 4,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '6 min read',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),

        // Title
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
          child: Text(
            title,
            style: theme.textTheme.headlineMedium?.copyWith(
              fontFamily: 'PlayfairDisplay',
              fontWeight: FontWeight.w700,
              height: 1.1,
              fontSize: 30,
            ),
          ),
        ),

        const SizedBox(height: 20),

        // Author Row
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 15,
                backgroundImage: NetworkImage(
                  'https://i.pravatar.cc/100',
                ),
              ),
              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'By Editorial Staff',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Updated 12h ago',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),

              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.share_outlined),
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        // Article Image
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Image.network(
            urlToImage,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade200)),
                  child: Center(
                    child: Icon(
                      Icons.image_not_supported_outlined,
                      size: 40,
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 28),

        // Paragraph
        Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        content,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontFamily: 'Roboto_Condensed-Regular',
              fontSize: 15,
              height: 1.6,
              color: const Color(0xff333333),
            ),
      ),
    ),

        const SizedBox(height: 40),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Divider(
            color: Colors.grey.shade300,
          ),
        ),

        const SizedBox(height: 24),

        // Share Section
        Center(
          child: Column(
            children: [
              Text(
                'SHARE THIS STORY',
                style: theme.textTheme.labelSmall?.copyWith(
                  letterSpacing: 2,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _socialButton(Icons.close),
                  _socialButton(Icons.facebook),
                  _socialButton(Icons.work),
                ],
              ),

              const SizedBox(height: 24),

              SizedBox(
                width: 220,
                height: 42,
                child: ElevatedButton.icon(
                  onPressed: onSaveButtonPressed,
                  icon: Icon(isSaved ? Icons.bookmark : Icons.bookmark_outline),
                  label: Text(isSaved ? 'REMOVE FROM READING LIST' : 'SAVE TO READING LIST'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff0A2A66),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ],
    );
  }

  static Widget _socialButton(IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: CircleAvatar(
        radius: 18,
        backgroundColor: const Color(0xfff1f2f4),
        child: Icon(
          icon,
          size: 18,
          color: Colors.black87,
        ),
      ),
    );
  }
}


