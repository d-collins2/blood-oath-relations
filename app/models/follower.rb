class Follower
  attr_reader :name, :life_motto
  attr_accessor :age

  @@all = []

  def self.all
    @@all
  end

  def self.of_a_certain_age(age)
    self.all.select{|follower| follower.age >= age}
  end

  def self.most_active
    most = self.all.first
    count = most.cults.size
    self.all.each do |follower|
      if follower.cults.size > count
        most = follower
        count = follower.cults.size
      end
    end
    most
  end

  def self.top_ten
    number_cults = Hash.new
    self.all.each do |follower|
      if number_cults[follower].nil?
        number_cults[follower] = 1
      else
        number_cults[follower] += 1
      end
    end
    number_cults
  end

  def initialize(name, age, life_motto)
    @name = name
    @age = age
    @life_motto = life_motto
    @@all << self
  end

  def cults
    BloodOath.all.map {|bloodoath| bloodoath.cult if bloodoath.follower == self }.compact
  end

  def join_cult(cult)
    BloodOath.new(cult, self)
  end

  def my_cults_slogans
    self.cults.each {|cult| puts cult.slogan }
  end
end
