app_name = ARGV[0]
File.open("README.md", 'w') {|f| f.write("# "+app_name.capitalize)}