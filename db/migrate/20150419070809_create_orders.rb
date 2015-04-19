class CreateOrders < ActiveRecord::Migration
  def change
    reversible do |dir|
      dir.up do
        execute <<-SQL
          CREATE TABLE orders (
            id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
            status VARCHAR(20) NOT NULL,
            pst DECIMAL,
            gst DECIMAL,
            hst DECIMAL,
            customer_id INTEGER NOT NULL,
            created_at DATETIME NOT NULL,
            updated_at DATETIME NOT NULL,
            FOREIGN KEY (customer_id) REFERENCES customers
          );
        SQL
      end

      dir.down do
        execute <<-SQL
          DROP TABLE orders;
        SQL
      end
    end
  end
end
