#Setup 

1. git clone https://github.com/mayureshmayur/prodassg
2. cd prodassg
3. bundle
4. psql=# create user lenny password 'leonard' createdb;
5. rake db:create
6. rake db:seed if you want to see some products without creating a new one,
7. rails s

Note: Only admin can update and delete products and comments. 

#To make a user admin:

1. cd prodassg
2. rails c
3. user = User.find(:id)
4. user.update(is_admin: true)
5. user.save!

