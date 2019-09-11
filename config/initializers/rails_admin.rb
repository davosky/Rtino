RailsAdmin.config do |config|
  config.authorize_with do
    redirect_to main_app.root_path unless current_user.user_type == "admin"
  end

  config.parent_controller = "ApplicationController"

  config.main_app_name = ["Rtino"]

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
