import 'package:news_app/core/resource/data_state.dart';
import 'package:news_app/features/daily_news/domain/entities/article.dart';

abstract class ArticleRepostory {
  // API methods
  Future<DataState<List<ArticleEntity>>> getNewsArticle();

  // Database Methods
  Future<List<ArticleEntity>> getSavedArticles();

  Future<void> saveArticle(ArticleEntity article);

  Future<void> removeArticle(ArticleEntity article);
}
