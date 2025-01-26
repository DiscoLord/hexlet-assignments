namespace :hexlet do
  desc "Import users from a CSV file"
  task import_users: :environment do |t, args|
    args.with_defaults(file: 'test/fixtures/files/users.csv')

    require 'csv'

    file_path = args[:file]
    unless File.exist?(file_path)
      puts "File not found: #{file_path}"
      exit(1)
    end

    puts "Importing users from #{file_path}..."

    CSV.foreach(file_path, headers: true) do |row|
      begin
        user = User.new(
          first_name: row['first_name'],
          last_name: row['last_name'],
          birthday: Date.strptime(row['birthday'], '%m/%d/%Y'),
          email: row['email']
        )
        if user.save
          puts "Imported: #{user.first_name} #{user.last_name} (#{user.email})"
        else
          puts "Failed to import #{row['first_name']} #{row['last_name']}: #{user.errors.full_messages.join(', ')}"
        end
      rescue StandardError => e
        puts "Error importing row #{row.inspect}: #{e.message}"
      end
    end

    puts "Import completed."
  end
end

