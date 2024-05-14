import pandas as pd

def search_movies(df, criteria):
    try:
        filtered_df = df
        for key, value in criteria.items():
            if value:
                if key == "title":
                    filtered_df = filtered_df[filtered_df['Title'].str.contains(value, case=False)]
                elif key == "year":
                    filtered_df = filtered_df[filtered_df['Year'] == int(value)]
                elif key == "director":
                    filtered_df = filtered_df[filtered_df['Director'].str.contains(value, case=False)]
                elif key == "genre":
                    filtered_df = filtered_df[filtered_df['Genre'].str.contains(value, case=False)]
        return filtered_df
    except Exception as e:
        print("An error occurred during search:", e)
        return None

def main():
    # Specify the filename here
    filename = "data.csv"

    try:
        df = pd.read_csv(filename)
    except FileNotFoundError:
        print(f"File '{filename}' not found.")
        return

    # Prompt user for search criteria
    search_criteria = {}
    search_criteria["title"] = input("Enter movie title (press Enter to skip): ").strip()
    search_criteria["year"] = input("Enter release year (press Enter to skip): ").strip()
    search_criteria["director"] = input("Enter director name (press Enter to skip): ").strip()
    search_criteria["genre"] = input("Enter genre (press Enter to skip): ").strip()

    # Search for movies based on criteria
    filtered_df = search_movies(df, search_criteria)
    if filtered_df is not None and not filtered_df.empty:
        print("\nSearch Results:")
        print(filtered_df)
    else:
        print("\nNo movies found matching the search criteria.")

if __name__ == "__main__":
    main()
