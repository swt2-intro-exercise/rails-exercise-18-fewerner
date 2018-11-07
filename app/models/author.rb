class Author < ApplicationRecord
    validates :last_name, presence: true
    def name
        return self.first_name  + " "+ self.last_name
    end
end
