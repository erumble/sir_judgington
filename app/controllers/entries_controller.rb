class EntriesController < ApplicationController

  def index
    @entries = Entry.all
  end

  def new
    @entry = Entry.new

    3.times do
      cosplay = Cosplay.new
      owner = Person.new
      character = Character.new
      cosplay.owner = owner
      cosplay.character = character
      @entry.cosplays << cosplay
    end
  end

  def create
    begin
      @entry = Entry.create! entry_params

      person = Person.where(person_params).first_or_create

      character = Character.where(character_params).first_or_create

      Cosplay.create!(owner: person, entry: @entry, character: character)

      redirect_to entries_path
    rescue => e
      flash[:error] = "There was an error saving the entry."
      redirect_to :back
    end
  end


  private

  def person_params
    params.require(:person).permit(:first_name, :last_name, :phonetic_spelling, :email)
  end

  def character_params
    params.require(:character).permit(:name, :property)
  end

  def entry_params
    # contest id should not be permitted, it should be set by the system
    params.require(:entry).permit(:judging_time_id, :contest_id, :skill_level, :hot_or_bulky?, :group_name, :handler_count)
  end

end
