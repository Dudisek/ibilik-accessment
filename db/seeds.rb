# SEED USERS
10.times do
User.create(name: Faker::Internet.user_name, email: Faker::Internet.email, password: "123456", password_confirmation: "123456")
end

# SEED PROPERTY
10.times do
Property.create(title: Faker::Book.title, body: Faker::Lorem.paragraph, created_at: Faker::Time.between(DateTime.now - 1000, DateTime.now), user_id: Faker::Number.between(1, 10),)
end

# # SEED ANSWER
# 300.times do
# Answer.create(comment: Faker::Lorem.paragraph, user_id: Faker::Number.between(1, 200), created_at: Faker::Time.between(DateTime.now - 1000, DateTime.now), question_id: Faker::Number.between(1, 100))
# end

# # SEED QVOTES
# 300.times do
# Qvote.create(upvote: Faker::Number.between(0, 1), downvote: Faker::Number.between(0, 1), question_id: Faker::Number.between(1, 100), user_id: Faker::Number.between(1, 200))
# end

# # SEED AVOTES
# 300.times do
# Avote.create(upvote: Faker::Number.between(0, 1), downvote: Faker::Number.between(0, 1), answer_id: Faker::Number.between(1, 100))
# end