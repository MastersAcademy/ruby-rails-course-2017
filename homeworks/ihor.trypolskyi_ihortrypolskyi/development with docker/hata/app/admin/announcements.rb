ActiveAdmin.register Announcement do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or

  permit_params :link, :show_on_site, :show_on_main_page


  form html: { multipart: true }  do |f|
    f.inputs  do
      f.input :link
      f.input :show_on_site
      f.input :show_on_main_page
    end
    f.actions
  end
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
