# Saga

Saga is an E-Book reader application to check trending books, reading and reading statistics.

For Authentication - It uses Google OAuth2 Sign In
[Authentication Showcase Video](https://drive.google.com/file/d/1z8D67KlgXp8bqUj20ehpyZ4HiQnIUHKE/view?usp=drive_link)

For Books - It uses Hardcover API for get books and their details
[Books Video](https://drive.google.com/file/d/1x0_2fi64irlBefw3v3IzEf6immROELt3/view?usp=drive_link)

### Tech Stack
- Frontend: Flutter is used for building out the application since it is cross platform (iOS, Android, Desktop and Web) and is performant.
- Backend: TypeScript with Hono server to build authentication and book routes.
- Database: PostgreSQL
- Storage: AWS S3 is used for storage of uploaded E-Book files and secured with permissions
- Server: AWS EC2
- Webhook: AWS Lambda for triggering a webhook what a file is uploaded to S3

### Application UI
<div style="display: inline;">
  <img src="https://github.com/bhaswanth-isani/saga/blob/main/assets/home.PNG?raw=true" width="200px">
  <img src="https://github.com/bhaswanth-isani/saga/blob/main/assets/library.PNG?raw=true" width="200px">
  <img src="https://github.com/bhaswanth-isani/saga/blob/main/assets/explore.PNG?raw=true" width="200px">
  <img src="https://github.com/bhaswanth-isani/saga/blob/main/assets/book.PNG?raw=true" width="200px">
  <img src="https://github.com/bhaswanth-isani/saga/blob/main/assets/reader.PNG?raw=true" width="200px">
</div>
