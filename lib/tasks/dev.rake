namespace :dev do
  desc "TODO"
  task sample_data: :environment do
    100.times do |i|
      username = "#{Faker::Creature::Animal.name.split(" ").join("-")}-#{i}"
      user = User.create(
        username: username,
        email: "#{username}@example.com",
      ) do |u|
        u.password = "password"
      end

      user.posts.create(
        content: Faker::TvShows::MichaelScott.quote,
      )
    end

    100.times do |i|
      user = User.all.sample
      post = Post.all.sample

      post.comments.create(
        user: user,
        content: Faker::TvShows::DumbAndDumber.quote,
      )
    end
  end
end
