# require modules here
require 'pry'
require 'yaml'

def load_library(file_path)
  new_hash = {"get_meaning" => {}, "get_emoticon" => {}}
  config = YAML.load_file(file_path)
  config.each do |english_meaning, emoticon_list|
      new_hash["get_meaning"][emoticon_list[1]] = english_meaning
      new_hash["get_emoticon"][emoticon_list[0]] = emoticon_list[1]
  end
  return new_hash
end

def get_japanese_emoticon(file_path, english_emoticon)
  new_hash = load_library(file_path)
  if new_hash["get_emoticon"].keys.include?(english_emoticon) == false
      return "Sorry, that emoticon was not found"
  else
      new_hash["get_emoticon"].each do |eng_emoticon, jap_emoticon|
      if english_emoticon == eng_emoticon
        return jap_emoticon
      end
    end
  end
end

def get_english_meaning(file_path, japanese_emoticon)
  new_hash = load_library(file_path)
  if new_hash["get_emoticon"].keys.include?(japanese_emoticon) == false
      return "Sorry, that emoticon was not found"
  else
    new_hash["get_meaning"].each do |jap_emoticon, eng_meaning|
      if japanese_emoticon == jap_emoticon
        return eng_meaning
      end
    end
  end
end


    
