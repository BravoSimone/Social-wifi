class String
   def xor(other)
    if other.empty?
      self
    else
      a1        = self.unpack("c*")
      a2 = other.unpack("c*")
      a2 *= 2   while a2.length < a1.length
      a1.zip(a2).collect{|c1,c2| c1^c2}.pack("c*")
    end
  end
end
