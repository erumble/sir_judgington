module EntriesHelper
  def self.configure_for_exhibition!(entry)
    entry.judging_time = nil if entry.skill_level == 'exhibition'
  end

  def self.build_entry_from_params(entry_params)
    entry = Entry.new entry_params

    entry.cosplays.each do |cosplay|
      # character = cosplay.character
      # cosplay.character = Character.where(name: character.name, property: character.property).first_or_create
      person = cosplay.person
      cosplay.person = Person.where(email: person.email, first_name: person.first_name, last_name: person.last_name, phonetic_spelling: person.phonetic_spelling).first_or_create
    end

    entry
  end

  def self.update_entry_from_params(entry_params)
    
  end
end
