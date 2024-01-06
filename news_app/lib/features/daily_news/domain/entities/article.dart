// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class ArticleEntity extends Equatable {
  final int? id;
  final String? title;
  final String? description;
  final String? author;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;
  const ArticleEntity({
    this.id,
    this.title,
    this.description,
    this.author,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  @override
  // TODO: implement props
  List<Object?> get props {
    return [
      id,
      title,
      description,
      author,
      url,
      urlToImage,
      content,
      publishedAt,
    ];
  }
}
