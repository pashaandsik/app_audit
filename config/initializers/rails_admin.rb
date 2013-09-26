RailsAdmin.config do |config|
  config.actions do
    # root actions
    dashboard                     # mandatory
                                  # collection actions
    index                         # mandatory
    new
    export
    history_index
    bulk_delete
                                  # member actions
    show
    edit
    delete
    history_show
    show_in_app

    # Add the nestable action for configured models
    nestable
  end
  config.model Detail do
    nestable_tree({
                      position_field: :position,
                      max_depth: 3
                  })
  end
end