def dictionary
	dictionary_hash = {
		"hello" => "hi", 
		"to" => "2", 
		"two" => "2", 
		"too" => "2", 
		"for" => "4", 
		"four" => "4", 
		"be" => "b", 
		"you" => "u", 
		"at" => "@", 
		"and" => "&"}
end

def word_substituter(tweet)
  dictionary_hash = dictionary
  words = tweet.split(" ")

  words.collect do |word|
  	dictionary_hash.collect do |key, value|
  		if word.downcase == key
  			word.replace(value)
  		end
  	end
  end
  words.join(" ")
end

def bulk_tweet_shortener(tweets)
	tweets.collect do |tweet|
	  puts word_substituter(tweet)
    end
end

def selective_tweet_shortener(tweet)
  if tweet.length > 140
  	word_substituter(tweet)
  else
  	tweet
  end
end

def shortened_tweet_truncator(tweet)
	shortened_tweet = word_substituter(tweet)
	if shortened_tweet.length >= 140
		shortened_tweet[0...135] + "(...)"
	else
		shortened_tweet
	end
end
