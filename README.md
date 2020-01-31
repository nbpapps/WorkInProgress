# DiscountBankApp

This code was written by Niv Ben-Porath

Bank list Screen:
* Shows a grid of banks.
* The information shown will be the Bank name and image. The banks are ordered by Priority value, from high to low
* The Bank list will be created from a static JSON file
* When selecting a bank, the user will be taken to a screen with the Time Series information

Time Series information Screen:
* The banks "skt" value and a defult "timeInterval" value of "1min" are used to populate the Time Series table view


Known issues and bugs
* bank images are sometimes shown under the wrong bank
* data from alphavantage is parsed using keys (and not Codable), due to the fact that the keys in the JSON are random
* their are no error messages shown to the user

Notes:
* UI is implemented in code


Some tests that are added:
* check JSON Parser
* check Bank List Data Source 





