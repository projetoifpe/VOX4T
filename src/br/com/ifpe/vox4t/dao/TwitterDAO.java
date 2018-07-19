package br.com.ifpe.vox4t.dao;

import java.util.List;

import twitter4j.Status;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.conf.ConfigurationBuilder;

public class TwitterDAO {

	
	public List<Status> coletaTweets() throws TwitterException {
		
		ConfigurationBuilder cb = new ConfigurationBuilder();
		
				cb.setDebugEnabled(true)
					.setOAuthConsumerKey("Wc1xqD1ZXDFD1M2xoPJSwU687")
					.setOAuthConsumerSecret("REiwyUuT8RkI580qxQ9L6qz4XsI6WSLssR1UtjnuX4uMEe8KF8")
					.setOAuthAccessToken("987757693040545797-wlQva0FLSy6ZQPcrqt6KxiFNnArhms1")
					.setOAuthAccessTokenSecret("55j6SRHL31KKFC8CC4HH2QdISyMZJs9q8hsch9zF41Fuz")
					.setTweetModeExtended(true);
				
		TwitterFactory tf = new TwitterFactory(cb.build());
		twitter4j.Twitter twitter = tf.getInstance();
		
		
		List<Status> status = twitter.getUserTimeline("@jctransito");
		
		return status;
	}
}
