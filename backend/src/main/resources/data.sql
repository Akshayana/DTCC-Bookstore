INSERT INTO roles (name) VALUES ('ADMIN'), ('SELLER'), ('CUSTOMER');

-- Admin
INSERT INTO users (username, email, password, role_id) VALUES
('Admin', 'admin@bookstore.com', '$2a$12$NQHo9UKK0NeMpo0EybEELe0zjvE6wsoEM/f1aPeOAuefPW2TqV5J6', 1);

-- Sellers
INSERT INTO users (username, email, password, role_id) VALUES
('Maddy & Brothers', 'seller1@store.com', '$2a$12$CvivMzF.bxGo0LPAXMOHY.a0TYsIRAfSyBvbql98e7QXXQ74RNz8.', 2),
('Kishore Kanna publishers', 'seller2@store.com', '$2a$12$CvivMzF.bxGo0LPAXMOHY.a0TYsIRAfSyBvbql98e7QXXQ74RNz8.', 2),
('Sasha prints', 'seller3@store.com', '$2a$12$CvivMzF.bxGo0LPAXMOHY.a0TYsIRAfSyBvbql98e7QXXQ74RNz8.', 2),
('Poppy Publishers', 'seller4@store.com', '$2a$12$CvivMzF.bxGo0LPAXMOHY.a0TYsIRAfSyBvbql98e7QXXQ74RNz8.', 2),
('Zeke Press', 'seller5@store.com', '$2a$12$CvivMzF.bxGo0LPAXMOHY.a0TYsIRAfSyBvbql98e7QXXQ74RNz8.', 2);

-- Customers
INSERT INTO users (username, email, password, role_id) VALUES
('Alice', 'alice@gmail.com','$2a$12$sJdpBgXu9KT8RZaguNaQYedj9havHSJUSwqMabaFUD0AVmX4ylXgW',3),
('Bob', 'bob@gmail.com','$2a$12$sJdpBgXu9KT8RZaguNaQYedj9havHSJUSwqMabaFUD0AVmX4ylXgW',3),
('Charlie', 'charlie@gmail.com','$2a$12$sJdpBgXu9KT8RZaguNaQYedj9havHSJUSwqMabaFUD0AVmX4ylXgW',3),
('David', 'david@gmail.com','$2a$12$sJdpBgXu9KT8RZaguNaQYedj9havHSJUSwqMabaFUD0AVmX4ylXgW',3),
('Emma', 'emma@gmail.com','$2a$12$sJdpBgXu9KT8RZaguNaQYedj9havHSJUSwqMabaFUD0AVmX4ylXgW',3),
('Frank', 'frank@gmail.com','$2a$12$sJdpBgXu9KT8RZaguNaQYedj9havHSJUSwqMabaFUD0AVmX4ylXgW',3),
('Grace', 'grace@gmail.com','$2a$12$sJdpBgXu9KT8RZaguNaQYedj9havHSJUSwqMabaFUD0AVmX4ylXgW',3),
('Hannah', 'hannah@gmail.com','$2a$12$sJdpBgXu9KT8RZaguNaQYedj9havHSJUSwqMabaFUD0AVmX4ylXgW',3),
('Ivan', 'ivan@gmail.com','$2a$12$sJdpBgXu9KT8RZaguNaQYedj9havHSJUSwqMabaFUD0AVmX4ylXgW',3),
('Julia', 'julia@gmail.com','$2a$12$sJdpBgXu9KT8RZaguNaQYedj9havHSJUSwqMabaFUD0AVmX4ylXgW',3),
('Kevin', 'kevin@gmail.com','$2a$12$sJdpBgXu9KT8RZaguNaQYedj9havHSJUSwqMabaFUD0AVmX4ylXgW',3),
('Linda', 'linda@gmail.com','$2a$12$sJdpBgXu9KT8RZaguNaQYedj9havHSJUSwqMabaFUD0AVmX4ylXgW',3),
('Mike', 'mike@gmail.com','$2a$12$sJdpBgXu9KT8RZaguNaQYedj9havHSJUSwqMabaFUD0AVmX4ylXgW',3),
('Nora', 'nora@gmail.com','$2a$12$sJdpBgXu9KT8RZaguNaQYedj9havHSJUSwqMabaFUD0AVmX4ylXgW',3),
('Oliver', 'oliver@gmail.com','$2a$12$sJdpBgXu9KT8RZaguNaQYedj9havHSJUSwqMabaFUD0AVmX4ylXgW',3);

