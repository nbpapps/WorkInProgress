# Work In Progress

This code was written by Niv Ben-Porath

My journey of implementing MVVM, POP and other aspect of iOS dev
You can read abount it here - https://link.medium.com/9j7w6Lwxd5

MVVM:
* Updated IntradayViewController to use a ViewModel

Navigator:
* The navigation between screens is handled by a Flow Controller

View Logic:
* Intraday screen is split up to two controllers - logic (for fetching the data for the requested intraday) and view (for redering the screen for each state - loading,present and error)

Known issues and bugs
* bank images are sometimes shown under the wrong bank
* data from alphavantage is parsed using keys (and not Codable), due to the fact that the keys in the JSON are random
* their are no error messages shown to the user


Notes:
* UI is implemented in code


Some tests that are added:
* check JSON Parser
* check Bank List Data Source 





