class CreateProducts < ActiveRecord::Migration
  def change
    reversible do |dir|
      dir.up do
        execute <<-SQL
          CREATE TABLE products (
            id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
            name VARCHAR(50) NOT NULL,
            description TEXT NOT NULL,
            price DECIMAL NOT NULL check(price > 0.00),
            quantity INTEGER CHECK (quantity >= 0) DEFAULT 0,
            category_id INTEGER NOT NULL,
            image TEXT,
            created_at DATETIME NOT NULL,
            updated_at DATETIME NOT NULL,
            FOREIGN KEY (category_id) REFERENCES categories
          );
        SQL
      end

      dir.down do
        execute <<-SQL
          DROP TABLE products;
        SQL
      end
    end
  end
end
