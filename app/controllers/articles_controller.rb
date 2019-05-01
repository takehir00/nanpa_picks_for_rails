class ArticlesController < ApplicationController
  def top
    # agent = Mechanize.new
    # page = agent.get("http://pkup.tokyo/archives/9492")
    # @title = page.title
    # @src = page.search("img")[0]["src"]
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    #街灯のarticleのidど合致するarticle_idをもつcommentを表示する
    comments = Comment.where(article_id: @article.id)
    #と思ったけど今ってユーザーidしか持ってないからview側でユーザーが表示できない。このメソッド内で@commentsをぶん回してユーザー情報も持ったオブジェクトを生成するとかどうだろ。DTO的な。
    comments.each do |comment|
      comment.user = User.find_by(id: comment.user_id)
    end
    #なんかごちゃついてる。commentモデルクラスでwhereの検索とユーザーの検索やってくれるメソッド定義して、ここではそれを呼び出すだけな感じがよさそう。@comments = Comment.find_by_article_idみたいな。とりあえず動かしてみる
    @comments = comments
  end
end
