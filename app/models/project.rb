class Project < ApplicationRecord
  validates :title, :short_description, :long_description, :company, :role, :year, :stacks, :live_url, presence: true
  has_attached_file :image, styles: { medium: '300x300#', thumb: '100x100#' }
  validates_attachment_content_type :image, content_type: ['image/jpg', 'image/jpeg', 'image/png']

  scope :last_projects, -> { order(year: :desc).limit(4) }

  def self.latest_projects
    pluck_to_hash(Project.last_projects.pluck(:title, :description, :company, :role, :year, :stacks, :image_url))
  end

  def self.pluck_to_hash(pluck)
    pluck.map do |s|
      { title: s[0],
        description: s[1],
        company: s[2],
        role: s[3],
        year: s[4],
        stacks: s[5],
        image_url: s[6] }
    end
  end
end
