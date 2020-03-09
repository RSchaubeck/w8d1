# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Post.delete_all
Sub.delete_all
User.delete_all

user1 = User.create(name: 'Richard', password: 'password1')
user2 = User.create(name: 'Marie', password: 'password2')
user3 = User.create(name: 'Alec', password: 'password3')
user4 = User.create(name: 'Lauren', password: 'password4')

sub1 = Sub.create(name: 'woooosh', description: 'get wooshed', moderator_id: user4.id)
sub2 = Sub.create(name: 'some sub', description: 'this is some sub', moderator_id: user3.id)
sub3 = Sub.create(name: 'natureismetal', description: 'nature really is metal', moderator_id: user2.id)
sub4 = Sub.create(name: 'last sub', description: 'the last sub', moderator_id: user1.id)

post1 = Post.create(title: 'Look at this clown', url: 'clown.com',  content: 'a literal clown', user_id: user1.id, sub_id: sub1.id)
post2 = Post.create(title: 'Clever title', url: '',  content: 'pretty clever', user_id: user2.id, sub_id: sub1.id)
post3 = Post.create(title: 'anotha one', url: 'djk.com',  content: 'not much', user_id: user3.id, sub_id: sub3.id)
post4 = Post.create(title: 'Last but not least', url: '',  content: 'Least', user_id: user4.id, sub_id: sub2.id)