#
class App < ActiveRecord::Base
  belongs_to :user
  belongs_to :program
  has_many :feedback
  
  has_attached_file :user_app
  validates_attachment :user_app, presence: true, content_type: { content_type: ['application/pdf',
                                                                                 'application/vnd.ms-excel',     
                                                                                 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
                                                                                 'application/msword', 
                                                                                 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 
                                                                                 'application/msword']}
  after_destroy :delete_dependent_feedback
  
  def delete_dependent_feedback
      @feedbacks = Feedback.where app_id: self.id
      @feedbacks.each do |feedback|
        feedback.destroy
      end
  end
   
end
