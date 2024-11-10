import yfinance as yf
import pandas as pd
from datetime import datetime, timedelta

def get_stock_price(symbol, start_date, end_date):
    try:
        stock_data = yf.download(symbol, start=start_date, end=end_date)
        return stock_data['Close'], stock_data['Open']
    except Exception as e:
        print(f"Failed download for {symbol}: {e}")
        return None, None

def compare_friday_monday_prices(stock_symbol, friday_date, days_to_next_monday=3):
    friday_closing_price, _ = get_stock_price(stock_symbol, friday_date, friday_date)
    
    monday_date = friday_date + timedelta(days=days_to_next_monday)
    _, monday_opening_price = get_stock_price(stock_symbol, monday_date, monday_date)

    return friday_closing_price, monday_opening_price

def main():
    stocks = {
        'AMD': 'AMD'
    }

    # Specify the date range for the past year
    end_date = datetime.today()
    start_date = end_date - timedelta(days=365)

    # Initialize variables to store total and count for AMD percent difference
    total_percent_difference = 0
    amd_count = 0

    # Iterate over each Friday within the date range
    current_date = start_date
    while current_date <= end_date:
        # Check if the current day is a Friday (weekday() returns 4 for Friday)
        if current_date.weekday() == 4:
            for stock_name, stock_symbol in stocks.items():
                if stock_name == 'AMD':
                    friday_closing_price, monday_opening_price = compare_friday_monday_prices(stock_symbol, current_date)

                    if friday_closing_price is not None and monday_opening_price is not None \
                            and not friday_closing_price.empty and not monday_opening_price.empty:
                        percent_difference = ((monday_opening_price.iloc[0] - friday_closing_price.iloc[0]) / friday_closing_price.iloc[0]) * 100

                        # Accumulate total percent difference and increment count for AMD
                        total_percent_difference += percent_difference
                        amd_count += 1

    # Calculate the total effect of the weekend on AMD
    if amd_count > 0:
        average_percent_difference = total_percent_difference / amd_count
        print(f"Total Effect of the Weekend on AMD: {average_percent_difference:.2f}%")
    else:
        print("No data available for AMD in the specified date range.")

if __name__ == "__main__":
    main()