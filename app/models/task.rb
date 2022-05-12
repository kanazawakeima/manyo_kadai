class Task < ApplicationRecord
  scope :created_at, -> {order(created_at: :desc)}
  scope :deadline, -> {order(deadline: :asc)}
  validates :title, presence: true
  validates :content, presence: true

  enum status: { 未着手: 0, 着手中: 1, 完了: 2 }
  enum priority: { 高: 0, 中: 1, 低: 2 }
end
