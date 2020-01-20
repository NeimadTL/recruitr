# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Skill.delete_all
Role.delete_all
User.delete_all

Skill.create!(name: 'Marketing')
Skill.create!(name: 'JavaScript')
Skill.create!(name: 'Ruby')
Skill.create!(name: 'Communication')
Skill.create!(name: 'Community')
Skill.create!(name: 'Finance')
Skill.create!(name: 'Credit')

Role.create!(code: Role::HR_ROLE_CODE, name: 'HR')
Role.create!(code: Role::EMPLOYEE_ROLE_CODE, name: 'EMPLOYEE')
Role.create!(code: Role::CANDIDATE_ROLE_CODE, name: 'CANDIDATE')

User.create!(email: "hr@recruitr.com", password: "hr_password2020",
  password_confirmation: "hr_password2020", role_id: Role::HR_ROLE_CODE)
