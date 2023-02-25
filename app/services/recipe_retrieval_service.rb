class RecipeRetrievalService
  RECIPE_NODE_XPATH = '//script[@type="application/ld+json"]'

  attr_reader :url, :source, :recipe
  def initialize(url)
    @url = url

    uri = URI(url)

    @source = Net::HTTP.get(uri)
    @recipe = recipe_node.class == Array ? recipe_node.first : recipe_node
  end

  private

  def recipe_node
    ld_json_nodes.each do |node|
      node = node[0] if node.class == Array
      if node.keys.include?('@type') && node['@type'].to_s =~ /recipe/i
        return node
      elsif node.keys.include?('@graph')
        return node["@graph"].select { |n| n["@type"] =~ /recipe/i }
      else
        return 'No recipe found'
      end
    end
  end

  def ld_json_nodes
    matching_nodes = Nokogiri::XML(source).xpath(RECIPE_NODE_XPATH)
    parsed_nodes = []
    matching_nodes.each { |node| parsed_nodes << JSON.parse(node.inner_text) }

    parsed_nodes
  end
end
