namespace :huanxin do
  desc 'add huanxin'
  task create_user: :environment do
    User.find_in_batches(batch_size: 500) do |user|
      user.each do |u|
        unless ImUser.where(user: u).exists?
          HuanXin::HuanXinInst.create_im_user(u)
          puts "add #{u.id} to 环信"
        end
      end
    end
  end
end