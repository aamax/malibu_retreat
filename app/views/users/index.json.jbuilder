# json.array!(@users) do |user|
#   json.extract! user, :id, :name, :email, :street, :city, :state, :zip, :home_phone, :cell_phone, :fax, :roles
#   json.url user_url(user, format: :json)
# end

json.array!(@users) do |user|
  json.id           user.id
  json.name         user.name
  json.email        user.email
  json.street       user.street
  json.city         user.city
  json.state        user.state
  json.zip          user.zip
  json.home_phone   user.home_phone
  json.cell_phone   user.cell_phone
  json.fax          user.fax
  json.roles        user.roles
  json.isAdmin      user.has_role? :admin
  json.isSystem     user.has_role? :system
  json.lastSignInAt   user.last_sign_in_at.nil? ?  "---" : user.last_sign_in_at.strftime("%m/%d/%Y %H:%M:%S")
end
