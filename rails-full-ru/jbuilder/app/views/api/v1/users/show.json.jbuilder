# app/views/api/v1/users/show.json.jbuilder

json.id @user.id
json.email @user.email
json.address @user.address
json.full_name "#{@user.first_name} #{@user.last_name}"
json.posts @user.posts do |post|
  json.id post.id
  json.title post.title
end
