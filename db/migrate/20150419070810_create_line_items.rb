class CreateLineItems < ActiveRecord::Migration
  def change
    reversible do |dir|
      dir.up do
        execute <<-SQL
          CREATE TABLE line_items (
            id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
            quantity INTEGER NOT NULL CHECK(quantity > 0),
            price DECIMAL(9, 2) NOT NULL CHECK (price > 0.00),
            order_id INTEGER NOT NULL,
            product_id INTEGER NOT NULL,
            created_at DATETIME NOT NULL,
            updated_at DATETIME NOT NULL,
            FOREIGN KEY (order_id) REFERENCES orders,
            FOREIGN KEY (product_id) REFERENCES products
          );
        SQL
      end

      dir.down do
        execute <<-SQL
          DROP TABLE line_items;
        SQL
      end
    end
  end
end
