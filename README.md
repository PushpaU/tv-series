**TV Series Application using flutter :**

**Features**

**API Connection**
The application connects to an API to fetch data for popular and top-rated TV shows.
Data fetched includes details such as the series' name, overview, first air date, rating, and number of episodes.


**1.Popular TV Shows**
A carousel is used to display the popular TV shows, providing an interactive and visually appealing way for users to browse through the options.
The SingleChildScrollView widget is utilized to ensure smooth scrolling of the carousel.

**2.Top Rated Shows**
Presented in a ListView format for easy viewing of the top-rated series.

**3.Snapshot Handling**
Snapshots are employed to verify the state of the data being fetched.
Based on the snapshot state, the UI is updated accordingly:
  - Empty State: Displays a message indicating that no data is available.
  - Error State: Shows an error message if there is an issue with the API or data fetching.
  - Data State: Renders the fetched data on the UI.

**4.Detailed Series Information**
A ListView is used to display the top-rated TV shows, allowing users to see a comprehensive list of high-rated series.
Upon selecting a specific series, users are navigated to the details page.
The details page provides comprehensive information about the selected series, including:
Name
Overview
First air date
Rating
Number of episodes
Additional relevant details

**5.Search Functionality**
A search bar is available on the home screen to filter and find series quickly.

**6.Loading and Error Handling**
A CircularProgressIndicator is displayed while data is loading.
Robust error handling is implemented to ensure that any API errors are shown on the UI, providing a seamless user experience.

ScreenShots : 
![image](https://github.com/user-attachments/assets/db79a6cb-5507-4e5e-ad15-256e3e1070e4)
![image](https://github.com/user-attachments/assets/deb3442d-15dd-4bde-838e-c17718e0c7ae)
