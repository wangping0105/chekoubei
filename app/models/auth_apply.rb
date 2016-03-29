class AuthApply < ActiveRecord::Base
  belongs_to :user

  enum status: {untreated: 0, treated: 1}

  serialize :extra
end
