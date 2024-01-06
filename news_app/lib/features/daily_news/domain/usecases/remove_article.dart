import 'package:news_app/core/usecases/usecase.dart';
import 'package:news_app/features/daily_news/domain/entities/article.dart';
import 'package:news_app/features/daily_news/domain/repository/article_repository.dart';

class RemoveArticleUseCase implements UseCase<void, ArticleEntity> {
  final ArticleRepostory _articleRepostory;

  RemoveArticleUseCase(this._articleRepostory);
  @override
  Future<void> call({ArticleEntity? params}) {
    return _articleRepostory.removeArticle(params!);
  }
}
