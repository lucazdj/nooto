# Controller for notes
class NotesController < ApplicationController
  before_action :set_note, only: %i[show edit update destroy]
  before_action :ensure_frame_response, only: %i[show]

  # GET /notes or /notes.json
  def index
    @notes = Note.all
  end

  # GET /notes/1 or /notes/1.json
  def show
    respond_to do |format|
      format.html
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.update('modal', template: 'notes/show', locals: { note: @note })
        ]
      end
    end
  end

  def new
    @note = Note.new
    @colors = NotesHelper::COLORS
    respond_to do |format|
      format.html
      format.turbo_stream do
        render turbo_stream: turbo_stream.update('modal', template: 'notes/new', locals: { note: @note, type: :new })
      end
    end
  end

  # GET /notes/1/edit
  def edit
    @colors = NotesHelper::COLORS
    respond_to do |format|
      format.html do
        redirect_to root_path
      end
      format.turbo_stream do
        render turbo_stream: turbo_stream.update('modal', template: 'notes/edit', locals: { note: @note, type: :edit })
      end
    end
  end

  # POST /notes or /notes.json
  # @return [Object]
  def create
    @note = Note.new note_params

    respond_to do |format|
      if @note.save
        format.html { redirect_to note_url(@note) }
        format.json { render :show, status: :created, location: @note }
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.append('notes', partial: 'notes/note', locals: { note: @note }),
            turbo_stream.replace('new_note', partial: 'notes/note', locals: { note: @note }),
            turbo_stream.update('notice', partial: 'notes/notice', locals: { notice: I18n.t(:note_created) })
          ]
        end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1 or /notes/1.json
  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to note_url(@note) }
        format.json { render :show, status: :ok, location: @note }
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.replace(@note, partial: 'notes/note', locals: { note: @note }),
            turbo_stream.replace("edit_note_#{@note.id}", partial: 'notes/note', locals: { note: @note }),
            turbo_stream.update('notice', partial: 'notes/notice', locals: { notice: I18n.t(:note_updated) })
          ]
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1 or /notes/1.json
  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_url }
      format.json { head :no_content }
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.remove(@note),
          turbo_stream.update('notice', partial: 'notes/notice', locals: { notice: I18n.t(:note_deleted) })
        ]
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_note
    @note = Note.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def note_params
    params.require(:note).permit(:title, :content, :author, :color)
  end

  def ensure_frame_response
    # return unless Rails.env.development?
    # redirect_to root_path unless turbo_frame_request?
  end
end
