ActiveAdmin.register Article do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :title, :short_description, :description, :event_review, :show_on_site, :show_on_main_page, images: []


  form html: { multipart: true }  do |f|
    f.inputs  do
      f.input :title
      f.input :short_description
      f.input :description
      f.input :event_review
      f.input :show_on_site
      f.input :show_on_main_page
      f.input :images, as: :formtastic_attachinary
    end
    f.actions
  end
end
