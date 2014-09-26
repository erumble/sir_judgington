module EntriesHelper
  def self.configure_for_exhibition!(entry)
    entry.judging_time = nil if entry.skill_level == 'exhibition'
  end

  def self.build_entry_from_params(entry_params)
    entry = Entry.new entry_params
    self.update_people entry
    entry
  end

  def self.update_entry_from_params(entry, entry_params)
    begin
      entry.assign_attributes entry_params
    rescue ActiveRecord::RecordNotFound => e
      binding.pry
    end
    self.update_people entry
    entry
  end

  private

  def self.update_people(entry)
    entry.cosplays.each do |cosplay|
      unless cosplay.id
        person = cosplay.person
        cosplay.person = Person.where(email: person.email).first_or_initialize
      end
    end
  end
end
