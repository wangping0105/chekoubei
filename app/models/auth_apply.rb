class AuthApply < ActiveRecord::Base
  belongs_to :user

  enum status: {nutreated: 0, treated: 1}

  serialize :extra
end
