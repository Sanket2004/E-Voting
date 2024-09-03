# E-Voting System

**E-Voting** is a web application designed to allow users to vote for their next CEO securely and efficiently. The application provides a streamlined user experience, ensuring that only authenticated users can participate in the voting process.

## Features

- **User Authentication**: Redirects authenticated users directly to the dashboard.
- **Secure Voting**: Ensures only registered users can access the voting process.
- **Responsive Design**: User-friendly interface that adapts to various screen sizes.
- **Bootstrap Icons Integration**: Uses Bootstrap Icons for enhanced UI/UX.
- **Informative Landing Page**: Provides users with details about the voting process and a brief introduction.

## Technologies Used

- **Java (JSP)**: Backend logic and session management.
- **HTML/CSS**: Structuring and styling the user interface.
- **Bootstrap Icons**: For rich, scalable vector icons.
- **JavaScript**: For any client-side dynamic behavior.
- **Tomcat Server**: Application deployment.

## Project Structure

```plaintext
E-Voting/
│
├── src/
│   ├── main/
│   │   ├── webapp/
│   │   │   ├── WEB-INF/
│   │   │   │   └── web.xml
│   │   │   ├── index.jsp
│   │   │   ├── loginPage.jsp
│   │   │   ├── dashboard.jsp
│   │   │   ├── style.css
│   │   │   └── ...
│   │   └── java/
│   │       └── ... (Java classes if any)
│   └── ...
└── ...
```

## Setup and Installation

1. **Clone the Repository**:
    ```bash
    git clone https://github.com/Sanket2004/e-voting.git
    cd e-voting
    ```

2. **Configure the Project**:
   - Make sure your project structure follows the standard Maven or Gradle setup if you’re using one.
   - Ensure the `web.xml` is correctly configured in `WEB-INF`.

3. **Run the Application**:
   - Deploy the application on a Tomcat server.
   - Open a web browser and go to `http://localhost:8080/ApnaCanteen`.

4. **Usage**:
   - On the login page, enter your role, college ID, and password.
   - If you are a new user, click "Register" and fill in the required information.

## Contributing

If you'd like to contribute to the project, feel free to fork the repository and submit a pull request. Any contributions, such as bug fixes, feature enhancements, or general improvements, are welcome!

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact

For any questions or feedback, please reach out at:

- **Email**: sanketbanerjee.2004@gmail.com
- **Phone**: 08348252536
