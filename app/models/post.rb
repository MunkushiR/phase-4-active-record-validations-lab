class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validate :category, inclusion: {in: ['Fiction','Non-Fiction']}
private 
def sufficiently_clickbait_title
    return if title.blank?
    clickbait_phrases = ['Won\'t Believe', 'Secret', 'Top', 'Guess']
    unless clickbait_phrases.any? { |phrase| title.include?(phrase) }
      errors.add(:title, 'should be sufficiently clickbait-y')
    end
  end

end
