class CommentsController < ApplicationController
  include SessionsHelper
  
  def new
   
  end

  def create
    notice_result = nil
    post_id = params[:post_id]

    if !user_signed_in?
      notice_result = "로그인을 해야 글을 작성할 수 있습니다"
    else
      Comment.create(
        content: params[:comment][:content],
        post_id: post_id,
        user_id: session[:user_id]
      )
      notice_result = "댓글등록 완료"
    end
    redirect_to post_path(post_id), notice: notice_result
  end
  
  def destroy
    post_origin_id = Comment.find(params[:id]).post_id
    notice_result = '댓글은 글쓴이만이 삭제할 수 있습니다'
    if user_signed_in?
      if current_user.id == Comment.find(params[:id]).user_id 
        Comment.delete(params[:id])
        notice_result = '댓글이 성공적으로 삭제되었습니다'
      end
    end
    
    redirect_to post_path(id: post_origin_id), notice: notice_result
  end
  
end
