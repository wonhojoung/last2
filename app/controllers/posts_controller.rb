require 'open-uri'
class PostsController < ApplicationController
   #create 파트
    def new
    # 사용자가 데이터를 입력할 화면
    end
    
    def create
    # 입력받은 데이터를 실제 db에 저장할 액션
    @post = Post.new
    #Post = 모델이름
    @post.mastername = params[:input_mastername]
    @post.masternumber = params[:input_masternumber]
    @post.storename = params[:input_storename]
    @post.storenumber = params[:input_storenumber]
    @post.storeloc = params[:input_storeloc]
    @post.detailloc = params[:input_detailloc]
    @post.opentime = params[:input_opentime]
    @post.closetime = params[:input_closetime]
    @post.acceptpeople1 = params[:input_acceptpeople1]
    @post.acceptpeople2 = params[:input_acceptpeople2]
    @post.storeintro = params[:input_storeintro]
    # 앞에는 마이그레이트 db랑 똑같게 뒤에는 폼네임
    @post.save
    redirect_to "/posts/show/#{@post.id}"
    end    
    
    #read 파트
    
    def index
    @posts = Post.all
    @posts = Post.page params[:page]
    url = "http://info.finance.naver.com/marketindex/?tabSel=exchange#tab_section"
    doc = Nokogiri::HTML(open(url), nil, 'euc-kr')
    currency = doc.css('span.value')
    @new_currency = currency.map {|cur| cur.text}
    
    currency_name = doc.css('h3.h_lst')
    @new_currency_name = currency_name.map {|cur_n| cur_n.text}
    end
    
    #한개의포스트를 보여줌
    def show
    #                        주소창에서 넘어오는 숫자
    @post = Post.find(params[:post_id])
    @comments = Comment.where(post_id: params[:post_id])
    #                        DB컬럼이름          주소창에서 넘어오는 숫자
    end
    
    
    #D 삭제
    
    def destroy
        @post = Post.find(params[:post_id])
        @post.destroy
        redirect_to '/'
    end
    
    #u 업데이트
    def edit
        @post = Post.find(params[:post_id])
    end
    #사용자가 데이터를 입력할 화면
    
    
    def update
        @post = Post.find(params[:post_id])
        @post.mastername = params[:input_mastername]
        @post.masternumber = params[:input_masternumber]
        @post.storename = params[:input_storename]
        @post.storenumber = params[:input_storenumber]
        @post.storeloc = params[:input_storeloc]
        @post.detailloc = params[:input_detailloc]
        @post.opentime = params[:input_opentime]
        @post.closetime = params[:input_closetime]
        @post.acceptpeople1 = params[:input_acceptpeople1]
        @post.acceptpeople2 = params[:input_acceptpeople2]
        @post.storeintro = params[:input_storeintro]
        # 앞에는 마이그레이트 db랑 똑같게 뒤에는 폼네임
        @post.save
        redirect_to "/posts/show/#{@post.id}"
    end
    #입력받은 데이터를 db에 ㄱ
    
    
    
end
