class BookmarksController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    current_user.bookmark_posts << post
    redirect_to posts_path, success: 'マイリストに追加しました'
  end

  def destroy
    post = current_user.bookmarks.find(params[:id]).post
    current_user.bookmark_posts.destroy(post)

    # リクエストが/posts/bookmarksから来たかどうかをチェック
    if request.referer.include?("/posts/bookmarks")
      redirect_to bookmarks_posts_path, success: 'マイリストから削除しました'
    else
      redirect_to posts_path, success: 'マイリストから削除しました'
    end
  end
end
