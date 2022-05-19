class Task < ApplicationRecord
  scope :created_at, -> {order(created_at: :desc)}
  scope :deadline, -> {order(deadline: :asc)}
  validates :title, presence: true
  validates :content, presence: true

  enum status: { 未着手: 0, 着手中: 1, 完了: 2 }
  enum priority: { 高: 0, 中: 1, 低: 2 }

  scope :search_title, -> (search_title){
    where("title LIKE ?", "%#{search_title}%")}
  scope :search_status, ->(search_status){
    where(status: search_status)}
  belongs_to :user
end
