require 'faker'

10.times do
  Note.create(title: 'Lorem ipsum', content: 'Lorem ipsum', color: 'red', author: Author.first)
end