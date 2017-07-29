class ApiCaller
  def self.new(url)
    Faraday.new(url)
  end
end
