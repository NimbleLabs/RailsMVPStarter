module LeadsHelper
  def lead?
    cookies[:joined_community].present?
  end
end
