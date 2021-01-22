# covid_correlations

## Data Descriptions

### Global

The global densities come from [UN Population Dynamics](https://population.un.org/wpp/Download/Standard/Population/) and are measured in 1000s.

The global population count from [US Census yearly estimates](https://www.census.gov/data/datasets/time-series/demo/popest/2010s-total-cities-and-towns.html), data [found here](https://www2.census.gov/programs-surveys/popest/datasets/2010-2020/national/totals/) and is measured in 1000s. This is not used in the final "polished" code.

The covid death and case statistics come from the [COVID19 R Package](https://cran.r-project.org/web/packages/COVID19/index.html), which states the origin for these metrics as the [Oxford COVID-19 Government Response Tracker](https://www.bsg.ox.ac.uk/research/research-projects/coronavirus-government-response-tracker). 

Citation: 
Guidotti, E., Ardia, D., (2020), "COVID-19 Data Hub", Journal of Open
  Source Software 5(51):2376, doi: 10.21105/joss.02376.
  
### United States

The U.S. land areas per county come from the [Census' TIGERweb](https://tigerweb.geo.census.gov/tigerwebmain/TIGERweb_state_based_files.html) page, with [data description on this page](https://www.census.gov/quickfacts/fact/note/US/LND110210). The land area is measured in square meters (!) and population in units. I convert to square miles (though the units aren't important for correlation) and divide to obtain population density. For some reason, the website doesn't have data on GA, HI, and ID or DC.

The U.S. Covid data per county comes from [JOhn's Hopkins CSSE colleciton](https://github.com/CSSEGISandData/COVID-19/tree/master/csse_covid_19_data/csse_covid_19_time_series), using `time_series_covid19_confirmed_US.csv`. I did not use deaths, but maybe in the future. 

