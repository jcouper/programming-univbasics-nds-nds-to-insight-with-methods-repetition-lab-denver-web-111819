$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'

def directors_totals(source)
  result = {}
  director_index = 0
  while director_index < source.size do
    director = source[director_index]
    result[director[:name]] = gross_for_director(director)
    director_index += 1
  end
  result
end

def gross_for_director(d)
  total = 0
  index = 0

  while index < d[:movies].length do
    total += d[:movies][index][:worldwide_gross]
    index += 1
  end

  total
end

def list_of_directors(source)
  counter = 0 
  director_array = []
  while source.length > counter do 
   director_array.push(source[counter][:name])
   counter += 1 
  end
  director_array
end




def total_gross(source)
  
  
directors_and_revenue = directors_totals(source)
array_of_director_names = list_of_directors(source)
counter = 0 
final_revenue = 0 


while directors_and_revenue.length > counter do 
  current_director = array_of_director_names[counter]
  current_director_gross = directors_and_revenue[current_director]
  final_revenue += current_director_gross
  counter += 1
end

  final_revenue
  
end        
  # Write this implementation
  #
  # Should use methods:
  # 1. directors_totals: returns a Hash of { dir_name => gross }
  # 2. list_of_directors: names provides an Array of directors names (use
  #
  # Visit each key (i.e. director name), look up the value in the hash
  # returned by directors_totals, and add it to a running total. When done,
  # return the total



