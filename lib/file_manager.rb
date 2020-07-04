require 'date'

# File manager.
class FileManager
  def self.save(string, extension)
    file = './output/' + DateTime.now.strftime('%Y_%m_%d_at_%I_%M_%S_%p') + ".#{extension}"
    file = File.expand_path(file)
    File.write(file, string)
    file
  end
end
