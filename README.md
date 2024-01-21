# Craft Brewer Dashboard

## Overview

Welcome to the Craft Brewer Dashboard! This data analytics project focuses on creating a dashboard for displaying information related to craft breweries, broken into location based and time based information. The main goal is to allow anyone looking into opening a brewery or expanding their business to make a well informed decision about where they take their next step.

One item of note, this project was created with the goal of having a webpage that can be hosted by GitHub Pages. If that page is unavailable, then a HTTP server is required locally for this to function properly. Our team used the extension "Live Server" by Ritick Dey for Visual Studio Code. With the server running, load up the index.html file and everything should work properly.

## Usage

To interact with the project, follow these steps:

1. Follow the link to the GitHub Pages deployment
2. Interact away!
3. If that wasn't enough for you, you can clone the repository and see what we did behind the curtain yourself!

## Ethical Considerations

In our project, we are committed to ensuring ethical considerations are a priority. The vast majority of our data comes from the US government, albeit in two different forms: the Census, and reports by the Alcohol and Tobacco Tax and Trade Bureau, which was aggregated by the Brewers Association. We did not deal with any Personally Identifiable Information thankfully, albeit there could be some bias in our representation of the data, as we are targeting our presentation towards a specific audience. We cleaned the data for use by stripping the given forms formatting and inserting into our database. On extraction, manipulated the data to be an average of multiple years for our heatmap displays, and filled null values with negative numbers to clearly show something was missing. We also did our best to keep our dashboard colorblind friendly, increasing our accessibility. 

## Data Sources

- **US Census Data:**
  - U.S. Census Bureau, "Population Estimates API", accessed January 2024, https://api.census.gov/data/2017-2021/pep/population/
  - U.S. Census Bureau, "Decennial Census API", accessed January 2024, https://api.census.gov/data/2020/dec/ddhca/
  - Annual Estimates of the Resident Population for the United States, Regions, States, District of Columbia, and Puerto Rico: April 1, 2020 to July 1, 2023 (NST-EST2023-POP)
  
- **Brewers Association Dataset:**
  - Brewers Association Industry Datasets, accessed January 2024, https://www.brewersassociation.org/statistics-and-data/industry-data-sets/

- **Links**
  - [Brewers Association Dataset](https://www.brewersassociation.org/statistics-and-data/industry-data-sets/)
  - [Census data for 2020](https://api.census.gov/data/2020/dec/ddhca/)
  - [Census data for 2017-2021](https://api.census.gov/data/2017-2021/pep/population/)
  - The above Census links do not directly work, as they are accessed via the Census API.
  - The Brewers Association Dataset link does work, however it is restricted to only members of the association.

## Code References

The code in this project was developed with the assistance of OpenAI's ChatGPT. Nearly all of our team members utilized this tool to some extent as we proceeded with the project. Snippets of code can be found throughout the JavaScript and Jupyter Notebook files. For the database side of things, QuickDB was utilized to generate the ERD and the ensuing schema, included in this repository.

## Contributors

- Eric Janson - Database
- Zachary Cushman - Data pipeline
- Amanda Rolfe - Data display
- Marc Conwell - Data display

Feel free to reach out for any questions or collaboration opportunities.
