import 'package:equatable/equatable.dart';
import 'package:news_app/features/daily_news/domain/entities/article.dart';

abstract class LocalArticleState extends Equatable {
  final List<ArticleEntity>? articles;
  const LocalArticleState({this.articles});

  @override
  List<Object> get props => [
        articles!
      ];
}

final class LocalArticlesLoading extends LocalArticleState {
  const LocalArticlesLoading();
}

final class LocalArticlesDone extends LocalArticleState {
  const LocalArticlesDone(List<ArticleEntity> articles) : super(articles: articles);
}
