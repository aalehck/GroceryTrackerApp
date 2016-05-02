class Budget < ActiveRecord::Base
  belongs_to :profile

  def budget_period_date
    case self.period
    when "weekly"
      self.start + 7
    when "biweekly"
      self.start + 14
    when "monthly"
      self.start + 30
    end
  end

end
