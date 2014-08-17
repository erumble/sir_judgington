class EntriesController < ApplicationController

  def index
    @entries = Entry.all
  end

  def new
    @entry = Entry.new
    @entry.contest = Contest.last
    cp = @entry.cosplays.build
    cp.build_owner
    cp.build_character
  end

  def create
    begin
      @entry = Entry.create! entry_params
      cosplay_params[:cosplays_attributes].each do |k, cosplay|
        owner =  Person.where(cosplay[:owner_attributes]).first_or_create
        character = Character.where(cosplay[:character_attributes]).first_or_create
        Cosplay.create!(owner: owner, entry: @entry, character: character)
      end
      redirect_to entries_path
    rescue => e
      flash[:error] = "There was an error saving the entry. #{e.message}"
      session[:entry_create_data] = @entry
      redirect_to :back
    end
  end

  private

  def cosplay_params
    params.require(:entry).permit(:cosplays_attributes => [owner_attributes: [:first_name, :last_name, :phonetic_spelling, :email], character_attributes: [:name, :property]])
  end

  def entry_params
    # contest id should not be permitted, it should be set by the system
    params.require(:entry).permit(
      :judging_time_id,
      :contest_id,
      :skill_level,
      :hot_or_bulky?,
      :group_name,
      :handler_count,
      :category_ids => []
    )
  end

end
