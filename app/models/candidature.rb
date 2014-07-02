class Candidature < ActiveRecord::Base
  include ActiveModel::Validations
  validates :time_period_preference, presence: true
  validates :course1_id, presence: true
  validates :transcript_file_path, :presence => {:message => "Apenas PDF."}
  belongs_to :student
end
