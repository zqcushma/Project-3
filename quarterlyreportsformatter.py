import os
import pandas as pd
import numpy as np
import openpyxl

# Obtain the absolute path to the directory containing the script
script_directory = os.path.dirname(os.path.abspath(__file__))
print(f"Script directory: {script_directory}")

# Use the script directory as the directory containing your Excel files
directory = script_directory

# List all files in the directory for debugging
print("Files in directory:")
for file in os.listdir(directory):
    print(file)

# New directory for the output CSV file
output_directory = os.path.join(directory, 'Processed_CSV')
if not os.path.exists(output_directory):
    os.makedirs(output_directory)

# Custom column names, including 'StateID' for Cell A11
custom_column_names = ['StateID', 'TotalProd', 'TaxableBottlesCansProd', 
                       'TaxableKegsProd', 'TaxablePremUseProd', 'TaxFreeExportProd', 
                       'TaxFreePremUseProd', 'StocksOnHand']

# State name to abbreviation mapping
state_abbreviations = {
    'Alabama': 'AL', 'Alaska': 'AK', 'Arizona': 'AZ', 'Arkansas': 'AR', 'California': 'CA', 
    'Colorado': 'CO', 'Connecticut': 'CT', 'Delaware': 'DE', 'Florida': 'FL', 'Georgia': 'GA', 
    'Hawaii': 'HI', 'Idaho': 'ID', 'Illinois': 'IL', 'Indiana': 'IN', 'Iowa': 'IA', 
    'Kansas': 'KS', 'Kentucky': 'KY', 'Louisiana': 'LA', 'Maine': 'ME', 'Maryland': 'MD', 
    'Massachusetts': 'MA', 'Michigan': 'MI', 'Minnesota': 'MN', 'Mississippi': 'MS', 
    'Missouri': 'MO', 'Montana': 'MT', 'Nebraska': 'NE', 'Nevada': 'NV', 'New Hampshire': 'NH', 
    'New Jersey': 'NJ', 'New Mexico': 'NM', 'New York': 'NY', 'North Carolina': 'NC', 
    'North Dakota': 'ND', 'Ohio': 'OH', 'Oklahoma': 'OK', 'Oregon': 'OR', 'Pennsylvania': 'PA', 
    'Rhode Island': 'RI', 'South Carolina': 'SC', 'South Dakota': 'SD', 'Tennessee': 'TN', 
    'Texas': 'TX', 'Utah': 'UT', 'Vermont': 'VT', 'Virginia': 'VA', 'Washington': 'WA', 
    'West Virginia': 'WV', 'Wisconsin': 'WI', 'Wyoming': 'WY', 'District of Columbia': 'DC'
}

# List to hold data from each Excel file
dataframes = []

for filename in os.listdir(directory):
    if filename.endswith('.xlsx'):
        file_path = os.path.join(directory, filename)
        workbook = openpyxl.load_workbook(file_path)
        sheet_name = workbook.active.title
        workbook.close()

        parts = sheet_name.split('_')
        year = parts[-1]
        quarter = 'Q' + parts[-2].split()[-1]

        # Read the Excel file with `converters` to handle mixed data types
        df = pd.read_excel(file_path, skiprows=10, nrows=52, header=None, 
                           converters={i: str for i in range(1, 8)})

        df.columns = custom_column_names
        df['StateID'] = df['StateID'].map(state_abbreviations)
        df.replace(['-', 'n/a', 'missing'], np.nan, inplace=True)

        # Convert each column to numeric, coercing errors
        for col in df.columns[1:]:
            df[col] = pd.to_numeric(df[col], errors='coerce')

        df.insert(1, 'Year', year)
        df.insert(2, 'Quarter', quarter)
        
        # Remove rows where 'StateID' is NaN
        df = df[df['StateID'].notna()]

        dataframes.append(df)

if not dataframes:
    print("No valid Excel files found or all files are empty.")
else:
    combined_df = pd.concat(dataframes)
    output_file_path = os.path.join(output_directory, 'combined_quarterly_data.csv')
    combined_df.to_csv(output_file_path, index=False)
    print("CSV file created successfully.")