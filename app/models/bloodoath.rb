class BloodOath
  attr_reader :date, :cult, :follower
  @@all = []

  def self.all
    @@all
  end

  def self.first_oath
    @@all.first.follower
  end

  def initialize(date = DateTime.now.strftime("%Y-%m-%d"), cult, follower)
    @date = date
    @cult = cult
    @follower = follower
    @@all << self
  end
end
