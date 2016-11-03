class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end
  
  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end
  
  def create
    @question = Question.new(params.require(:question).permit(:title, :body, :resolved))
#recieved from video however had this originally long way that was originally done with the post portion

    if @question.save
      flash[:notice] = "Question was saved."
      redirect_to @question
    else
      flash.now[:alert] = "There was an error saving the question. Please try again."
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end
  
  def update
    @question = Question.find(params[:id])
    @question.title = params[:question][:title]
    @question.body = params[:question][:body]
    @question.resolved = params[:question][:resolved]
    #video has the above 3 lines deleted
    #video has below line to be if @question.update_attributes(params.require(:question).permit(:title, :body, :resolved))
    if @question.save
      flash[:notice] = "Question was saved."
      redirect_to @question
    else
      flash.now[:alert] = "There was an error saving the question. Please try again."
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    
    if @question.destroy
      flash[:notice] = "\"#{@question.title}\" was deleted successfully."
      redirect_to questions_path
    else
      flash.now[:alert] = "There was an error deleting the question."
      render :show
    end
  end
end