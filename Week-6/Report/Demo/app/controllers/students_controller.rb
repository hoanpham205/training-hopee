class StudentsController < ApplicationController


  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end
  
  def edit
   
  end

  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to student_path(@student), notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end
  

  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html {redirect_to student_path(@student), notice: 'Student was successfully created'}
        format.json {render :show, status: :created, location: @student}
      else
        format.html { render :new, status: :unprocessable_entity}
        format.json { render json: @student.errors, status: :unprocessable_entity}
      end
    end
  end

  def show; end 

  def detroy 
    @student.destroy
    respond_to do |format|
      format.html {redirect_to student_path, notice: 'Student was successfully deleted'}
      format.json {head :no_content}
    end
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:name, :email, :gender, :date, :address, :phone)
  end
end
