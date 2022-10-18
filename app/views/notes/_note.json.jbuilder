json.extract! note, :id, :title, :content, :author, :color, :created_at, :updated_at
json.url note_url(note, format: :json)
