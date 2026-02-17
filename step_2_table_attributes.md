## theatre

theatre_id (PK)

theatre_name

address_line1

address_line2

city

state

pincode

contact_number


## screen

screen_id (PK)

screen_name (e.g., Screen 1, Audi 2)

total_seats

theatre_id


## movie

movie_id (PK)

movie_name

duration_minutes

genre

release_date

certification (e.g., U, UA, A)

## language

language_id (PK)

language_name (e.g., English, Hindi, Tamil)

## format

format_id (PK)

format_name (e.g., 2D, 3D, IMAX)

## show 

show_id (PK)

show_date

show_start_time

show_end_time

ticket_price

show_status (Active, Cancelled, Housefull)

movie_id

screen_id

language_id

## movie_actor

movie_id	

actor_id	

role_name 

## movie_language

movie_id

language_id

