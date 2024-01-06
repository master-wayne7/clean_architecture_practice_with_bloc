import 'package:news_app/core/usecases/usecase.dart';
import 'package:news_app/features/daily_news/domain/entities/article.dart';
import 'package:news_app/features/daily_news/domain/repository/article_repository.dart';

class GetSavedArticleUseCase implements UseCase<List<ArticleEntity>, void> {
  final ArticleRepostory _articleRepostory;

  GetSavedArticleUseCase(this._articleRepostory);
  @override
  Future<List<ArticleEntity>> call({void params}) {
    return _articleRepostory.getSavedArticles();
  }
}
