xquery version "1.0";

for $b in
   doc("hw8.xml")/bookstore/book
   
where 
   $b/price < 30

return $b/title