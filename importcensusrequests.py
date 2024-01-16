import requests
import csv
import os

api_key = 'ad3d154de7e3aa3845489654974b93a74ede4901'

# Dictionary for converting state FIPS code to state abbreviation
fips_to_state = {
    "01": "AL", "02": "AK", "04": "AZ", "05": "AR", "06": "CA",
    "08": "CO", "09": "CT", "10": "DE", "11": "DC", "12": "FL",
    "13": "GA", "15": "HI", "16": "ID", "17": "IL", "18": "IN",
    "19": "IA", "20": "KS", "21": "KY", "22": "LA", "23": "ME",
    "24": "MD", "25": "MA", "26": "MI", "27": "MN", "28": "MS",
    "29": "MO", "30": "MT", "31": "NE", "32": "NV", "33": "NH",
    "34": "NJ", "35": "NM", "36": "NY", "37": "NC", "38": "ND",
    "39": "OH", "40": "OK", "41": "OR", "42": "PA", "44": "RI",
    "45": "SC", "46": "SD", "47": "TN", "48": "TX", "49": "UT",
    "50": "VT", "51": "VA", "53": "WA", "54": "WV", "55": "WI",
    "56": "WY"
}

# Function to fetch population data for a given year
def get_population_data(year):
    if year == 2020:
        # Special handling for 2020 Census data
        variable = 'DP1_0001C'
        url = f'https://api.census.gov/data/2020/dec/dp?get={variable}&for=state:*&key={api_key}'
    else:
        # General handling for other years
        variable = 'POP' if year != 2021 else 'POP_2021'
        url = f'https://api.census.gov/data/{year}/pep/population?get={variable}&for=state:*&key={api_key}'

    response = requests.get(url)
    if response.status_code == 200:
        return response.json()
    else:
        print(f"Failed to retrieve data for {year}: {response.text}")
        return None

script_dir = os.path.dirname(os.path.abspath(__file__))
csv_file_path = os.path.join(script_dir, '2017_2023_population_data.csv')

with open(csv_file_path, 'w', newline='') as file:
    writer = csv.writer(file)
    writer.writerow(['Year', 'StateID', 'Population'])

    for year in [2017, 2018, 2019, 2020, 2021]:  # Loop through the specified years
        data = get_population_data(year)
        if data:
            for row in data[1:]:
                population = row[0]
                state_fips = row[1]
                state_abbr = fips_to_state.get(state_fips)

                if state_abbr:  # Write only if state abbreviation is found
                    writer.writerow([year, state_abbr, population])

print(f"Population data for 2017-2021 exported to {csv_file_path}")