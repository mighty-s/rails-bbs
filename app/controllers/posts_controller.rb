class PostsController < ApplicationController
    include SessionsHelper
    
    # 조회
    def index
        @posts = Post.all
    end
    
    def show
        @post = Post.find(params[:id])
        @comments = Comment.where(post_id: @post.id)
    end
    
    # 생성
    def new
        if !user_signed_in?
            redirect_to '/', notice: "로그인을 해야 글을 작성할 수 있습니다"
        end
    end
    
    def create
        # form_for로 오면 한번 감싸져있음
        @post = Post.create(
        title: params[:post][:title],
        contents: params[:post][:contents],
        user_id: current_user.id
        )
        redirect_to '/', notice: "글이 성공적으로 작성되었습니다"
    end
    
    # 수정
    def edit
        @post = Post.find(params[:id])
    end
    
    def update
        post = Post.find(params[:id])
        post.title = params[:post][:title]
        post.contents = params[:post][:contents]
        post.save
        
        redirect_to post_path(params[:id]), notice: '수정 완료'
    end
    
    # 삭제
    def destroy
        Post.destroy(params[:id])
        redirect_to '/', notice: '게시글이 성공적으로 삭제되었습니다'
    end
        
end
