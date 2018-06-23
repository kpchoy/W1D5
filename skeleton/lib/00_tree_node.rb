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
      return node unless node.nil?
    end 
    
    nil
  end
  
  # 1) Add root node to Queue
  # 2) Check first item of queue (root node) 
  #         a) if equal to target, return target
  #         b) else shift off that node
  # 3) Push children of root to queue
  # 4) Check next item
  # 
  def bfs(target_value)
    
    queue = Queue.new
    queue.push(self)
    until queue.empty?
      current_node = queue.shift 
      if current_node.value == target_value
        return current_node
      else
        current_node.children.each do |child|
          queue << child
        end
      end
    end
    
    nil 
  end 
  

end

