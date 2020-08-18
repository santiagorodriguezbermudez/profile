class Project < ApplicationRecord
  belongs_to :user
  validates :title, :short_description, :long_description, :company, :role, :year, :stacks, :live_url, presence: true
  has_attached_file :image, styles: { medium: '300x300#', thumb: '100x100#' }
  validates_attachment_content_type :image, content_type: ['image/jpg', 'image/jpeg', 'image/png']

  scope :last_projects, -> { order(created_at: :asc).limit(4) }

  def self.latest_projects
    pluck_to_hash(Project.last_projects.pluck(:title,
                                              :image_url,
                                              :year,
                                              :short_description,
                                              :long_description,
                                              :company,
                                              :role,
                                              :stacks,
                                              :repo_url,
                                              :live_url))
  end

  def self.pluck_to_hash(pluck)
    pluck.map do |s|
      { title: s[0],
        image_url: s[1],
        year: s[2],
        short_description: s[3],
        long_description: s[4],
        company: s[5],
        role: s[6],
        stacks: s[7],
        repo_url: s[8],
        live_url: s[9] }
    end
  end
end
