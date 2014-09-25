module EntriesHelper
  def self.configure_for_exhibition!(entry)
    entry.judging_time = nil if entry.skill_level == 'exhibition'
  end
end
