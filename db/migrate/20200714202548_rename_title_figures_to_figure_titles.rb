class RenameTitleFiguresToFigureTitles < ActiveRecord::Migration
  def change
    rename_table :title_figures, :figure_titles
  end
end
