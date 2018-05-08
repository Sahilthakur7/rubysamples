def power( base, *exponent )
    res = 1;
    unless (exponent[0] != nil)
         p = 2
         p.times do
             res = res*base
         end
    else
      z= exponent[0]
      z.times do
          res = res*base
      end
    end
    return res
end

puts power(3,3)



