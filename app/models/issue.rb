class Issue < ApplicationRecord
  belongs_to :mailing_list
  has_many :subtitles
end
