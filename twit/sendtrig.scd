(
/*
# <http://sctweets.tumblr.com/post/13826177927/sendtrig>


      SendTrig

I thought I wouldn’t make an sctweet out of this, because it requires an
*OSCresponder* (which takes some characters to do). So, maybe in the
*3.5* version of supercollider would be better, because it will be
called *OSCFunc* and it takes less code to achieve the same. This tweet
I make just sends back to the language a value made by *Sweep*, and
is re triggered 4 times per second. In the responder I take the number
as string and let is *speak* it /(Mac OS only afaik)/. With the ‘force’
[ /speak(0, *true*)/ ] argument, it lets me retrigger the
speech synthesizer instead of waiting until it’s done (normal behavior).
The funny thing, is that it doesn’t re trigger every time as expected,
so sometimes it says the whole number and the other ones are ‘remixed’ ;)

play{SendTrig.kr(Impulse.kr(4),1,Sweep.kr(Impulse.kr(1/8),1)+1)};OSCresponder(nil,'/tr',{|…m|round(m@2@3).asString.speak(0,true)}).add

*/
play{SendTrig.kr(
	Impulse.kr(4), 1, Sweep.kr(Impulse.kr(1/8),1)+1)
};
OSCresponder(nil,'/tr',{|…m|
	round(m@2@3).asString.speak(0,true)}).add

)