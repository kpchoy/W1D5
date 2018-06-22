class PolyTreeNode 
  
  def initialize(value)
    @parent = nil 
    @children = []
    @value = value 
  end 
  
  def parent
    @parent 
  end 
  
  def parent=(new_parent)
    
    # if parent already exists
    #   n1.children delete child
    if @parent != nil 
      @parent.children.delete(self)
    end 
    @parent = new_parent 
    @parent.children << self unless new_parent == nil 
  end 
  
  def children
    @children
  end 
  
  def add_child(child_node)
    child_node.parent=(self)
  end 
  
  def remove_child(child_node)
    raise "Node is not a child" if child_node.parent != self
    child_node.parent=(nil)
    
  end 
  
  def value 
    @value
  end 
  
  def dfs(target_value)
    return self if self.value == target_value
    
    self.children.each do |child|
      node = child.dfs(target_value)
      return node if node != nil 
    end 
    
    nil
  end
  
  def bfs(target_value)
    queue = Queue.new
    queue.push(self)
    # until queue.empty?
    # 
    # end
    
  end 
  

end

