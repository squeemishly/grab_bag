class ApiCaller
  def self.get(url)
    Faraday.get(url)
  end
end
