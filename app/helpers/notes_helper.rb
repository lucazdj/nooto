# Module for helpers
module NotesHelper
  COLORS = %w[slate gray zinc neutral stone red orange amber yellow lime green emerald teal cyan sky blue indigo violet
              purple fuchsia pink rose].freeze

  def bg?(color, tone = 500)
    COLORS.include?(color) ? "bg-#{color}-#{tone}" : "bg-indigo-#{tone}"
  end
end
