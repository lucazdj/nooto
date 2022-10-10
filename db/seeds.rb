# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


Record.create :name => "Felinos"
Animal.create :name => "Gato", :record_id => 1, :description => I18n.t(:lorem)
Animal.create :name => "Leão", :record_id => 1,  :description => I18n.t(:lorem)
Animal.create :name => "Onça", :record_id => 1,  :description => I18n.t(:lorem)
Animal.create :name => "Guepardo", :record_id => 1, :description => I18n.t(:lorem)
Animal.create :name => "Jaguatirica", :record_id => 1,  :description => I18n.t(:lorem)
Animal.create :name => "Puma", :record_id => 1,  :description => I18n.t(:lorem)
Animal.create :name => "Caracal", :record_id => 1, :description => I18n.t(:lorem)
Animal.create :name => "Tigre", :record_id => 1,  :description => I18n.t(:lorem)
