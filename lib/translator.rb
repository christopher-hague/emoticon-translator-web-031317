# require modules here
require "yaml"

def load_library(lib)
  result = {'get_meaning' => {}, 'get_emoticon' => {}}

  YAML.load_file(lib).each do |meaning, arr|
    english, japanese = arr
    result['get_meaning'][japanese] = meaning
    result['get_emoticon'][english] = japanese
  end

  result
end

def get_japanese_emoticon(file_path, emoticon)
  # create a lib of the emoticon dictionary
  lib = load_library(file_path)

  # if the emot passed exists in the lib
  if lib['get_emoticon'][emoticon]
    lib['get_emoticon'][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  lib = load_library(file_path)

  if lib['get_meaning'][emoticon]
    lib['get_meaning'][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end
