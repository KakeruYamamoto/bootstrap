スマホ = xs
タブレット = sm
パソコン = md
大パソコン = lg



         767  991  1199  1200~
prefix   xs   sm    md    lg

bootstrapの基本---------------------------

container(固定枠)、 -fluid(流動枠)

row  (行)   rowクラスがつけられた親要素の中で12分割される、それをcolでどのカラム分なのかを考える

col-'prefix'-'数字' (カラム)  数字は12まで

-------------------------------------




/public/assets
.byebug_history

# Ignore master key for decrypting credentials and more.
/config/master.key

上の/public/assetsを削除




パッケージマネージャーとは
ソフトウェアの管理を行うもの


gemもbundlerもライブらいでrailsもそう。

Yarnはbundlerのように管理ツール

bootstrapとはcssフレームワークの事

rails newから　jqueryインストまで


マニフェストファイルとはjsだと
app/assets/javascript/application.js



  515  rails _5.2.3_ new bootstrap -d postgresql
  516  cd bootstrap/
  517  rails db:create
  518  rails g controller blogs index
  519  rails g model blog
  520  rails g model blog
  521  rails d model blog
  522  rails g model blog
  523   sudo service postgresql start
  524  rails db:migrate
  525  rails -v
  526  brew install yarn --ignore-dependencies
  527  brew install yarn --ignore-dependencies
  528  brew install yarn
  529  sudo port install yarn
  530  curl -o- -L https://yarnpkg.com/install.sh | bash
  531  curl -o- -L https://yarnpkg.com/install.sh | bash -s -- --version [version]
  532  curl -o- -L https://yarnpkg.com/install.sh | bash -s -- --version v1.19.1
  533  curl -o- -L https://yarnpkg.com/install.sh | bash -s -- --version [version]
  534  brew upgrade yarn
  535  pwd
  536  yarn add jquery
  537  yarn add bootstrap@3   #bootstrap3系をインストール。bootstrap自体はすでにインストール済み
  538  history


  コマンドエラー
  コメントアウトにはきよつける。





  1  $ rails _5.2.3_ new bootstrap -d postgresql
  2  $ cd bootstrap/
  3  $ rails db:create
  4  $ rails g controller blogs index
  5  resources :blogs
  6  $ rails g model blog
  7 db/migrate/20191000000_create_blogs => データ型：カラム名を記述
  8  $ sudo service postgresql start
  9 $ rails db:migrate

  10 ブログ作成（アクションなど）

  11  .gitgnore => public/assets   この一文を削除する  #このカリキュラム終了後に自動で記述される。
  12  $ rails -v #バージョン確認
  13  $ brew install yarn --ignore-dependencies #Yarnのインストール  nvmはすでにインスト済みなので--ignoreをつける
  14  $ yarn add jquery #jqueryインスト  $yarn add パッケージ名でそのパケのインストと記憶を同時に行う


  15  jsマニフェストファイルの設定   jQueryの導入
  app/assets/javascript/application.js
ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
#これら記述でjqueryが使用可能になる。
  //= require rails-ujs
  //= require turbolinks
  //= require jquery/dist/jquery.js
  //= require bootstrap/dist/js/bootstrap.min #←は17のタイミングでかく
  //= require_tree .  #このrequireでapp/assets/javascript配下にある全jsファイルをrequireする


＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝

    ＝bootstrapの導入＝
  16 $ yarn add bootstrap@3   #bootstrap3系をインストール。bootstrap自体はすでにインストール済み


＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝


  17  cssマニフェストファイルに追記  bootstrapの導入
  app/assets/stylesheets/application.css
#コメントアウトにはきよつける
ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
  *= require bootstrap/dist/css/bootstrap.min  #追記
  *= require_tree .
  *= require_self
  */

  ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー

  18  app/views/blogs/index.html.erbに貼り付け

  #変えてます２個目

  <header class="header">Bootstrap</header>
  <nav class="menu">
      <ul>
          <li>top</li>
          <li>menu1</li>
          <li>menu2</li>
      </ul>
  </nav>
  <article>
      <div class="contents">
          <ul>
              <li>contents1</li>
              <li>contents2</li>
          </ul>
      </div>
      <div class="topic">
           <ul>
              <li>bootstrapを使ってレスポンシブデザインを実現しよう！</li>
              <li>やればできる！bootstrapを使ってみよう！</li>
              <li>怖くない！レスポンシブデザインができるようになればWebアプリケーションもワンランク上に！</li>
          </ul>
      </div>
  </article>



＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝

18  HTMLで各デバイスの画面サイズに合わせる

app/views/layouts/application.html.erb

---------------------------------------------
<!DOCTYPE html>
省略
<%= csrf_meta_tags %>
<%= csp_meta_tag %>
<meta name="viewport" content="width=device-width">
 #<!-- head内にこのmetaを追記すると他の各デバイスにサイズを合わせて表示される -->

 ===========================================================

 19  css記述　　app/assets/stylesheets/blogs.scss


 li{
    list-style:none;
}
ul{
    padding:0;
}

.header{
    font-size:20px;
    font-weight:bold;
    text-align:center;
}

.menu{
    background-color:#012F4B;
    color:#fff;
}
.menu li {
    padding:5% 10%;
    text-align:center;
}
.contents li{
    background-color:#F3A7AB;
    color:#fff;
    padding:10% 10%;
    box-sizing: border-box;
    border: solid 1px #fff;
}
.topic li{
    margin:1%;
    border-bottom: dotted 1px #333333;
}
.container{
    margin-top:20px;
    padding-bottom: 100px;
}



＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝

20 app/views/layouts/application.html.erb  に記述

<!DOCTYPE html>
<html>
<head>
  <title>例コード</title>
  <%= stylesheet_link_tag    'application', media: 'all', 'data-turbolinks-track' => true %>
  <%= javascript_include_tag 'application', 'data-turbolinks-track' => true %>
  <%= csrf_meta_tags %>
</head>
<body>

  <header>
    <ul>
      <li><a href="#">Bootstrapテキストページ</a></li>
      <li><a href="#">トップページ</a></li>
    </ul>
  </header>

<%= yield %>

  <footer>
    <p>運営会社DIVE INTO CODE株式会社</p>
    <p>© 2015-2016 Copyright DIVE INTO CODE Corp.</p>
  </footer>

</body>
</html>


===========================================================

21 app/assets/stylesheets/top.scss  貼り付け



header {
  width: 100%;
  background-color: #2c3e50;
  height: 54px;
}

header ul {
  margin: 0 auto;
  list-style: none;
}

header ul a {
  display: block;
  padding: 15px;
  text-decoration: none;
  color: white;
}

header li {
  float: left;
  width: auto;
}

header ul:after {
  content: "";
  display: block;
  clear: both;
}

footer {
  width: 100%;
  background-color:#2c3e50;
  padding: 20px 0 10px 0;
  color: white;
  margin: auto;
  padding-bottom: 10px;
  font-size: 12px;
  position: absolute;
  bottom: 0;
}

html {
  position: relative;
  min-height: 100%;
}

body {
  text-align: center;
}


====================================
