def list_of_books; end

def list_of_people; end

def create_a_person; end

def create_a_book
  puts "Enter the book's title:"
  gets.chomp

  puts "Enter the book's author:"
  gets.chomp
end

def create_a_rental
  puts "Enter the person's id:"
  gets.chomp.to_i

  puts "Enter the book's id:"
  gets.chomp.to_i
end
