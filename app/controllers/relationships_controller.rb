class RelationshipsController < ApplicationController
  def new
    @relationship = Relationship.new
  end

  def create
    @relationship = Relationship.new
    @relationship.save
      # redirect_to posts_path, success: t('defaults.message.created', item: Relationship.model_name.human)
    # else
    #   # flash.now[:danger] = t('defaults.message.not_created', item: Relationship.model_name.human)
    #   # render :new
    # end
    # to_user = User.find_by(email: params[:relationship][:email])

    # # （１）パートナーのメールアドレスがDBに登録されていることを確認
    # if to_user.nil?
    #   flash[:warning] = "そのメールアドレスのユーザーは登録されていません"
    #   redirect_to new_relationship_path
    # # （２）パートナーがまだ相互フォローしていないことを確認
    # elsif !to_user.no_relationship?
    #   flash[:danger] = "パートナーが既に他の方と家族登録しています"
    #   redirect_to new_relationship_path
    # # （３）入力した招待コードをハッシュ化したものが、DBに保存されているパートナーのinvitation_digestと一致するかを確認
    # elsif BCrypt::Password.new(to_user.invitation_digest).is_password?(params[:relationship][:invitation_code])
    #   # （３－１）入力した params[:relationship]のバリデーションチェック
    #   if @relationship.save
    #     # 共通ユーザーでログインはしないが、バリデーションを通すため、パスワードを設定
    #     common_user_password = SecureRandom.urlsafe_base64(10)
    #     # @relationとcurrent_user/to_user/common_userをつなげる
    #     current_user.create_user_relationship(relationship_id: @relationship.id)
    #     to_user.create_user_relationship(relationship_id: @relationship.id)
    #     common_user.create_user_relationship(relationship_id: @relationship.id)

    #     flash[:success] = "家族を登録しました"
    #     redirect_to user_path(current_user)
    #   # （３－２）入力した params[:relationship][:name]のバリデーションエラー
    #   end
    # # （４）入力した招待コードをハッシュ化したものが、DBに保存されているパートナーのinvitation_digestと一致しない
    # else
    #   flash[:warning] = "招待コードが間違っています"
    #   redirect_to new_relationship_path
    # end
  end
end
