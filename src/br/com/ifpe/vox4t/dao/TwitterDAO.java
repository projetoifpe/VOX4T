package br.com.ifpe.vox4t.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.taglibs.standard.tag.common.xml.ForEachTag;

import twitter4j.Status;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.conf.ConfigurationBuilder;

public class TwitterDAO {

	
	public List<List<Status>> coletaTweets() throws TwitterException {
		
		ConfigurationBuilder cb = new ConfigurationBuilder();
		
				cb.setDebugEnabled(true)
					.setOAuthConsumerKey("Wc1xqD1ZXDFD1M2xoPJSwU687")
					.setOAuthConsumerSecret("REiwyUuT8RkI580qxQ9L6qz4XsI6WSLssR1UtjnuX4uMEe8KF8")
					.setOAuthAccessToken("987757693040545797-wlQva0FLSy6ZQPcrqt6KxiFNnArhms1")
					.setOAuthAccessTokenSecret("55j6SRHL31KKFC8CC4HH2QdISyMZJs9q8hsch9zF41Fuz")
					.setTweetModeExtended(true);
				
		TwitterFactory tf = new TwitterFactory(cb.build());
		twitter4j.Twitter twitter = tf.getInstance();
		List<List<Status>> listaFinal = new ArrayList<List<Status>>();
		String[] canais = {"@LegiaoDosHerois","@SantosFC","@governope","@EPratica2","@hipsterrecifens","@OficialCelpe"};
		for (String canal : canais) {
			List<Status> status = twitter.getUserTimeline(canal);
			listaFinal.add(status);
		}
		
		
		return listaFinal;
	}
}
