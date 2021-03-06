require 'spec_helper'

describe 'CSS selector evaluation' do
  describe ':first-child pseudo class' do
    before do
      @document = parse('<root><a /><b /></root>')

      @a1 = @document.children[0].children[0]
      @b1 = @document.children[0].children[1]
    end

    it 'returns a node set containing the first child node' do
      expect(evaluate_css(@document, 'root :first-child')).to eq(node_set(@a1))
    end

    it 'returns a node set containing the first child node with a node test' do
      expect(evaluate_css(@document, 'root a:first-child')).to eq(node_set(@a1))
    end

    it 'returns an empty node set for non first-child nodes' do
      expect(evaluate_css(@document, 'root b:first-child')).to eq(node_set)
    end
  end
end
