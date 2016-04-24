class Item < ActiveRecord::Base
  belongs_to :itemable, polymorphic: true

  # Takes array of units as arguments, and checks if they are valid units
  # If they're not valid units, they create new units in the ruby-units namespace
  def self.proper_units?(*units)
    units.each do |unit|
      if not Unit.defined?(unit)
        puts "MAKING A NEW ONE #{unit}"
        Unit.define(unit) do |u|
          u.definition = Unit.new("1")
          u.aliases = %w{u unit.singularize, unit.pluralize}
          u.display_name = unit
        end
      end
    end
  end

    def self.measure_units(base_item, new_item)
      Item.proper_units? base_item.split[1], new_item.split[1]

      puts Unit.defined?("cloves")

      puts base_item
      
      puts new_item
      puts ""
      
      og = base_item.to_unit
      nw = new_item.to_unit
      
    if og =~ nw
      return (og + nw).scalar
    else
      return nil
    end
  end

end
