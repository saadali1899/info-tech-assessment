json.extract! note, :id, :title, :message, :user, :created_at, :updated_at
json.url note_url(note, format: :json)
