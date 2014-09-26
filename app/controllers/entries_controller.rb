class EntriesController < ApplicationController

  def index
    @entries = Entry.crazy_filter
  end

  def show
    @entry = Entry.find(params[:id])
  end

  def new
    @entry = Entry.new
    @entry.contest = Contest.current
    cp = @entry.cosplays.build
    cp.build_person
    cp.build_character
  end

  def create
    @entry = EntriesHelper.build_entry_from_params entry_params
    # @entry = Entry.new entry_params

    if @entry.save
      redirect_to @entry
    else
      render :new
    end
  end

  def edit
    @entry = Entry.find(params[:id])
  end

  def update
    @entry = Entry.find(params[:id])
    if @entry.update entry_params
      redirect_to @entry
    else
      render :edit
    end
  end

  def person_json_blob
    render :json => Person.all, root: false
  end

  private

  def entry_params
    # contest id should not be permitted, it should be set by the system
    params.require(:entry).permit(
      :judging_time_id,
      :contest_id,
      :skill_level,
      :hot_or_bulky,
      :group_name,
      :handler_count,
      :category_ids => [],
      :cosplays_attributes => [
        :id,
        :_destroy,
        person_attributes: [:id, :first_name, :last_name, :phonetic_spelling, :email, :_destroy],
        character_attributes: [:id, :name, :property, :_destroy]
      ]
    )
  end

end
