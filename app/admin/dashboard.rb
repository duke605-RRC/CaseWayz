ActiveAdmin.register_page 'Dashboard' do
  menu priority: 1, label: proc { I18n.t('active_admin.dashboard') }

  content title: proc { I18n.t('active_admin.dashboard') } do

    h2 style: 'font-weight: bold' do
      'Outstanding Orders'
    end
    div style: 'padding-left: 30px' do
      unless Order.all.any?
        h3 style: 'margin: 0px' do
          'No outstanding orders'
        end
      end

      Order.where(status: 'outstanding').each do |order|
        h3 style: 'font-weight: bold' do
          span do
            'Order '
          end
          a href: admin_order_path(order) do
            "##{order.id}"
          end
          span do
            ' For Customer '
          end
          a href: admin_customer_path(order.customer) do
            "##{order.customer.id}"
          end
        end
        table style: 'margin-bottom: 100px' do
          thead do
            tr do
              th { 'Line Item ID' }
              th { 'Quantity' }
              th { 'Price' }
              th { 'Product' }
              th { 'Created At' }
              th { 'Updated At' }
            end

            tbody do
              order.line_items.order(:price).each do |item|
                tr do
                  td style: 'border-bottom: 1px dashed #DDD'do
                    link_to item.id, admin_line_item_path(item)
                  end
                  td style: 'border-bottom: 1px dashed #DDD' do
                    item.quantity
                  end
                  td style: 'border-bottom: 1px dashed #DDD' do
                    item.price
                  end
                  td style: 'border-bottom: 1px dashed #DDD' do
                    link_to item.product.name, admin_product_path(item.product)
                  end
                  td style: 'border-bottom: 1px dashed #DDD' do
                    item.created_at.strftime('%B %-d, %Y %R')
                  end
                  td style: 'border-bottom: 1px dashed #DDD' do
                    item.updated_at.strftime('%B %-d, %Y %R')
                  end
                end
              end
            end
          end
        end
      end
    end
  end # content
end
