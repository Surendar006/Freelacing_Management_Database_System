create database freelance_management;
create table users (
    user_id int primary key auto_increment,
    name varchar(100) not null,
    email varchar(100) not null unique,
    password varchar(100) not null
);

create table freelancers (
    freelancer_id int primary key,
    skills varchar(255) not null,
    experience_years int not null,
    foreign key (freelancer_id) references users(user_id)
);

create table clients (
    client_id int primary key,
    company_name varchar(100),
    foreign key (client_id) references users(user_id)
);

create table projects (
    project_id int primary key auto_increment,
    client_id int not null,
    title_announce varchar(100) not null,
    proposal_text text,
    foreign key (client_id) references clients(client_id)
);

create table proposals (
    proposal_id int primary key auto_increment,
    project_id int not null,
    freelancer_id int not null,
    bid_amount int not null,
    foreign key (project_id) references projects(project_id),
    foreign key (freelancer_id) references freelancers(freelancer_id)
);

create table tasks (
    task_id int primary key auto_increment,
    project_id int not null,
    title varchar(100) not null,
    description text,
    due_date date,
    foreign key (project_id) references projects(project_id)
);

create table payments (
    payment_id int primary key auto_increment,
    project_id int not null,
    amount int not null,
    payment_date date,
    foreign key (project_id) references projects(project_id)
);

create table reviews (
    review_id int primary key auto_increment,
    project_id int not null,
    rating int not null,
    comment text,
    foreign key (project_id) references projects(project_id)
);


INSERT INTO users (name, email, password) VALUES
('Arun Kumar', 'arun.kumar@example.com', 'password123'),
('Priya Devi', 'priya.devi@example.com', 'securepass'),
('Suresh Babu', 'suresh.babu@example.com', 'mypassword'),
('Lakshmi Rani', 'lakshmi.rani@example.com', 'pass456'),
('Rajeshwari', 'rajeshwari@example.com', 'password1'),
('Vijayalakshmi', 'vijayalakshmi@example.com', '12345678'),
('Karthik Raj', 'karthik.raj@example.com', 'hello123'),
('Anjali', 'anjali@example.com', 'qwertyui'),
('Manoj Kumar', 'manoj.kumar@example.com', 'pw123456'),
('Divya', 'divya@example.com', 'secret321');

INSERT INTO freelancers (freelancer_id, skills, experience_years) VALUES
(1, 'Web Development, React, Node.js', 4),
(2, 'Graphic Design, Photoshop, Illustrator', 3),
(3, 'Content Writing, SEO, Blogging', 5),
(4, 'Data Analysis, Python, SQL', 6),
(5, 'Mobile App Development, Flutter, Dart', 2),
(6, 'Digital Marketing, SEO, SEM', 4),
(7, 'UI/UX Design, Adobe XD, Figma', 3),
(8, 'Video Editing, Premiere Pro, After Effects', 5),
(9, 'Photography, Lightroom, Photoshop', 4),
(10, 'Translation, Tamil-English, Editing', 6);

INSERT INTO clients (client_id, company_name) VALUES
(1, 'Saravana Stores'),
(2, 'Jeyachandran Textiles'),
(3, 'Rathna Stores'),
(4, 'Textile India'),
(5, 'Mehta Jewellery'),
(6, 'Punarjanis Life Sciences'),
(7, 'OVION Leather Sofas'),
(8, 'Satinood Kitchen'),
(9, 'Simply South Restaurant'),
(10, 'Dario\'s Chennai');


INSERT INTO projects (client_id, title_announce, proposal_text) VALUES
(1, 'Launch New Clothing Line', 'Seeking innovative designs for a new collection.'),
(2, 'Rebranding Campaign', 'Looking for a fresh brand identity.'),
(3, 'Expand Online Presence', 'Need a comprehensive digital marketing strategy.'),
(4, 'Develop E-commerce Platform', 'Build a user-friendly online store.'),
(5, 'Create New Jewellery Designs', 'Design modern and traditional jewellery pieces.'),
(6, 'Ayurvedic Product Line', 'Develop a range of natural health products.'),
(7, 'Leather Sofa Collection', 'Design a new line of premium leather sofas.'),
(8, 'Kitchenware Expansion', 'Introduce new kitchen products to the market.'),
(9, 'Restaurant Menu Overhaul', 'Update menu with new dishes and pricing.'),
(10, 'Italian Cuisine Promotion', 'Promote new Italian vegetarian dishes.');

INSERT INTO proposals (project_id, freelancer_id, bid_amount) VALUES
(1, 1, 15000),
(2, 2, 12000),
(3, 3, 10000),
(4, 4, 20000),
(5, 5, 18000),
(6, 6, 16000),
(7, 7, 14000),
(8, 8, 13000),
(9, 9, 11000),
(10, 10, 9000);

INSERT INTO tasks (project_id, title, description, due_date) VALUES
(1, 'Design New Collection', 'Create sketches for the upcoming clothing line.', '2025-06-15'),
(2, 'Develop Brand Guidelines', 'Establish new brand colors, fonts, and logo.', '2025-06-10'),
(3, 'SEO Optimization', 'Improve website SEO for better visibility.', '2025-06-20'),
(4, 'Website Development', 'Build the e-commerce platform with payment gateway.', '2025-07-01'),
(5, 'Jewellery Design', 'Create CAD models for new jewellery pieces.', '2025-06-25'),
(6, 'Product Development', 'Formulate and test new Ayurvedic products.', '2025-07-05'),
(7, 'Sofa Design', 'Design prototypes for new leather sofas.', '2025-06-30'),
(8, 'Product Photography', 'Photograph new kitchenware products.', '2025-06-18'),
(9, 'Menu Design', 'Design new menu layout and content.', '2025-06-22'),
(10, 'Dish Promotion', 'Create promotional materials for new dishes.', '2025-06-28');


