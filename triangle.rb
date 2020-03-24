# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#

def triangle(a, b, c)
  triangleCreated = Triangle.new(a, b, c)
  triangleCreated.triangle_description
end

class Triangle

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
    validate_not_all_zeros
    validate_non_zeros
    validate_side_length
  end

  def triangle_description
  
    if (@a === @b && @b === @c)
      :equilateral
    elsif @a === @b || @b === @c || @a === @c
      :isosceles
    else
      :scalene
    end

  end

  def validate_not_all_zeros
    if(@a === 0 && @b === 0 && @c === 0)
      raise(TriangleError)
    end
  end

  def validate_non_zeros
    if @a < 0 || @b < 0 || @c < 0
      raise(TriangleError)
    end
  end
  
  def validate_side_length()
    (@a + @b <= @c || @a + @c <= @b || @b + @c <= @a) ? raise(TriangleError) : true
  end
 
  private 

  def duplicate_length(a, b, c)
    if a === b || b === c || a === b
      true
    else
      false
    end
  end
  

end

# Error class used in part 2.  No need to change this code.
  class TriangleError < StandardError
  end