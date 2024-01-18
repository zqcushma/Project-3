# Craft Brewer Dashboard

## Overview

Welcome to the Craft Brewer Dashboard! This data analytics project focuses on creating a dashboard for displaying information related to craft breweries, broken into location based and time based information. The main goal is to allow anyone looking into opening a brewery or expanding their business to make a well informed decision about where they take their next step.

## Usage

To interact with the project, follow these steps:

1. Follow the link to the GitHub Pages deployment
2. Interact away!
3. If that wasn't enough for you, you can clone the repository and see what we did behind the curtain yourself!

## Ethical Considerations

In our project, we are committed to ensuring ethical considerations are a priority. The vast majority of our data comes from the US government, albeit in two different forms: the Census, and reports by the Alcohol and Tobacco Tax and Trade Bureau, which was aggregated by the Brewers Association. We did not deal with any Personally Identifiable Information thankfully, albeit there could be some bias in our representation of the data, as we are targeting our presentation towards a specific audience. We cleaned the data for use by stripping the given forms formatting and inserting into our database. On extraction, manipulated the data to be an average of multiple years for our heatmap displays, and filled null values with negative numbers to clearly show something was missing. We also did our best to keep our dashboard colorblind friendly, increasing our accessibility. 

## Data Sources

- **US Census Data:**
  - [U.S. Census API - Populatiuon Estimates 2017-2021](https://api.census.gov/data/2017/pep/population/)
  - Multiple years were used, the above links to the 2017 data. 
  
- **Brewers Association Database:**
  - [Brewers Association Industry Datasets](https://www.brewersassociation.org/statistics-and-data/industry-data-sets/)

## Code References

The code in this project was developed with the assistance of OpenAI's ChatGPT. Nearly all of our team members utilized this tool to some extent as we proceeded with the project. Snippets of code can be found throughout the JavaScript and Jupyter Notebook files. For the database side of things, QuickDB was utilized to generate the ERD and the ensuing schema, included in this repository.

## Contributors

- Eric Janson - Database
- Zachary Cushman - Data pipeline
- Amanda Rolfe - Data display
- Marc Conwell - Data display

Feel free to reach out for any questions or collaboration opportunities.
