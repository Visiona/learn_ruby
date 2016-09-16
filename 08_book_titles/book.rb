class Book
  def title=(name)
    exceptions = ["the", "a", "an", "at", "by", "down", "for", "from", "in", "into", "like", "near", "of", "off", "on", "onto", "over", "past", "to", "upon", "with", "and", "as", "but", "for", "if", "nor", "once", "or", "so", "than", "that", "till", "yet"]
    new_name = name.split(" ").each {|word| word.capitalize! if not exceptions.include? word }
    new_name[0].capitalize!
    @title = new_name.join(" ")
  end
  def title
    @title
  end
end