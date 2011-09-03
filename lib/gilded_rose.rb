path = File.join(File.dirname(__FILE__), 'gilded_rose', '**', '*')
Dir[path].each do |f|
  require f
end

