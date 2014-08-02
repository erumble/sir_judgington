class EntriesController < ApplicationController

  def index
    @entries = Entry.all
  end

  def new
    @entry = Entry.new
    @person = Person.new
    # @character = Character.new
    # @cosplay = Cosplay.new(entry: @entry, owner: @person, character: @character)
  end

  def create
    @person = Person.where(params[:person].to_h).first_or_create

    @character = Character.where(params[:character].to_h).first_or_create

    @entry = Entry.create! params[:entry].to_h

    @cosplay = Cosplay.create!(owner: @person, entry: @entry, character: @character)

    redirect_to entries_path
  end
end