INSERT INTO payments (project_id, amount, payment_date) VALUES
(1, 15000, '2025-06-16'),
(2, 12000, '2025-06-11'),
(3, 10000, '2025-06-21'),
(4, 20000, '2025-07-02'),
(5, 18000, '2025-06-26'),
(6, 16000, '2025-07-06'),
(7, 14000, '2025-07-01'),
(8, 13000, '2025-06-19'),
(9, 11000, '2025-06-23'),
(10, 9000, '2025-06-29');


INSERT INTO reviews (project_id, rating, comment) VALUES
(1, 5, 'Outstanding designs and timely delivery.'),
(2, 4, 'Creative concepts, met expectations.'),
(3, 5, 'Significant improvement in website traffic.'),
(4, 5, 'User-friendly platform, excellent features.'),
(5, 4, 'Beautiful designs, well-received by clients.'),
(6, 5, 'Effective products, noticeable health benefits.'),
(7, 4, 'Stylish sofas, comfortable seating.'),
(8, 5, 'High-quality products, excellent photography.'),
(9, 4, 'Menu is appealing, customers love the new dishes.'),
(10, 5, 'Delicious dishes, great customer feedback.');

-- 1. view: freelancer details
create view view_freelancer_details as
select u.user_id, u.name, u.email, f.skills, f.experience_years
from users u
join freelancers f on u.user_id = f.freelancer_id;

-- 2. view: client projects
create view view_client_projects as
select u.name as client_name, c.company_name, p.project_id, p.title_announce
from users u
join clients c on u.user_id = c.client_id
join projects p on c.client_id = p.client_id;

-- 3. view: project proposals
create view view_project_proposals as
select p.project_id, p.title_announce, pr.proposal_id, pr.bid_amount, u.name as freelancer_name
from projects p
join proposals pr on p.project_id = pr.project_id
join freelancers f on pr.freelancer_id = f.freelancer_id
join users u on f.freelancer_id = u.user_id;

-- 4. view: project payments
create view view_project_payments as
select p.project_id, p.title_announce, pay.amount, pay.payment_date
from projects p
join payments pay on p.project_id = pay.project_id;

-- 5. view: project reviews
create view view_project_reviews as
select p.project_id, p.title_announce, r.rating, r.comment
from projects p
join reviews r on p.project_id = r.project_id;

-- ================================
--     stored procedures (10)
-- ================================

delimiter //

-- 1. projects with more than 3 proposals
create procedure get_projects_with_many_proposals()
begin
    select p.project_id, p.title_announce, count(pr.proposal_id) as proposal_count
    from projects p
    join proposals pr on p.project_id = pr.project_id
    group by p.project_id
    having count(pr.proposal_id) > 3;
end //

-- 2. average rating for a specific project
create procedure get_project_average_rating(in proj_id int)
begin
    select project_id, avg(rating) as avg_rating
    from reviews
    where project_id = proj_id
    group by project_id;
end //

-- 3. projects per freelancer
create procedure get_freelancer_project_count()
begin
    select f.freelancer_id, u.name, count(distinct pr.project_id) as projects_proposed
    from freelancers f
    join users u on f.freelancer_id = u.user_id
    join proposals pr on f.freelancer_id = pr.freelancer_id
    group by f.freelancer_id;
end //

-- 4. total payments per project
create procedure get_total_payments_per_project()
begin
    select p.project_id, p.title_announce, sum(pay.amount) as total_paid
    from projects p
    join payments pay on p.project_id = pay.project_id
    group by p.project_id;
end //

-- 5. tasks for a project
create procedure list_tasks_by_project(in proj_id int)
begin
    select task_id, title, description, due_date
    from tasks
    where project_id = proj_id;
end //

-- 6. clients with most projects
create procedure get_top_clients_by_projects()
begin
    select c.client_id, u.name as client_name, c.company_name, count(p.project_id) as project_count
    from clients c
    join users u on c.client_id = u.user_id
    join projects p on c.client_id = p.client_id
    group by c.client_id
    order by project_count desc;
end //

-- 7. freelancers with most wins (lowest bid per project)
create procedure get_freelancers_with_most_wins()
begin
    select f.freelancer_id, u.name, count(*) as wins
    from proposals pr
    join (
        select project_id, min(bid_amount) as min_bid
        from proposals
        group by project_id
    ) winners on pr.project_id = winners.project_id and pr.bid_amount = winners.min_bid
    join freelancers f on pr.freelancer_id = f.freelancer_id
    join users u on f.freelancer_id = u.user_id
    group by f.freelancer_id
    order by wins desc;
end //

-- 8. projects without proposals
create procedure get_projects_without_proposals()
begin
    select p.project_id, p.title_announce
    from projects p
    left join proposals pr on p.project_id = pr.project_id
    where pr.project_id is null;
end //

Projects with more than 3 proposals
CALL get_projects_with_many_proposals();
    
--Average rating for a specific project (replace 1 with the desired project_id)
CALL get_project_average_rating(1);

    
    --Projects per freelancer
 CALL get_freelancer_project_count();

 --Total payments per project
CALL get_total_payments_per_project();

--Tasks for a specific project (replace 1 with the desired project_id)
  CALL list_tasks_by_project(1);

--Clients with the most projects
CALL get_top_clients_by_projects();

--Freelancers with most wins (lowest bids)
CALL get_freelancers_with_most_wins();



CALL get_projects_without_proposals();


