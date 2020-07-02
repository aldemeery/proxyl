require 'date'

# File manager.
class FileManager
  def self.save(_string, extension)
    file = '../output/' + DateTime.now.strftime('%Y_%m_%d_at_%I_%M_%S_%p') + ".#{extension}"
    sleep(0.5)
    File.expand_path(file)
  end
end
