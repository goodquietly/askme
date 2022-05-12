class QuestionsController < ApplicationController
  before_action :set_question, only: %i[show edit update destroy hide]

  def create
    @question = Question.create(question_params)

    if @question.save

      redirect_to question_path(@question), notice: 'Новый вопрос создан!'
    else
      flash.now[:alert] = 'Вы неправильно заполнили поля формы вопроса'

      render :new
    end
  end

  def update
    if @question.update(question_params)

      redirect_to question_path(@question), notice: 'Обновили вопрос!'
    else
      flash.now[:alert] = 'При попытке сохранить вопрос возникли ошибки'
      render :edit
    end
  end

  def destroy
    @question.destroy

    redirect_to questions_path, notice: 'Вопрос удален!'
  end

  def shows; end

  def index
    @question = Question.new
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def edit; end

  def hide
    @question.update(hidden: true)

    redirect_to question_path, notice: 'Скрыли вопрос!'
  end

  private

  def question_params
    params.require(:question).permit(:body, :user_id)
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
