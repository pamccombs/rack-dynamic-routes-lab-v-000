class Application
  
  @@items = [Item.new("Apples", 0.50)]
  
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      if item =@@items.find{|i| i.name == item_name}
        resp.write item.price
      end
    end
  end
  
end