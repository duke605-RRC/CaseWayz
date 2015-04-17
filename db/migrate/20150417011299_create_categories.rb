class CreateCategories < ActiveRecord::Migration
  def change
    reversible do |dir|
      dir.up do
        execute <<-SQL
          CREATE TABLE categories (
            id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
            name VARCHAR(50) NOT NULL,
            description TEXT NOT NULL,
            created_at DATETIME NOT NULL,
            updated_at DATETIME NOT NULL
          );
        SQL
      end

      dir.down do
        execute <<-SQL
          DROP TABLE categories;
        SQL
      end
    end
  end
end
