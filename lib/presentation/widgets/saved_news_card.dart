import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class SavedNewsCard extends StatelessWidget {
  final String urlToImage;
  final String title;
  final DateTime publishedAt;
  final bool isSaved;
  final VoidCallback onTap;
  final VoidCallback onPressed;

  const SavedNewsCard({
    super.key,
    required this.urlToImage,
    required this.title,
    required this.publishedAt,
    required this.isSaved,
    required this.onTap,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 12,
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Thumbnail
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    urlToImage,
                    width: 78,
                    height: 78,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Center(
                        child: Container(
                          height: 70,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade200),
                            borderRadius: BorderRadius.circular(6)
                          ),
                          child: Icon(
                            Icons.image_not_supported_outlined,
                            size: 30,
                          ),
                        ),
                      );
                    },
                  ),
                ),
      
                const SizedBox(width: 10),
      
                // Content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'TECHNOLOGY',
                        style: TextStyle(
                          color: Colors.blue.shade800,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 2,
                        ),
                      ),
      
                      const SizedBox(height: 10),
      
                      Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 21,
                          height: 1.2,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Georgia',
                        ),
                      ),
      
                      const SizedBox(height: 5),
      
                      Row(
                        children: [
                          Text(
                            "${timeago.format(publishedAt, locale: 'en_short')} ago",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                          ),
      
                          const Spacer(),
      
                          IconButton(
                            onPressed: onPressed,
                            icon: Icon(
                              isSaved 
                              ? Icons.bookmark
                              : Icons.bookmark_outline,
                              color: Colors.grey.shade600,
                              size: 21,
                            )
                            
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
      
            const SizedBox(height: 5),
      
            Divider(
              thickness: 1,
              color: Colors.grey.shade300,
            ),
          ],
        ),
      ),
    );
  }
}