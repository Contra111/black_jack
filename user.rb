class User < Player
  def initialize
    super
    @name = ''
  end

  def new_name(new_name)
    @name = new_name
  end

  # если сделать тут ассесор, то он переопределяет родительский и все ломается
  def name
    @name
  end

  private

  attr_writer :name
end
