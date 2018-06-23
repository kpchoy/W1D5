require_relative "lib/00_tree_node"
class KnightPathFinder
  def initialize(starting_position = [0,0])
    @visited_positions = [starting_position]
  end
  
  def build_move_tree(ending_pos)
    root = PolyTreeNode.new(@visited_positions[0])
    until @visited_positions.include?(ending_pos)
      new_move_positions(root.value).each do |move|
        child = PolyTreeNode.new(move)
        child.parent = root  
      end
    end
    root 
  end
  

  def find_path
    
  end
  
  def new_move_positions(pos)
    possible_moves = KnightPathFinder.valid_moves(pos)
    possible_moves.reject! { |move| @visited_positions.include?(move)}
    @visited_positions += possible_moves
  end
   
  def self.valid_moves(pos)
    moves = [[-1, 2],[-1, -2], [1, 2], [1, -2], [-2, 1], [-2, -1], [2, 1], [2, -1]]
    moves.map! do |pair|
      pair.map!.with_index do |num, i|
        pair[i] += pos[i]
      end
    end

    possible_moves = moves.select do |move|
      move.all? { |coordinate| coordinate < 8 && coordinate >= 0 }
    end 
    
    possible_moves
  end
  
  
end

