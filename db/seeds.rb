# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: 'Nazareno',
            surname: 'Mateo',
            position: 'Mechanical Engineer',
            unit: 'Engineering',
            service: 'General Services',
            email: 'nrmateo@dlshsi.edu.ph',
            password: 'abc123',
            password_confirmation: 'abc123',
            role: 0)

            User.create!(name: 'Nazareno',
            surname: 'Mateo',
            position: 'Mechanical Engineer',
            unit: 'Engineering',
            service: 'General Services',
            email: 'nrmateo1@dlshsi.edu.ph',
            password: 'abc123',
            password_confirmation: 'abc123',
            role: 1)

            User.create!(name: 'Nazareno',
            surname: 'Mateo',
            position: 'Mechanical Engineer',
            unit: 'Engineering',
            service: 'General Services',
            email: 'nrmateo2@dlshsi.edu.ph',
            password: 'abc123',
            password_confirmation: 'abc123',
            role: 1)


            Personnel.create!(name: 'Nazareno',
            surname: 'Mateo',
            maintenance_unit: 'Engineering',
            position: 'Mechanical Engineer')

            Personnel.create!(name: 'Gelyn',
            surname: 'Azuela',
            maintenance_unit: 'Engineering',
            position: 'Civil Engineer')

            Personnel.create!(name: 'Danilo',
            surname: 'Brabante',
            maintenance_unit: 'Painting',
            position: 'Team Leader')

            Personnel.create!(name: 'Arturo',
            surname: 'Cainto',
            maintenance_unit: 'Masonry',
            position: 'Team Leader')

            Personnel.create!(name: 'Rolly',
            surname: 'Canete',
            maintenance_unit: 'Electrical',
            position: 'Team Leader')

            Personnel.create!(name: 'Jose',
            surname: 'Fototana',
            maintenance_unit: 'Aircon',
            position: 'Team Leader')

            Personnel.create!(name: 'Gamiel',
            surname: 'Manalo',
            maintenance_unit: 'Welding',
            position: 'Team Leader')

            Personnel.create!(name: 'Hanzel',
            surname: 'Pascual',
            maintenance_unit: 'Carpentry',
            position: 'Team Leader')

            Personnel.create!(name: 'Eduardo',
            surname: 'Ulatan',
            maintenance_unit: 'Plumbing',
            position: 'Team Leader')