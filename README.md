# FetchMobileTakeHomeProject

### Steps to Run the App
Run as normal XCode iOS project with the exception of testing. For testing, please change plan to "FetchMobileTests". This was created due to IDE issues that were resolved this way to save time.

### Focus Areas: What specific areas of the project did you prioritize? Why did you choose to focus on these areas?
The main areas of focus, with the time allowed, were the accessibility and readability of the application. With the focus on accessibility, VoiceOver was explicitly considered and tested through the perspective of 508 requirements of the federal government from current work experience.
In regards to the readability, all functions and classes were appropriately compartmentalized and dependency injection was implemented where thought necessary, given the scale of the application.

### Time Spent: Approximately how long did you spend working on this project? How did you allocate your time?
This project was worked on over the course of multiple days due to daily time restraints. Approximately 5 hours was spent building the app with most of the time being spent on the domain logic and the related "readability" of the code. 
UI and accessibility testing took the least amount of time, out of choice, to focus on business logic and testing.

To put in the perspective of percentages:
    - Logic and "Clean Code"        : 70%
        - Concurrency           : 20%
        - Mocking               : 15%
        - Unit Test Development : 15%
        - View Model Logic      : 20%
    - UI Design                     : 15%
    - UI Development and Refinement : 5%
    - Accessibility and Testing     : 10%
 
### Trade-offs and Decisions: Did you make any significant trade-offs in your approach?
With the consideration of how long the project **should** take, there were a couple trade-offs made. It was thought best to spend the least amount of time on UI design to ensure there was enough time for functionality and testing.
Additional features such as filtering and a search text field were also omitted to save time however, the intention was there.

### Weakest Part of the Project: What do you think is the weakest part of your project?
In reference to the above answer, UI and UX design is the weakest part of the project. It would have been ideal to consider more pleasing and dynamic color contrasts for the background and buttons. 
In hindsight, the disposition of each recipe in the ScrollView could have been more aesthetically pleasing as well. 
Additionally, adding more UI functionality like filtering, searching, a proper progress view, and network accessibility alerts and communications would greatly improve the UX of the app with larger data inputs. 

There are other aspects of the project that could be refined to enhance cohesion in a team environment, scope expansion and flexibility, and health in an archival state. However, UI and UX is the weakest here.

### External Code and Dependencies: Did you use any external code, libraries, or dependencies?
SwiftSoup and Kingfisher. SwiftSoup is not explicitly purposed for JSON-only parsing, however it is the library I have the most familiarity with for these purposes.
Also, with the considerations of time constraints, it was thought best to use the fastest tool for the job. A similar philosophy justified the use of the Kingfisher library.
Upon assuming the most time consuming items for this project, it was thought best to employ the Kingfisher library to not "reinvent the wheel" and ensure stability with the app instead. 

### Additional Information: Is there anything else we should know? Feel free to share any insights or constraints you encountered.
Working on this project over multiple days simulated a team environment in which readability was imperative, however this was accompanied by the associated time restraints ensuring this.
Regarding constraints, the anomalous IDE issue with unit testing aforementioned in the first paragraph required a non-negligible amount of troubleshooting, however it is the only relatively significant constraint to mention. 