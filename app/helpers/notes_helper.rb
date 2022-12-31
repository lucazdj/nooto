module NotesHelper
  # slate gray zinc neutral stone
  COLORS = %w[red orange amber yellow lime green emerald teal cyan sky blue indigo violet
              purple fuchsia pink rose].freeze

  def bg_color(color = nil, tone = 400)
    color = 'indigo' unless COLORS.include?(color)
    "bg-#{color}-#{tone}"
  end

  def text_color(color = nil, tone = 400)
    color = 'indigo' unless COLORS.include?(color)
    "text-#{color}-#{tone}"
  end
end
