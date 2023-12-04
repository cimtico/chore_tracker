class DashboardController < ApplicationController
  def index
    @child = Child.first
    @week_chore_entries = ChoreEntry.where(completed: true, date: Date.today.beginning_of_month.beginning_of_week..Date.today.end_of_month.end_of_week)
    @week_expenses = Expense.where(date: Date.today.beginning_of_month.beginning_of_week..Date.today.end_of_month.end_of_week).sum(:value)
    @total_earned = ChoreEntry.where(completed: true).where("date > :cutoff", cutoff: @child.last_cutoff_at).sum(:value)
    @total_expenses = Expense.where("date > :cutoff", cutoff: @child.last_cutoff_at).sum(:value)
  end
end
