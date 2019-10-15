class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  #before_actionメソを追加。このメソッドは末端のset_blogに定義されたアクションを指定したメソッドに定義する。

  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    #Blog.create(title: params[:blog][:title], content: params[:blog][:content])
    #Blog.create(params.require(:blog).permit(:title,:content))#この書き方をstorong parametersという。blogのtitleとcontentをハッシュ値に変換
    #Blog.create(blog_params)#下記のメソッドを指定.同じクラス内だと変数でなくても使用可能。
    #redirect_to new_blog_path
    @blog = Blog.new(blog_params)

    if params[:back]
        render :new
      else

      if @blog.save #ブログの保存が成功した場合に
        #一覧画面（indexのprefixがblogs）へ遷移して下記のメッセージを表示。
        redirect_to blogs_path, notice:"ブログを作成しました！" #noticeはHTMLに記述しないと表示されない。
      else
        #falseだとnewページに遷移。
        render :new #renderは指定したviewをレンダリングをする。

        #通常だと指定したURLに移動すると
        #その関連したアクションやhtmlが呼び出されるがcreateはブログ作成の機能としての意図があるので
        #HTMLがないゆえにエラーが起るのでrenderでnew（新規作成画面）に返す。
      end
    end
  end

  def show
    #共通処理化
  end

  def edit
    #共通処理化
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice:"ブログを削除しました!"
  end

  def update  #before_actionを通してset_bolgメソで@blog = Blog.find(params[:id])を定義。これで共通処理ができる。重複部分は削除。
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "ブログを編集しました！"
    else
      render :edit
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:title,:content)
  end
#共通処理のメソッド化set_blog,before_action
  def set_blog   #idをキーとして取得するメソッドを追加。下記と同じ記述は削除した。最上部のbeforeメソを確認
    @blog = Blog.find(params[:id])
  end
end
#show,edit,updateの重複部分を削除
#before_actionとset_blogを追記
