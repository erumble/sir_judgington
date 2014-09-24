class EntriesController < ApplicationController

  def index
    @entries = Entry.all
  end

  def new
    @entry = Entry.new
    @entry.contest = Contest.current
    cp = @entry.cosplays.build
    cp.build_owner
    cp.build_character
  end

  def create
    @entry = Entry.new(entry_update_params)
    if @entry.save
      flash.discard(:error)
      flash[:success] = "Entry save was successful."
      respond_to do |format|
        format.html { redirect_to new_entry_path and return }
      end
    end
    flash[:error] = "There was an error saving the entry."
    render :new
  end

  def edit
    @entry = Entry.find(params[:id])
  end

  def update
    @entry = Entry.find(params[:id])
    if @entry.update(entry_update_params)
      flash.discard(:error)
      flash[:success] = "Entry update was successful."
      redirect_to edit_entry_path(@entry) and return
    end
    flash[:error] = "There was an error saving the entry."
    render :edit
  end

  private

  def entry_update_params
    params.require(:entry).permit(
    :judging_time_id,
    :contest_id,
    :skill_level,
    :hot_or_bulky,
    :group_name,
    :handler_count,
    :category_ids => [],
    :cosplays_attributes => [:id, :_destroy, owner_attributes: [:id, :first_name, :last_name, :phonetic_spelling, :email, :_destroy], character_attributes: [:id, :name, :property, :_destroy]]
    )
  end
end
