![1-bring-home-to-mom-splash.png](https://dbc-devconnect-production.s3.amazonaws.com/uploads/1430363567076/1-bring-home-to-mom-splash.png)

[Bring Home To Mom](http://bringhometomom.herokuapp.com/) is a match-making and date-planning app targeted to parents. Parents create profiles for their children, browse and filter for potential matches, plan dates while communicating with the other child's parents, and split the cost of the upcoming date so everything is prepaid!  

Team Members: Jonathan Berk, Sofie Garden, Kevin Ceballos, Tony Mai

We utilized the Agile development methodology to deliver a complete, feature-full product under a tight 7-day period. We set up the structure/backbone of our app as a team, pair-programmed on challenging features, and worked solo to learn and implement new technologies. When working individually, we focused on discrete vertical slices (separate features) to ensure minimal Git workflow conflicts, and when conflicts arose, we resolved them systematically.

We solidified our knowledge on existing technologies while learning new APIs (Stripe, Twilio, Cloudinary, Rotten Tomatoes, and OMBD).

Technologies/frameworks used include:
* Ruby on Rails
* PostgreSQL
* Javascript
* JQuery
* AJAX
* handlebars.js
* Faye messaging system
* HTML5
* CSS3
* Responsive Grid System
* Stripe API
* Twilio API
* Cloudinary API
* Rotten Tomatoes API
* OMDB API

Product features include:
* Create child profiles
* Smart matching system based on filters and interests
* Autocomplete search
* Dates dashboard
* Design a date page
* Choose a date experience
* Real-time messaging system
* Purchase date experience
* Text notifications
* Responsive design
* Asynchronous updates for best user experience and minimal page reloads


### Screen Grabs
##### 1) Landing Page - Product Overview
![2-bring-home-to-mom-how.png](https://dbc-devconnect-production.s3.amazonaws.com/uploads/1430363567042/2-bring-home-to-mom-how.png)

##### 2) Parent's Dashboard
* Overview of the children ('offspring') you've added to the service, and consolidated list of all the dates you are planning or have planned for them
  * Dates divided into four phases:
    1) Pending -- Incoming date requests requiring your attention
    2) Planning -- Accepted by both parents and in the process of planning; not yet paid
    3) Upcoming -- Fully paid by both parents; children have been notified
    4) Past -- Completed dates
![6-bring-home-to-mom-dashboard.png](https://dbc-devconnect-production.s3.amazonaws.com/uploads/1430363567052/6-bring-home-to-mom-dashboard.png)

##### 3) Potential Matches
* Your children appear on left; matches appear on right
* Select one of your children and adjust search filters to narrow down potential matches
  * Matches are updated on the fly as you adjust criteria; no page reloading required
![3-bring-home-to-mom-matches.png](https://dbc-devconnect-production.s3.amazonaws.com/uploads/1430363567036/3-bring-home-to-mom-matches.png)

#### 4) Dropdown Notifications
* Dropdown menu visible on any page, showing incoming (pending) date requests, and dates still in planning phase
![5-bring-home-to-mom-dropdown.png](https://dbc-devconnect-production.s3.amazonaws.com/uploads/1430363567018/5-bring-home-to-mom-dropdown.png)

##### 5) Detailed Profile View
* View details of a potential match
* Click link to propose a date
![4-bring-home-to-mom-profile.png](https://dbc-devconnect-production.s3.amazonaws.com/uploads/1430363567082/4-bring-home-to-mom-profile.png)

##### 6) Design A Date
* Dashboard for both parents to design the proposed date
* Check status of the date in upper right 
* Scroll down to browse a collection of custom date experiences and upcoming movies
* Chat with the other parent using messaging interface
* Accept invitations, select or change the date experience, confirm your selection, and pay for date, all from this page
  * State is maintained throughout process (e.g. a parent is prevented from purchasing a date until the other parent has confirmed the selection) 

![7-bring-home-to-mom-planning.png](https://dbc-devconnect-production.s3.amazonaws.com/uploads/1430363567048/7-bring-home-to-mom-planning.png)

##### 7) Payment
* Stripe integration allows both parents to split the cost of the selected date
* After both parents have paid, their children are notified of the upcoming date via Twilio MMS message (not shown)
![8-bring-home-to-mom-payment.png](https://dbc-devconnect-production.s3.amazonaws.com/uploads/1430363567030/8-bring-home-to-mom-payment.png)
