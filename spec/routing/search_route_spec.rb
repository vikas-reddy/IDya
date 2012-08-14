describe "Routing Search" do
  it "should direct to search action in ideas for /ideas/search" do
    { get: "/ideas/search" }.should route_to(
      controller: 'ideas',
      action: 'search'
    )
  end
  it "should direct to search action in ideas for /ideas/search?q=asdf" do
    { get: "/ideas/search?q=asdf" }.should route_to(
      controller: 'ideas',
      action: 'search'
    )
  end
end
