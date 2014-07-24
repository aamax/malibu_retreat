require 'csv'

namespace :db_loader do
  desc "Load data from csv to populate users"
  task :load_users, [] => :environment do
    iRow = 0

    CSV.foreach("lib/tasks/import_data/serra_dbase.csv", {:headers=>:first_row}) do |row|
      if row.blank? || (!row[0].nil? && row[0][0] == "#")
        next
      end
      iRow += 1

      # iterate rows
      hash = row.to_hash
      next if hash['Email'].nil?

      puts "ROW:  #{row.inspect}"
      puts "\n***********\n"
      puts "HASH: #{hash.inspect}"
      puts "\n***********\n"



      # First Name,Last Name,Address,City,State,Zip,Email,Home Phone,Mobile Phone,Fax Number,,2014,2013,2012,2011
      hash['Email'] = hash['Email'].gsub('/', '')
      emails = hash['Email'].split("\r") if hash['Email'].include? "\r"
      emails = hash['Email'].split(" ") if hash['Email'].include? " "
      if hash['Email'].downcase == 'please mail'
        puts "-------->  INVALID EMAIL: skipping #{hash.inspect}   "
        next
      end


      # TODO email issues, multiple entries and "please mail"

      puts "Emails: #{emails.inspect}"
      if emails.nil?  || emails.empty?
        email = hash['Email'].downcase
      else
        email = emails[0].strip.downcase
      end

      user = User.find_by_email(email)
      user = User.new if user.nil?

      user.fname = hash['First Name']
      user.lname = hash['Last Name']
      user.name = "#{hash['First Name']} #{hash['Last Name']}"
      user.email = email if user.id.nil?

      user.street = hash['Address']
      user.city = hash['City']
      user.state = hash['State']
      user.zip = hash['Zip']
      user.home_phone = hash['Home Phone']
      user.cell_phone = hash['Mobile Phone']
      user.fax = hash['Fax Number']

      user.password = 'malibuweb'

      puts "Preparing to save user:\n #{user.inspect}."
      user.save!
      puts "\nUser #{user.name} saved...\n\n"
      
      if (user.email == 'aamax@xmission.com') || (user.email == 'judithsacco@sbcglobal.net') || 
        (user.email == 'megaverett@gmail.com') || (user.email == 'caj@sti.net')
        user.add_role :admin
        puts "=========>  User #{user.name} set as admin user... **********"
      end
    end
  end
end

