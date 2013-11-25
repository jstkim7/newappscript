file = File.readlines('application_helper.txt')
file[4] = file[4][0..-2] + '"' + ARGV[0] + '"' + "\n"

new_file = file.join

File.open('app/helpers/application_helper.rb', 'w') {|f| f.write(new_file)}