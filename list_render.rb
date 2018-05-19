require 'nokogiri'
require 'open-uri'

def getSiblings(elm)
  siblings = []
  sibling = elm
  while sibling do
    # puts sibling
    siblings.push(sibling) if sibling.node_type == 1
    sibling = sibling.next_sibling
  end
  return siblings
end

def getModuleIds(children)
  children.reject(&:blank?).each_with_index do |child, index|
    puts "#{index} #{child} #{child.at('[data-module-id]')}"
    if child.at('[data-module-id]')
      params_used_module = {location_id: "hoge", moudle_id: child.at('[data-module-id]').get_attribute('data-module-id'), row_order: index}
      puts params_used_module
    end
  end
end


def find_col(row, row_order, parent=nil)
  #puts row.children.css('[class*=col-]')
  elm = row.css('[data-class="col"]').first
  siblings = getSiblings(elm)
  col_class = "col-#{12/siblings.length}"
  siblings.each_with_index do |col, index|
    col.add_class(col_class)
    puts col
    params_location = {row: row_order, col: index, parent: parent}
    puts params_location

    if col.at('[data-class="row"]')
      find_row(col.css('[data-class="row"]'), row_order)
    else
      getModuleIds(col.children)

    end
  end
end

def find_row(nodes, parent = nil)
  row = nodes.css('[data-class="row"]').first
  first_row_nodes = getSiblings(row)
  #puts first_row_nodes
  first_row_nodes.each_with_index do |node_row, index|
    row_order = index
    p "====================================="
    find_col(node_row, row_order, parent)
  end
end

def other_than_list_tag(nodes)
  not_list = nodes.css('body').children.xpath('*[not(self::ul or self::li)]')
  puts not_list
end

url = './list.html'

nodes = File.open(url) { |f| Nokogiri::HTML(f) }
find_row(nodes)
#other_than_list_tag(nodes)

