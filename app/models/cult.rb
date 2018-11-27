class Cult
  attr_reader :name, :location, :founding_year, :slogan

  @@all = []

  def self.all
    @@all
  end

  def self.find_by_name(name)
    self.all.find  {|cult| cult.name == name }
  end

  def self.find_by_location(location)
    self.all.select {|cult| cult.location == location }
  end

  def self.find_by_founding_year(founding_year)
    self.all.select {|cult| cult.founding_year == founding_year}
  end

  def self.least_popular
    least = self.all.first
    count = self.all.first.followers.size
    self.all.each do |cult|
      if cult.followers.size < count
        count = cult.followers.size
        least = cult
      end
    end
    least
  end

  def self.most_common_location
    location_hash = Hash.new
    self.all.each do |cult|
      if location_hash[cult.location].nil?
        location_hash[cult.location] = 1
      else
        location_hash[cult.location] += 1
      end
    end.max_by{|k, v| v }.location
  end

  def initialize(name, location, founding_year, slogan)
    @name = name
    @location = location
    @founding_year = founding_year
    @slogan = slogan
    @@all << self
  end

  def recruit_follower(follower)
    BloodOath.new(self, follower)
  end

  def cult_population
    BloodOath.all.select {|bloodoath| bloodoath.cult == self }.size
  end

  def average_age
    ages = self.followers.map { |follower| follower.age }
    ages.reduce(:+)/ages.size
  end

  def my_followers_mottos
    self.followers.each { |follower| puts follower.life_motto }
  end

  def followers
    BloodOath.all.map {|bloodoath| bloodoath.follower if bloodoath.cult == self }.compact
  end
end
