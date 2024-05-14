import pandas as pd
import csv

def read_csv(filename):
    try:
        df = pd.read_csv(filename)
        return df
    except FileNotFoundError:
        print("File not found.")
        return None
    except Exception as e:
        print("An error occurred:", e)
        return None

def main():
    filename = input("Enter the name of the CSV file: ")
    data = read_csv(filename)
    if data is not None:
        print("Data from CSV:")
        print(data)
main()
