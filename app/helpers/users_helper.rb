module UsersHelper
    def user_created_posts?(user)
        user.posts.any?
    end
    def user_created_comments?(user)
        user.comments.any?
    end
    def user_favorited_posts?(user)
        user.favorites.any?
    end
end
