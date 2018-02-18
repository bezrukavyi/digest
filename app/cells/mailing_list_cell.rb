class MailingListCell < Cell::ViewModel
  include ActionView::Helpers::TranslationHelper
  include Cell::Translation
  include SimpleForm::ActionViewExtensions::FormHelper

  property :slug, :name, :description

  def form
    render partial: 'form'
  end

  private

  def edit_link
    link_to 'Edit', edit_dashboard_mailing_list_path(model)
  end

  def destroy_link
    link_to 'Destroy', [:dashboard, model], method: :delete, data: { confirm: 'Are you sure?' }
  end

  def form_url
    return dashboard_mailing_lists_path if model.new_record?
    dashboard_mailing_list_path(model)
  end
end
