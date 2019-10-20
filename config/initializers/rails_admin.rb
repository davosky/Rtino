# frozen_string_literal: true

RailsAdmin.config do |config|
  config.authorize_with do
    redirect_to main_app.root_path unless current_user.user_type == "admin"
  end

  config.parent_controller = "ApplicationController"

  config.main_app_name = ["Rtino"]

  config.model "User" do
    visible true
    label "Utente"
    label_plural "Utenti"
  end

  config.model "Report" do
    visible true
    label "Rapporto"
    label_plural "Rapporti"
  end

  config.model "Assistance" do
    visible true
    label "Assistenza"
    label_plural "Assistenze"
  end

  config.model "Location" do
    visible true
    label "Posizione"
    label_plural "Posizioni"
  end

  config.model "Structure" do
    visible true
    label "Struttura"
    label_plural "Strutture"
  end

  config.model "Office" do
    visible true
    label "Ufficio"
    label_plural "Uffici"
  end

  config.model "Category" do
    visible true
    label "Categoria"
    label_plural "Categorie"
  end

  config.model "Transport" do
    visible true
    label "Trasporto"
    label_plural "Trasporti"
  end

  config.model "Transfer" do
    visible true
    label "Trasferimento"
    label_plural "Trasferimenti"
  end

  config.model "Project" do
    visible true
    label "Progetto"
    label_plural "Progetti"
  end

  config.model "ProjectStatus" do
    visible true
    label "Stato Progetti"
    label_plural "Stati Progetti"
  end

  config.model "ProjectTypology" do
    visible true
    label "Tipologia Progetti"
    label_plural "Tipologie Progetti"
  end

  config.model "Task" do
    visible true
    label "Task"
    label_plural "Task"
  end

  config.model "PurchaseTypology" do
    visible true
    label "Tipologia Pagamento"
    label_plural "Tipologie Pagamento"
  end

  config.model "Purchase" do
    visible true
    label "Acquisto"
    label_plural "Acquisti"
  end

  config.model "Vendor" do
    visible true
    label "Venditore"
    label_plural "Venditori"
  end

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
