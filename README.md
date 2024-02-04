# MVVM-Demo-with-Networking-and-Image-Loading
This GitHub repository showcases a simple iOS application built using the Model-View-ViewModel (MVVM) architectural pattern in Swift.<br>The app fetches product data from a fake store API, utilizing URLSession for networking and Kingfisher for efficient image loading.<br>
The code is organized into clean and modular components, including an API manager, view model, and a custom table view cell.

*Features:<br>
-MVVM architecture<br>
-Networking using URLSession<br>
-Image loading with the Kingfisher library<br>
-UITableView for displaying product information<br>
-Error handling and loading indicators<br>

*Components:<br>
-APIManager: A singleton class responsible for handling network requests and fetching product data from a fake store API.<br>
-ProductViewModel: Manages the presentation logic for the product data, including loading indicators and error handling.<br>
-ProductTableViewCell: A custom UITableViewCell displaying individual product information, with image loading powered by Kingfisher.<br>
-ProductListViewController: The main view controller that configures the table view, initializes the view model, and observes events.<br>
-Product: A struct representing product information, conforming to the Decodable protocol.<br>
-Rating: A struct representing product rating information, also conforming to the Decodable protocol.<br>
-Constant: An enum containing constants, including the API URL.
