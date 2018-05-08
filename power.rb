def pow(base,power=2)
    ans = 1
    power.times do 
        ans = ans*base
    end
   return ans 
end

 puts pow(2,8)
 puts pow(4)
