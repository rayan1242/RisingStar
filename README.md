I’ve developed a ranking system for artists based on user impressions and the number of concerts they’ve held. The core idea is to engage rising artists and give them a chance to gain fame by competing with other artists on the app. Here’s an overview of how I built it:

Core Idea:
The goal is to make the app appealing to rising artists by giving them a platform to compete with others and gain visibility. Here’s how we do it:

Concert Code/Link: When an artist starts a concert, they will generate a unique code or link that can be shared by the artist’s fans. The artist will ask their fans to embed the code/link in their social media posts and stories. These posts and stories will then drive app activity as users engage with the content.

Fans will post the code/link on platforms like Instagram, Twitter, or Facebook, and this activity will directly increase the artist’s visibility and user impressions in the app.
Web Scraping for Social Media Data: To capture the impact of these posts and stories, we will scrape social media platforms (like Instagram, Twitter, etc.) for mentions of the code/link. The idea is to track how many times the code is embedded or shared, providing a clear indication of the artist's online buzz and engagement.

Engagement on the App: The app will collect this data, and user impressions (the number of times the code has been used) will contribute to the artist’s ranking. The more times the code is shared and interacted with, the higher the user impressions will be, boosting their rank.

Short.io Live Data Integration:
As a starting point for gathering data on user engagement, I’ve integrated Short.io live data into the app. Short.io is a URL shortening service that provides real-time analytics on link usage, including click data and geographic information of the users interacting with the link.

Here’s how I’ve used Short.io data:

Tracking Clicks for Concert Links: When an artist generates a concert link (unique to their concert), it’s shortened using Short.io. The app then collects live click data from Short.io’s API, including the number of times the link is clicked, as a preliminary measure of user impressions.

Analyzing User Engagement: The click data from Short.io helps in understanding how much engagement the artist is getting based on their concert code/link. This data is stored in the app, and used for ranking the artists.

Building Towards Web Scraping: The live data from Short.io is just the beginning step in gathering social media engagement. The ultimate goal is to scale this by using web scraping techniques to capture mentions of the concert link/code across various social media platforms, providing an even broader view of an artist’s reach.

This integration with Short.io gives a solid foundation to track real-time engagement, which will eventually be expanded upon by scraping social media platforms for broader data, capturing a more holistic view of an artist's influence.

Ranking System:
User Impressions & Concerts: Artists are ranked based on a combination of:
User Impressions (how many times their concert code has been used in social media posts and stories),
Number of Concerts they’ve had.
The formula for ranking artists is the ratio of user impressions to concerts, which ensures that artists who generate a lot of engagement with fewer concerts can still rank highly.
Why It Works for Rising Artists:
By incorporating both social media buzz (via web scraping) and app activity (via the concert code), this system is designed to appeal to up-and-coming artists. It allows them to gain visibility not just through their concerts, but by seeing how much their audience engages with their content on social media.

How It Works:
When an artist starts a concert, they generate a unique code/link on the app (using Short.io for click tracking).
The artist shares this code/link with their fans, asking them to embed it in their social media posts and stories.
Short.io collects click data on how many times the code is used, and this user impression data is integrated into the app.
Eventually, web scraping will be used to track how many times the code/link is mentioned on social media platforms, giving a fuller picture of the artist’s reach.
The rankings are then dynamically updated based on impressions and concerts, and fans can see the artist's rank.
User Interface:
I’ve designed a dark-themed UI with green accents, similar to apps like Spotify, to make it sleek and visually appealing.
Each artist’s rank, name, concert count, and impressions are clearly displayed in a card format, giving users a detailed view of each artist's standing.
Artist Motivation:
This system is designed to engage rising artists and encourage them to use the app. By leveraging the power of social media, artists can track their influence and engagement in real-time, and fans can help boost their rank simply by embedding the concert code/link in their social posts. This gamification element is meant to attract more artists, as it provides them with an opportunity to gain fame, show their influence, and compete with others.

