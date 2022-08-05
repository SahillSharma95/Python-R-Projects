# Temperature converter from C to F and F to C depending on the user input

from sys import exit

x = str(input('Please specify the degree type you wish to obtain (e.g. C/F) - not case sensitive: '))

for val in x:
    if val == 'f':
        continue
    elif val == 'F':
        continue
    elif val == 'c':
        continue
    elif val == 'C':
        continue
    else:
        print("This is not a valid degree metric. Please enter C or F. Program will now terminate.")
        #x = str(input('Please specify the degree type you wish to obtain (e.g. C/F) - not case sensitive: '))
        exit()

y = input('Please enter your temperature in float/decimal form: ')

try:
    y_float = (float(y))
except ValueError:
    print("This value is not a float. Program will now terminate")
    #y = input('Please enter your temperature in float/decimal form: ')
    #y_float = (float(y))
    exit()

C_formula = ((5/9) * (y_float - 32))
F_formula = (y_float * (9/5) + 32)

# while type(y) == float:

if x == 'c':
    print('The equivalent temp in C is: ', str(round(C_formula,2)))
        # break
elif x == 'f':
    print('The equivalent temp in F is: ', str(round(F_formula,2)))
        # break
elif x == 'C':
    print('The equivalent temp in C is: ', str(round(C_formula,2)))
        # break
elif x == 'F':
    print('The equivalent temp in F is: ', str(round(F_formula,2)))
        # break
else:
    print('This is not valid input. Please enter a temperature in numeric format')
    exit()

