json.extract! apost, :id, :title, :text, :created_at, :updated_at
json.url apost_url(apost, format: :json)
