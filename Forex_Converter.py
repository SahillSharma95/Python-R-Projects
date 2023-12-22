

#***********************************************************************************************#
# Tool which will provide you with the exchange rate for currencies provided in the dictionary
# Created by Sahill Sharma - 20/12/2023
#***********************************************************************************************#


from forex_python.converter import CurrencyRates
import pandas as pd

y = CurrencyRates()
curr = y.get_rates('')
print(curr)

for key in curr.keys():
    print(key)


curr_input = input("Please enter your currency code here (e.g. AUD, USD): ")


if curr_input not in curr:
    while curr_input not in curr:
        print('Not found, please re-enter currency')
        curr_input = input("Please enter your currency code here (e.g. AUD, USD): ")

conv_input = input("Please enter the currency you would like to convert to: ")
if conv_input not in curr:
    while conv_input not in curr:
        print('Currency to convert to not found on record. Please select a valid currency from the above list')
        conv_input = input("Please enter the currency you would like to convert to: ")

try:
    curr_amt = float(input("Please enter the amount to be converted: "))
except ValueError:
    print('Invalid input. Please enter a floating number for the currency')
    curr_amt = float(input("Please enter the amount to be converted: "))


c = CurrencyRates()
x = c.get_rates(curr_input)

for key, value in x.items():
        if key == conv_input:
            print(f'The converted amount in {conv_input} is: ', round((curr_amt*value),2),
            'at the current exchange rate of: ', round(value,2))



# print(type(x))


# if conv_input not in curr:
#     while conv_input not in curr:
#         print('Currency to convert to not found on record. Please select a valid currency from the above list')
#         conv_input = input("Please enter the currency you would like to convert to: ")
# else:
#     for key, value in x.items():
#         if key == conv_input:
#             print(f'The converted amount in {conv_input} is: ', round((curr_amt*value),2),
#             'at the current exchange rate of: ', round(value,2))


   


