json.extract! invitation, :id, :email, :uuid, :company_id, :created_at, :updated_at
json.url invitation_url(invitation, format: :json)
