# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Skill.delete_all
Role.delete_all

Skill.create!(name: 'Marketing')
Skill.create!(name: 'JavaScript')
Skill.create!(name: 'Ruby')
Skill.create!(name: 'Communication')
Skill.create!(name: 'Community')
Skill.create!(name: 'Finance')
Skill.create!(name: 'Credit')

Role.create!(code: 1, name: 'HR')
Role.create!(code: 2, name: 'EMPLOYEE')
Role.create!(code: 3, name: 'CANDIDATE')
