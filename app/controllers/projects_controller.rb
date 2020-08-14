class ProjectsController < ApplicationController
  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.user_id = current_user.id
    @project.stacks.map!(&:strip)

    respond_to do |format|
      if @project.save
        @project.update(image_url: @project.image.url)
        format.html { redirect_to root_path, notice: "The project #{@project.title} was created." }
      else
        format.html { render :new }
      end
    end
  end

  private

  def project_params
    params.require(:project).permit(:title,
                                    :image,
                                    :year,
                                    :short_description,
                                    :long_description,
                                    :company,
                                    :role,
                                    :stacks,
                                    :repo_url,
                                    :live_url)
  end
end
