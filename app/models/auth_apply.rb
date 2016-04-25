class AuthApply < ActiveRecord::Base
  belongs_to :user

  enum status: {untreated: 0, treated: 1, dyne: 2}

  serialize :extra
end
