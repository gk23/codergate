# coding: utf-8
class CoursesController < ApplicationController
  # GET /courses
  # GET /courses.json
  def index
    logger.debug("comming in index method of CoursesController.")
    @courses = Course.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @courses }
    end
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @course = Course.find(params[:id])
    @lessons = Lesson.find(:all,:conditions=>{:course_id=>[@course.id]})
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @course }
    end
  end

  # GET /courses/new
  # GET /courses/new.json
  def new
    @course = Course.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @course }
    end
  end

  # GET /courses/1/edit
  def edit
    @course = Course.find(params[:id])
    @lessons = Lesson.find(:all,:conditions=>{:course_id=>[@course.id]})
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @course }
    end
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(params[:course])

    respond_to do |format|
      if @course.save
        format.html { redirect_to "/courses/#{@course.id}/edit", notice: 'Course was successfully created.' }
        #format.json { render json: @course, status: :created, location: @course }
      else
        format.html { render action: "new" }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_list
    @courses = Course.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @courses }
    end
  end
  # PUT /courses/1
  # PUT /courses/1.json
  def update
    @course = Course.find(params[:id])

    respond_to do |format|
      if @course.update_attributes(params[:course])
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course = Course.find(params[:id])
    @course.destroy

    respond_to do |format|
      format.html { redirect_to "/create" }
      format.json { head :ok }
    end
  end

  def add
    @user_course_ship = UserCourseShip.new do |u|
      u.user_id=params[:user_id]
      u.course_id=params[:course_id]
      u.progress_completed=0
    end
    respond_to do |format|
      if @user_course_ship.save
        format.html{redirect_to "/",notice: '成功添加课程!'}
      else
        format.html{redirect_to "/courses"}
      end
    end

  end
end
