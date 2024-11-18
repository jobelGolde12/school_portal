<template>
    <div>
        <header class="bg-primary text-white text-center py-4">
        <h1>About Our School Portal</h1>
    </header>
    <main class="container my-5">
        <section class="text-center mb-4">
            <h2>Project Overview</h2>
            <p class="lead">
                Welcome to our School Portal! This web-based system is a comprehensive platform designed to manage student information efficiently and securely. With cutting-edge technologies and robust security mechanisms, our portal ensures data confidentiality, integrity, and availability.
            </p>
        </section>

        <section class="mb-5">
            <h2>Our Objectives</h2>
            <p>
                Our primary objective is to develop a dynamic and secure web application that interacts with a database to streamline student information management. We prioritize the implementation of essential security features, including:
            </p>
            <ul>
                <li><strong>Authentication and Authorization:</strong> Role-based access control and secure user authentication.</li>
                <li><strong>Password Encryption:</strong> Safe handling of sensitive data with hashed passwords.</li>
                <li><strong>SQL Injection Prevention:</strong> Use of prepared statements and input validation.</li>
                <li><strong>Access Control:</strong> Restriction of permissions based on user roles.</li>
            </ul>
        </section>

        <section class="mb-5">
            <h2>Features of the School Portal</h2>
            <ul>
                <li>Seamless user registration and login processes.</li>
                <li>CRUD operations for managing student data.</li>
                <li>Secure role-based access for Admins, Instructors, and Students.</li>
                <li>Error handling for smooth user experience.</li>
                <li>Intuitive and responsive user interface for easy navigation.</li>
            </ul>
        </section>

        <section>
            <h2>Security Mechanisms</h2>
            <p>Our School Portal integrates the following security measures to safeguard data:</p>
            <div class="row">
                <div class="col-md-6">
                    <h5>Password Security</h5>
                    <ul>
                        <li>Secure password hashing and storage.</li>
                        <li>Password comparison during authentication.</li>
                    </ul>
                </div>
                <div class="col-md-6">
                    <h5>Database Protection</h5>
                    <ul>
                        <li>Parameterized queries to prevent SQL injection.</li>
                        <li>Role-based database privileges for users.</li>
                    </ul>
                </div>
            </div>
        </section>
    </main>

    <footer class="bg-dark text-white text-center py-3">
        <p>&copy; 2024 School Bonga Portal Project. All rights reserved.</p>
    </footer> 
    </div>
</template>
