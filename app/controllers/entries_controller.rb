class EntriesController < ApplicationController

  def index
    @entries = Entry.all
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.create! entry_params

    person = Person.where(person_params).first_or_create

    character = Character.where(character_params).first_or_create

    Cosplay.create!(owner: person, entry: @entry, character: character)

    redirect_to entries_path
  end

  private

  def person_params
    params.require(:person).permit(:first_name, :last_name, :phonetic_spelling, :email)
  end

  def character_params
    params.require(:character).permit(:name, :property)
  end

  def entry_params
    params[:entry][:skill_level].downcase! if params[:entry][:skill_level]
    # contest id should not be permitted, it should be set by the system
    params.require(:entry).permit(:judging_time_id, :contest_id, :skill_level, :hot_or_bulky?, :group_name, :handler_count)
  end
end
