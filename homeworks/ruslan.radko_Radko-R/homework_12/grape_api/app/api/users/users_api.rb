module Users
  class UsersAPI < Grape::API

    format :json

    desc "Users list", {
        :notes => <<-NOTE
         Get All Users
          __________________
         NOTE
     }

     get do
       User.all
     end


     desc "User by id", {
         :notes => <<-NOTE
         Get User By Id
          __________________
         NOTE
     }

     params do
      requires :id, type: Integer, desc: "User id"
     end

     get ':id' do
       begin
         user = User.find(params[:id])
       rescue ActiveRecord::RecordNotFound
         error!({ status: :not_found }, 404)
       end
     end

     desc "Delete user by id", {
         :notes => <<-NOTE
         Delete User By Id
          __________________
         NOTE
     }

     params do
       requires :id, type: Integer, desc: "User id"
     end

     delete ':id' do
      begin
         user = User.find(params[:id])
         { status: :success } if user.delete
       rescue ActiveRecord::RecordNotFound
         error!({ status: :error, message: :not_found }, 404)
       end
     end

     desc "Edit user by id", {
         :notes => <<-NOTE
         Update User By Id
                       __________________
         NOTE
     }

     params do
       requires :id, type: Integer, desc: "User id"
       requires :first_name, type: String, desc: "User name"
       requires :last_name, type: String, desc: "User last name"
       requires :email, type: String, desc: "User email"
    end

     put ':id' do
       begin
         user = User.find(params[:id])
         if user.update({
                           first_name: params[:first_name],
                           last_name: params[:last_name],
                           email: params[:email]
                       })
          { status: :success }
        else
          error!({ status: :error, message: user.errors.full_messages.first }) if user.errors.any?
        end


       rescue ActiveRecord::RecordNotFound
         error!({ status: :error, message: :not_found }, 404)
       end
     end


     desc "Create User", {
         :notes => <<-NOTE
         Create User
          __________________
         NOTE
    }

     params do
       requires :first_name, type: String, desc: "User name"
       requires :last_name, type: String, desc: "User surname"
       requires :email, type: String, desc: "User email"
     end

     post do
       begin
         user =  User.create({
                               first_name: params[:first_name],
                               last_name: params[:last_name],
                               email: params[:email],
                             })
        if user.save
           { status: :success }
         else
           error!({ status: :error, message: user.errors.full_messages.first }) if user.errors.any?
         end


       rescue ActiveRecord::RecordNotFound
         error!({ status: :error, message: :not_found }, 404)
       end
     end
   end
 end
