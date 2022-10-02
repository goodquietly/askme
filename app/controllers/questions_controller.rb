class QuestionsController < ApplicationController
  before_action :ensure_current_user, only: %i[update destroy edit hide]
  before_action :set_question_for_current_user, only: %i[edit update destroy hide]

  def create
    question_params = params.require(:question).permit(:body, :user_id)

    @question = Question.new(question_params)

    @question.author = current_user

    if @question.save && check_captcha(@question)

      redirect_to user_path(@question.user), notice: 'Новый вопрос создан!'
    else
      flash.now[:alert] = 'Вы неправильно заполнили поля формы вопроса'

      render :new
    end
  end

  def update
    question_params = params.require(:question).permit(:body, :answer)

    if @question.update(question_params)

      redirect_to user_path(@question.user), notice: 'Обновили вопрос!'
    else
      flash.now[:alert] = 'При попытке сохранить вопрос возникли ошибки'

      render :edit
    end
  end

  def destroy
    @user = @question.user
    @question.destroy

    redirect_to user_path(@user), notice: 'Вопрос удалён!'
  end

  def show
    @question = Question.find(params[:id])
  end

  def index
    @questions = Question.order(created_at: :desc).first(15)
    @users = User.order(created_at: :desc).last(10)
    @top_answered_users = Question.most_answered_users_ids.map { |id| User.find(id) }.first(5)
    @hashtags = QuestionHashtag.popular_hashtad_ids.map { |id| Hashtag.find(id) }.first(10)
  end

  def new
    @user = User.find_by!(nickname: params[:user_id])
    @question = Question.new(user: @user)
  end

  def edit; end

  def hide
    @question.update(hidden: true)

    redirect_to question_path, notice: 'Скрыли вопрос!'
  end

  private

  def check_captcha(model)
    current_user.present? || verify_recaptcha(model: model)
  end

  def ensure_current_user
    redirect_with_alert unless current_user.present?
  end

  def set_question_for_current_user
    @question = current_user.questions.find(params[:id])
  end
end
