class Product < ActiveRecord::Base

  has_many :assignments
  has_many :cats, through: :assignments

  def find_available_cats
    @add_cats_options = []

    (Cat.all - self.cats).each do |c|
      @add_cats_options << c.name
    end

    return @add_cats_options
  end

  def find_assigned_cats
    @remove_cats_options = []

    self.cats.each do |c|
      @remove_cats_options << c.name
    end

    return @remove_cats_options
  end

end
