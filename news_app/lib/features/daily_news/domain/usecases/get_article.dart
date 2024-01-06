import 'package:news_app/core/resource/data_state.dart';
import 'package:news_app/core/usecases/usecase.dart';
import 'package:news_app/features/daily_news/domain/entities/article.dart';
import 'package:news_app/features/daily_news/domain/repository/article_repository.dart';

class GetArticleUseCase implements UseCase<DataState<List<ArticleEntity>>, void> {
  final ArticleRepostory _articleRepostory;

  GetArticleUseCase(this._articleRepostory);
  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepostory.getNewsArticle();
  }
}
