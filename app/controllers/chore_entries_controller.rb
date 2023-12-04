class ChoreEntriesController < ApplicationController
  before_action :set_chore_entry_view_model, only: %i[ new  ]

  # GET /chore_entries or /chore_entries.json
  def index
    @chore_entries = ChoreEntry.where(completed: true, date: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
  end

  # GET /chore_entries/1 or /chore_entries/1.json
  def show
    @chore_entry = ChoreEntry.find(params[:id])
  end

  # GET /chore_entries/new
  def new
  end

  # GET /chore_entries/1/edit
  def edit
    @chore_entry_view_model = ChoreEntryViewModel.new(chore_entries:, chores:)
  end

  # POST /chore_entries or /chore_entries.json
  def create
    @chore_entry_view_model = ChoreEntryViewModel.new(chore_entry_view_model_params.merge(chores:))

    respond_to do |format|
      if @chore_entry_view_model.save
        format.html { redirect_to chore_entries_url, notice: "Chore entries were successfully created." }
        format.json { render json: @chore_entry_view_model.chore_entries, status: :created }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @chore_entry_view_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chore_entries/1 or /chore_entries/1.json
  def update
    @chore_entry_view_model = ChoreEntryViewModel.new(({chore_entries:, chores:}).merge(chore_entry_view_model_params))

    respond_to do |format|
      if @chore_entry_view_model.save
        format.html { redirect_to chore_entries_url, notice: "Chore entries were successfully created." }
        format.json { render json: @chore_entry_view_model.chore_entries, status: :created }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @chore_entry_view_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chore_entries/1 or /chore_entries/1.json
  def destroy
    @chore_entry = ChoreEntry.find(params[:id])
    @chore_entry.destroy!

    respond_to do |format|
      format.html { redirect_to chore_entries_url, notice: "Chore entry was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def chores
      @chores ||= Chore.all
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_chore_entry_view_model
      @chore_entry_view_model = ChoreEntryViewModel.new(chores:, date: start_date)
    end

    # Only allow a list of trusted parameters through.
    def chore_entry_view_model_params
      params.require(:chore_entry_view_model).permit(:date, chore_entries_attributes: [:chore_id, :completed, :date ])
    end

    def chore_entries
      @chore_entries ||= begin 
        ChoreEntry.where(date: start_date)
      end
    end

    def start_date
      @start_date ||= params.fetch(:start_date, Date.today).to_date
    end
end
