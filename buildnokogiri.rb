require 'nokogiri'


root = Nokogiri::HTML::DocumentFragment.parse("")
Nokogiri::HTML::Builder.with(root) do |doc|

  doc.div.row do
    doc.div  class: do

    end
  end
end