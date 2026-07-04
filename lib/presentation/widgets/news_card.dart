import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsCard extends StatelessWidget {
  final String urlToImage;
  final String title;
  final String description;
  final DateTime publishedAt;
  final bool isSaved;
  final VoidCallback onArticleTap;
  final VoidCallback onBookmarkPressed;
  const NewsCard({
    super.key,
    required this.urlToImage,
    required this.title,
    required this.description,
    required this.publishedAt,
    required this.isSaved,
    required this.onArticleTap,
    required this.onBookmarkPressed
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onArticleTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                urlToImage,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Center(
                    child: Container(
                      height: 180,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade200),
                        borderRadius: BorderRadius.circular(8)
                      ),
                      child: Icon(
                        Icons.image_not_supported_outlined,
                        size: 40,
                      ),
                    ),
                  );
                },
              ),
            ),
      
            const SizedBox(height: 24),
      
            // Category
            Text(
              'TECHNOLOGY',
              style: TextStyle(
                color: Colors.blue.shade700,
                fontSize: 12,
                fontWeight: FontWeight.w600,
                letterSpacing: 2,
              ),
            ),
      
            const SizedBox(height: 20),
      
            // Title
            Text(
              title,
              style: TextStyle(
                fontSize: 22,
                height: 1.25,
                fontWeight: FontWeight.w700,
                fontFamily: "PlayfairDisplay",
                color: Color(0xFF222222),
              ),
            ),
      
            const SizedBox(height: 20),
      
            // Description
            Text(
              description,
              style: TextStyle(
                fontSize: 14,
                fontFamily: "Roboto_Condensed-Regular",
                height: 1.5,
                color: Color(0xFF5F6470),
              ),
            ),
      
            const SizedBox(height: 28),
      
            // Bottom row
            Row(
              children: [
                Text(
                  "${timeago.format(publishedAt, locale: 'en_short')} ago",
                  style: TextStyle(
                    fontSize: 10,
                    color: Color(0xFF7A7F8C),
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const Spacer(),
                
                IconButton(
                  onPressed: onBookmarkPressed,
                  icon: Icon(
                    isSaved 
                    ? Icons.bookmark
                    : Icons.bookmark_border_outlined,
                    color: Colors.grey.shade600,
                    size: 25,
                  ),
                ),
              ],
            ),
      
            const SizedBox(height: 28),
      
            Divider(
              color: Colors.grey.shade300,
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}