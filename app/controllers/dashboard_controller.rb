class DashboardController < ApplicationController
  def index
    @week_chore_entries = ChoreEntry.where(completed: true, date: Date.today.beginning_of_month.beginning_of_week..Date.today.end_of_month.end_of_week)
    @week_expenses = Expense.where(date: Date.today.beginning_of_month.beginning_of_week..Date.today.end_of_month.end_of_week).sum(:value)
    @total_earned = ChoreEntry.where(completed: true).sum(:value)
    @total_expenses = Expense.sum(:value)
  end
end