INSERT INTO books (title, author, category, price, stock_quantity, seller_id, image_url) VALUES
('The Silent Patient', 'Alex Michaelides', 'Thriller', 499.00, 20, 2, 'https://critic.thhsclassic.com/wp-content/uploads/2022/12/69249081977__1B7AF782-D325-4373-876C-2F8414F324CF-675x900.jpg'),
('Atomic Habits', 'James Clear', 'Self-help', 399.00, 30, 2, 'https://jamesclear.com/wp-content/uploads/2025/06/atomic-habits-dots.png'),
('Ikigai', 'Héctor García', 'Philosophy', 350.00, 25, 2, 'https://cdn.shopify.com/s/files/1/1163/9680/products/Ikigai_Book.jpg?v=1536585232'),
('The Alchemist', 'Paulo Coelho', 'Fiction', 299.00, 40, 3, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSz_LjCHPGl5Xm2tO2TiNf01LRqbvUBRT_5gQ&s'),
('1984', 'George Orwell', 'Dystopian', 450.00, 35, 3, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDeh-Rh6Xmg9cN2g8p8Sdl4m8KDlu1hTpjmg&s'),
('To Kill a Mockingbird', 'Harper Lee', 'Classic', 420.00, 22, 3, 'https://bfbooks.com/cdn/shop/files/To_Kill_a_Mockingbird_Harper_Lee_processed.jpg?v=1751405957&width=546'),
('The Psychology of Money', 'Morgan Housel', 'Finance', 380.00, 50, 3, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5YBdT06AzpkwlDPK4pSZFMjjaglEJqSQzYQ&s'),
('Deep Work', 'Cal Newport', 'Productivity', 410.00, 25, 4, 'https://thewriting.dev/content/images/2021/08/CalNewportDeepWork.jpg'),
('Can’t Hurt Me', 'David Goggins', 'Biography', 499.00, 30, 4, 'https://bookwormsdenn.com/cdn/shop/files/17.png?v=1711011105'),
('Rich Dad Poor Dad', 'Robert Kiyosaki', 'Finance', 390.00, 40, 4, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQg5PAv5-ESxj5bypvhNjzFZP6W_JWcL1HnMA&s'),
('Sapiens', 'Yuval Noah Harari', 'History', 520.00, 20, 5, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0FxCfM-_t-RbeO2sctksNPeHO2cPndNQPLg&s'),
('Becoming', 'Michelle Obama', 'Biography', 480.00, 18, 5, 'https://icrrd.com/public/media/15-05-2021-133510becoming-michelle-obama.jpg'),
('Educated', 'Tara Westover', 'Biography', 450.00, 22, 5, 'https://www.adorebooks.in/wp-content/uploads/2024/08/Educated-Tara-Westover.jpg'),
('The Subtle Art of Not Giving a F*ck', 'Mark Manson', 'Self-help', 399.00, 28, 6, 'https://www.apnibook.in/wp-content/uploads/2023/09/Untitled-design-2022-06-23T194849.247.jpg'),
('The Power of Now', 'Eckhart Tolle', 'Spirituality', 420.00, 30, 6, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLLcqnfRpkOoz6wN3wP_ckh4J47WwOLxb0Ng&s'),
('Think Like a Monk', 'Jay Shetty', 'Self-help', 410.00, 35, 6, 'https://www.frontlist.in/storage/uploads/2021/06/BeLessAwful.com-Jay-Shetty_Think-Like-a-Monk-book.jpg'),
('The 5 AM Club', 'Robin Sharma', 'Motivational', 390.00, 40, 2, 'https://i0.wp.com/leoberrygifts.com/wp-content/uploads/2023/10/the-5am-club-book.jpeg?fit=1600%2C1199&ssl=1'),
('Man’s Search for Meaning', 'Viktor Frankl', 'Philosophy', 370.00, 15, 2, 'https://images-eu.ssl-images-amazon.com/images/I/61MdAtnimVL._AC_UL210_SR210,210_.jpg'),
('The Book Thief', 'Markus Zusak', 'Fiction', 460.00, 22, 2, 'https://www.adorebooks.in/wp-content/uploads/2022/02/Untitled-design-91-1.jpg'),
('The Hobbit', 'J.R.R. Tolkien', 'Fantasy', 520.00, 25, 3, 'https://www.thoughtco.com/thmb/8ioUx2MObPyOISPCi4Ej_vY-by0=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/ScreenShot2019-03-06at2.19.49PM-5c8049af46e0fb00011bf42b.jpg'),
('Harry Potter and the Sorcerer’s Stone', 'J.K. Rowling', 'Fantasy', 550.00, 50, 3, 'https://images-eu.ssl-images-amazon.com/images/I/91NjWLufnNL._AC_UL600_SR600,600_.jpg'),
('Harry Potter and the Chamber of Secrets', 'J.K. Rowling', 'Fantasy', 560.00, 50, 3, 'https://www.apnibook.in/wp-content/uploads/2023/09/Untitled-design-2022-04-10T061455.502-1.jpg'),
('Harry Potter and the Prisoner of Azkaban', 'J.K. Rowling', 'Fantasy', 580.00, 50, 3, 'https://www.crossword.in/cdn/shop/files/crosswordonline-books-default-title-harry-potter-and-the-prisoner-of-azkaban-40471522738393.jpg?v=1746656497'),
('The Great Gatsby', 'F. Scott Fitzgerald', 'Classic', 350.00, 30, 4, 'https://images-eu.ssl-images-amazon.com/images/I/71YF1hHLw7L._AC_UL210_SR210,210_.jpg'),
('Dune', 'Frank Herbert', 'Science Fiction', 600.00, 25, 4, 'https://www.crossword.in/cdn/shop/files/god-emperor-of-dune-reissue-paperback-herbert-frank-bk0496054-42501773590745.jpg?v=1746609476'),
('Inferno', 'Dan Brown', 'Thriller', 490.00, 25, 4, 'https://www.crossword.in/cdn/shop/products/crosswordonline-books-default-title-inferno-hardcover-dan-brown-paperback-dan-brown-paperback-40370833424601.jpg?v=1745712807'),
('Angels & Demons', 'Dan Brown', 'Thriller', 480.00, 25, 5, 'https://talekart.com/wp-content/uploads/2020/12/Angels-Demons.webp'),
('Digital Fortress', 'Dan Brown', 'Thriller', 450.00, 20, 5, 'https://talekart.com/wp-content/uploads/2021/02/Dan-Brown.webp'),
('Origin', 'Dan Brown', 'Thriller', 500.00, 30, 6, 'https://i5.walmartimages.com/asr/969df910-6637-4410-abc7-1ac43bb609a3.1c5ce94f8f20604fd2e7f9e88546328c.jpeg?odnHeight=768&odnWidth=768&odnBg=FFFFFF'),
('The Da Vinci Code', 'Dan Brown', 'Thriller', 520.00, 35, 6, 'https://www.majesticreaders.com/thumb/booksimg/450/600/10237/PIC_201806020914_10237_1.jpg');

-- Orders (some mock purchases by customers)
INSERT INTO orders (customer_id, total_amount, status, order_date) VALUES
(8, 1350.00, 'COMPLETED', '2025-01-12'),
(9, 780.00, 'PENDING', '2025-01-15'),
(10, 1100.00, 'COMPLETED', '2025-01-17'),
(11, 1550.00, 'COMPLETED', '2025-01-18'),
(12, 480.00, 'PENDING', '2025-01-20');

-- Order Items (each order has multiple books)
INSERT INTO order_items (order_id, book_id, quantity, price_at_purchase) VALUES
(1, 2, 2, 399.00),
(1, 4, 1, 299.00),
(2, 5, 1, 450.00),
(2, 3, 1, 350.00),
(3, 10, 2, 390.00),
(4, 19, 1, 460.00),
(4, 7, 2, 380.00),
(5, 8, 1, 410.00);
