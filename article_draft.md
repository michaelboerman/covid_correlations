
### Article

Raw numbers are rancid, and while per capita might are a better measure of COVID cases, they might not fair well either. For non-communicable cases – cancer, cataracts, constipation – “X cases per Y people” provides a useful metric for comparison between two regions. But COVID is highly transmittable. New York City broke out well faster and to a greater extent than (fill in the blank rural city in rural state). Is per capita comparison really apples to apples, or is a necessary  metric found by including population density: “X cases per Y people per Z area”?
To test this I first looked at a list of 268 countries. For each date, I compute the correlation between COVID cases and population densities.  Early on there are only a handful of countries with outbreaks, so I cut out dates before there were 15 observed deaths, and the series quickly converges to around 250 countries included for each date. 

< insert graph 1> 

And, would you look at this! This data suggests that population density and number of COVID cases actually are negatively correlated! When population density increases, the number of cases is actually set to decrease. Case closed …

… But there’s more to the story. The average population density over an entire country isn’t particularly useful. The average blurs the details: maybe not for Monaco or Mongolia, but certainly for the United States, China, and the majority of the other 263 countries analyzed. 
So I offer another look at the correlation between population density and COVID case count. This time, I obtain the data for each county in the United States.  Using ten times the number of zones in just a fraction of the total area of the globe avoids the Flaw of Averages. This level of granularity suggests a far different story.

<insert graph 2>

Significant (practical and statistical) correlations exist. The downward trend suggests the myriad of factors that affect the number of cases beyond population density, such as the extent and effectiveness of lockdown measures and vaccine introductions. 
My mom enjoys watching the news after long days in her healthcare job. I hear the reporters blurt a number of new cases for the day, but I can never remember yesterday’s numbers. Are things getting better or worse? If I talk to my co-workers across the globe, comparison requires a quick google for population and a division. In the United States, at least, there is cause to need to include details about the population density as well. For now, though, I won’t ask too much: I’d be happy if the nightly news would just show a history of cases with a simple line. 

You can find a full list of data sources, computations, and decisions in the corresponding github. You are welcome to fork the repository and make modifications, but keep me in the loop -- I’d love to see your ideas! 


### Sources and Inspiration:

https://robjhyndman.com/hyndsight/logratios-covid19/

https://twitter.com/jburnmurdoch/status/1242904596856614912

Additional plots:

<number in each correlation>

<per state with highlights>

