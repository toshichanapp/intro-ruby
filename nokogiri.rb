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
  children.each_with_index do |child, index|
    if child.has_attribute?('data-module-id')
      params_used_module = {location_id: "hoge", moudle_id: child.get_attribute('data-module-id'), row_order: index}
      puts params_used_module
    end
  end
end


def find_col(row, row_order, parent=nil)
  #puts row.children.css('[class*=col-]')
  elm = row.css('[class*=col-]').first
  siblings = getSiblings(elm)
  siblings.each_with_index do |col, index|

    params_location = {row: row_order, col: index, parent: parent, css_class: col.get_attribute('class')}
    # if col.has_attribute?('data-module-id')
    #   puts col.children
    # end
    puts params_location

    if col.at('.row') && col.at('.row').has_attribute?('data-module-id')
      find_col(col, 0, row_order)
    else
      getModuleIds(col.children)

    end
  end
end

def find_row(nodes, parent = nil)
  #nodes.css('.container > .row').each_with_index do |row, index|
  nodes.css('.ui-sortable > .row').each_with_index do |row, index|
    row_order = index
    p "====================================="
    find_col(row, row_order)
  end
end

# url = './layout.html'
# url = './boot.html'
# url = './template_show.html'
url = './list.html'

nodes = File.open(url) { |f| Nokogiri::HTML(f) }
find_row(nodes)

