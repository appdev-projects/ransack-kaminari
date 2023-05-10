namespace :dev do
  desc "TODO"
  task sample_data: :environment do
    def random_quote
      case rand(5)
      when 0
        Faker::TvShows::MichaelScott.quote
      when 1
        Faker::TvShows::DumbAndDumber.quote
      when 2
        Faker::TvShows::RickAndMorty.quote
      when 3
        Faker::TvShows::SiliconValley.quote
      when 4
        Faker::Movies::Lebowski.quote
      else
        Faker::Movie.quote
      end
    end

    100.times do |i|
      username = "#{Faker::Creature::Animal.name.split(" ").join("-")}-#{i}"
      user = User.create(
        username: username,
        email: "#{username}@example.com",
      ) do |u|
        u.password = "password"
      end

      user.posts.create(
        content: random_quote,
      )

      5.times do |i|
        post = Post.all.sample

        post.comments.create(
          user: user,
          content: Faker::TvShows::DumbAndDumber.quote,
        )
      end
    end
  end
end
