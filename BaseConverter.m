function BaseConverter()
%the main idea of this coding is first change the number from base-n to base-10.
%then change the base-10 number to base-m.
%fianlly display the result.

% Resquest for the integer n
n = input('Enter the integer n (2 ≤ n ≤ 10): ');

% Check if n is valid
if (n < 2)||(n > 10)
    error('Invalid input. n should be in the range 2 ≤ n ≤ 10.');
end

% Resquest for the number in base n
baseNNumber = input('Enter the number in base-n: ', 's');

% Determine whether the number entered is in base-n
if ~all(ismember(baseNNumber, '0':char('0' + n - 1)))
    error('Invalid number for the base has been given.');
end

% Change baseNNumber to base 10
base10Number = base2dec(baseNNumber, n);

% Resquest for the base m
m = input('Enter the integer m (2 ≤ m ≤ 10): ');

% Check if m is valid
if (m < 2)||(m > 10)
    error('Invalid input. m should be between 2 and 10.');
end

% Change base10Number to base m
baseMNumber = dec2base(base10Number, m);

% Display the result
fprintf('Your number in base %d is: %s\n', m, baseMNumber);
end
