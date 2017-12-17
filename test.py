def merge(s0, s1):
    i0, i1 = iter(s0), iter(s1)
    e0, e1 = next(i0, None), next(i1, None)

    while e0 != None and e1 != None:
        if e0 == e1:
            yield e0
            e0, e1 = next(i0, None), next(i1, None)
        elif e0 < e1:
            yield e0
            e0 = next(i0, None)
        else:
            yield e1
            e1 = next(i1, None)
    if e0 == None:
        yield e1
    elif e1 == None:
        yield e0
    return



def remainders_generator(m):
    def inner_generator(remainder):
        i = 0
        while True:
            if i % m == remainder:
                yield i
            i += 1
    yield [inner_generator(x) for x in range(0, m)]


def zip_generator(*iterables);
    iterators = [iter(iterable) for iterable in iterables]
    while True:
        yield [next(iterator) for iterator in iterators]




CREATE TABLE size_of_dogs AS
    SELECT name, size FROM dogs, sizes
    WHERE height > min AND height <= max;

CREATE TABLE by_height AS
    SELECT child FROM dogs, parents
    WHERE name = parent ORDER BY height DESC;


CREATE TABLE sentences AS
    WITH
        siblings(first, second) as (
            SELECT a.child, b.child FROM parents AS a, parents AS b
            WHERE a.parent = b.parent AND a.child < b.child;
        )
        SELECT first || " and " || second || " are " || a.size || " siblings "
        FROM siblings, size_of_dogs AS a, size_of_dogs AS b
        WHERE first = a.name AND second = b.name AND a.size = b.size



CREATE TABLE stacks AS
    WITH
        sums(names, n, total, last_height) AS (
            SELECT name, 1, height, height FROM dogs UNION
            SELECT names || ", " || name, n+1, total+height, height FROM dogs, sums
            WHERE n < 4 AND last_height < height;
        )
        SELECT names, total FROM sums WHERE n = 4 AND total > 170 ORDER BY total;



CREATE TABLE schedule1 AS
    WITH
        paths(path, starting, total_flights, total_price, last_arrival) AS (
            SELECT departure || ", " || arrival, departure, 1, price, arrival FROM flights UNION
            SELECT path || ", " || arrival, starting, total_flights+1, total_price+price, arrival
            FROM paths, flights
            WHERE total_flights < 2 AND departure = last_arrival
        )
        SELECT path, total_price FROM paths WHERE last_arrival = 'PDX' AND starting = 'SFO' ORDER BY total_price;


CREATE TABLE nubmer_of_options AS
    SELECT COUNT(DISTINCT meat) FROM main_course;

CREATE TABLE calories AS
    WITH
        calories(amount) AS (
            SELECT m.calories + d.calories FROM main_course AS m, pies AS d
        )
        SELECT COUNT(*) FROM calories WHERE amount < 2500;

CREATE TABLE healthiest_meats AS
    WITH
        full_courses(meat, calories) AS (
            SELECT m.meat, m.calories+p.calories FROM main_course AS m, pies AS p
        )
    SELECT meat, MIN(calories) FROM full_courses
    GROUP BY meat HAVING MAX(calories) < 3000;


CREATE TABLE average_prices AS
    SELECT category, AVG(MSRP) FROM products GROUP BY category;


CREATE TABLE lowest_prices AS
    SELECT store, item, MIN(price) FROM inventory GROUP BY item;


CREATE TABLE shopping_list AS
    SELECT item, store FROM lowest_prices, products
    WHERE item = name GROUP BY category HAVING MIN(MSRP/rating);


CREATE TABLE total_bandwidth AS
    WITH
        bandwiths(bandwith) AS (
            SELECT first.Mbs*COUNT(*) FROM stores as first, shopping_list as second
            WHERE first.store = second.store
            GROUP BY first.store
        )
        SELECT SUM(bandwith) FROM bandwiths;
