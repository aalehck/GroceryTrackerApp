class Item < ActiveRecord::Base
  belongs_to :itemable, polymorphic: true

  # Takes array of units as arguments, and checks if they are valid units
  # If they're not valid units, they create new units in the ruby-units namespace
  # If the unit is a empty string, return nil
  def self.define_units(*units)
    no_failure = true
    units.each do |unit|
      begin
        if not Unit.defined?(unit)
          Unit.define(unit) do |u|
            u.definition = Unit.new("1")
            u.aliases = %w{u unit.singularize, unit.pluralize}
            u.display_name = unit
          end
        end
      rescue
        no_failure = false
        next
      end
    end
    return no_failure
  end

  def self.make_proper_units(base_item, new_item)
    Item.define_units base_item.split[1], new_item.split[1]
    
    og = base_item.to_unit
    nw = new_item.to_unit
      
    if og =~ nw
      return (og + nw).scalar
    else
      return nil
    end
  end

end
