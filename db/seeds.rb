# coding: utf-8


(1..1000).each do |i|
 User.create(
   name: "seed-#{sprintf("%04d",i)}",
   email: "seed-#{sprintf("%04d",i)}@example.com",
 	password: "seed-#{sprintf("%04d",i)}",
 	blood: "A型",
 	birthday: "1986-06-13",
 )
 end

(101..1000).each do |i|
	Relationship.create(
		follower_id: 1,
		followed_id: i
	)
end

(1..1000).each do |i|
	Micropost.create(
		user_id: i,
		content: "テストメッセージ - created by seed-#{sprintf("%04d",i)}"
	)
end



