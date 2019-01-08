# コントローラーを手直しした時は必ずrailsサーバーを再起動したから
# 動作を検証すること！！！

class PostsController < ApplicationController
  def new
    # Postモデルの空白レコードを生成
  	@post = Post.new
  end

  # viewでf.submitが実行された時呼び出されるcreateメソッドを設定
  def create
  	#下記のストロングパラメータでviewから受け取った値を
  	# ローカル変数「post」に格納する
  	# （）内はストロングパラメータアクションが設定されたメソッド名
  	post = Post.new(post_params)

  	# 値をDBに保存する(.save)
  	post.save

  	# 保存後新規投稿ページにリダイレクトする
  	redirect_to post_path(post.id)
  end

  def index
    # Postモデルの全レコードを取得
    @posts = Post.all
  end

  def show
    # Postモデル内のレコードをルーティングで指定されたidで検索し取得する
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path(post.id)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end

  private

  def post_params
  	# ストロングパラメータ
  	# viewからの値はPostモデルの「title」「body」属性の
  	# 値しか受け取らないと定義
  	params.require(:post).permit(:title, :body, :image)
  end
end
