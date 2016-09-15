
def measure(x=0)
  t = Time.now
  if x>0
    x.times {|i| yield}
    (Time.now-t).to_f/x.to_f
  else
    yield
    Time.now-t
  end
end


