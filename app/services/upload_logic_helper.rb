class UploadLogicHelper

  def initialize(current_user)
    @user = current_user
    @queens_english = (%w(colour cheque theatre favourite flavour metre labour humour neighbour travelled travelling traveller fuelled fuelling defence leukaemia manoeuvre paediatric licence))
  end

  def adjectives
    topword_adjectives
  end

  def nouns
    topword_nouns
  end

  def american?
    american_nouns
  end

  def camera_types
    camera_models
  end

  def document_types
    file_types
  end


  private
  attr_reader :user, :queens_english

  def file_types
    files = MetaDataFile.where(user_id: user.id)
    photos = MetaDataPhoto.where(user_id: user.id).count
    types = extract_file_types(files)
    json_output = rank_words(types)
    json_output[:img] = photos
    json_output
  end

  def extract_file_types(list)
    types = []
    list.each do |photo|
      types << photo.extension
    end
    types
  end

  def camera_models
    list = MetaDataPhoto.where(user_id: user.id)
    models = extract_camera_models(list)
    rank_words(models)
  end

  def extract_camera_models(list)
    models = []
    list.each do |photo|
      models << photo.model
    end
    models
  end

  def american_nouns
    list = MetaDataFile.where(user_id: user.id)
    nouns = extract_words(list, "top_nouns")
    find_real_english(nouns)
  end

  def find_real_english(list)
    list = list
    counter = 0
    queens_english.map do |word|
      if list.include?(word)
        counter += 1
      end
    end
    count_sanitizer(list.count, counter)
  end

  def count_sanitizer(word_count, counter)
    json_output = {}
    if counter == 0
      json_output[:commonwealth] = 0
    else
      json_output[:commonwealth] = (list.count/counter)
    end
    json_output
  end

  def topword_nouns
    list = MetaDataFile.where(user_id: user.id)
    top_nouns = extract_words(list, "top_nouns")
    rank_words(top_nouns)
  end

  def topword_adjectives
    list = MetaDataFile.where(user_id: user.id)
    top_adjectives = extract_words(list, "top_adjectives")
    rank_words(top_adjectives)
  end

  def extract_words(list, type)
    output = []
    list.each do |data|
      words_array = []
      if type == "top_adjectives"
        words_array = data.top_adjective
      elsif type == "top_nouns"
        words_array = data.top_noun
      end
      words_array.each do |word|
        output << word.downcase
      end
    end
    output
  end

  def rank_words(words)
    words_ranking = Hash.new(0)
    words.each do |word|
      words_ranking[word] += 1
    end
    words_ranking.sort_by {|_key, value| value}.last(6).to_h
  end
end
