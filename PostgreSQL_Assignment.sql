-- Active: 1747548282672@@127.0.0.1@5432@ph
-- Table Creation Script
CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    region VARCHAR(100) NOT NULL
);

CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(100) NOT NULL,
    scientific_name VARCHAR(150) NOT NULL,
    discovery_date DATE,
    conservation_status VARCHAR(50)
);

CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INT REFERENCES rangers(ranger_id) ON DELETE CASCADE,
    species_id INT REFERENCES species(species_id) ON DELETE CASCADE,
    sighting_time TIMESTAMP NOT NULL,
    location VARCHAR(255),
    notes TEXT
);

-- Data Insertion Script
INSERT INTO rangers (name, region) VALUES
('John Doe', 'North Zone'),
('Jane Smith', 'East Zone'),
('Mike Johnson', 'South Zone'),
('Emily Davis', 'West Zone'),
('Chris Lee', 'Central Zone'),
('Anna Brown', 'Northern Forest'),
('David Wilson', 'Eastern Plains'),
('Sophia Martinez', 'Southern Hills'),
('James Taylor', 'Western Desert'),
('Olivia Garcia', 'Coastal Region');

INSERT INTO species (common_name, scientific_name, discovery_date, conservation_status) VALUES
('African Elephant', 'Loxodonta africana', '1825-01-01', 'Vulnerable'),
('Bengal Tiger', 'Panthera tigris tigris', '1850-05-10', 'Endangered'),
('Giant Panda', 'Ailuropoda melanoleuca', '1869-03-01', 'Vulnerable'),
('Snow Leopard', 'Panthera uncia', '1775-07-20', 'Vulnerable'),
('Blue Whale', 'Balaenoptera musculus', '1750-01-01', 'Endangered'),
('King Cobra', 'Ophiophagus hannah', '1800-09-15', 'Vulnerable'),
('Mountain Gorilla', 'Gorilla beringei beringei', '1900-11-11', 'Endangered'),
('Komodo Dragon', 'Varanus komodoensis', '1910-04-01', 'Vulnerable'),
('Emperor Penguin', 'Aptenodytes forsteri', '1844-12-25', 'Near Threatened'),
('Hyacinth Macaw', 'Anodorhynchus hyacinthinus', '1823-08-02', 'Vulnerable');

INSERT INTO sightings (ranger_id, species_id, sighting_time, location, notes) VALUES
(1, 1, '2025-05-01 08:30', 'Snowfall Pass', NULL),
(3, 2, '2025-05-02 09:15', 'Eastern Plains', ' stalking prey'),
(1, 3, '2025-05-03 07:45', 'South Jungle', 'Grazing behavior observed'),
(3, 2, '2025-05-04 10:00', 'West Mountains', 'Climbing a tree'),
(5, 5, '2025-05-05 11:30', 'Coastal Waters', 'Spotted breaching'),
(4, 4, '2025-05-06 12:45', 'Northern Forest', 'Hunting activity'),
(7, 7, '2025-05-07 14:20', 'Eastern Hills', 'Grooming observed'),
(8, 3, '2025-05-08 16:00', 'Southern Islands', 'Nest building'),
(9, 9, '2025-05-09 06:50', 'Polar Ice', NULL),
(10, 10, '2025-05-10 13:15', 'South American Wetlands', 'Flying over area');


-- Problem 1
INSERT INTO rangers (name, region) VALUES
('Derek Fox', 'Coastal Plains');

-- Problem 2
SELECT COUNT(DISTINCT species_id) AS unique_species_count
FROM sightings;

-- Problem 3
SELECT * FROM sightings
WHERE location LIKE '%Pass%';

-- Problem 4
SELECT rangers.name, COUNT(sightings.sighting_id) AS total_sightings
FROM rangers 
LEFT JOIN sightings ON rangers.ranger_id = sightings.ranger_id
GROUP BY rangers.name;

-- Problem 5
SELECT common_name
FROM species
LEFT JOIN sightings ON species.species_id = sightings.species_id
WHERE sightings.species_id IS NULL;

-- Problem 6
SELECT 
    s.common_name,
    si.sighting_time,
    r.name
FROM sightings si
JOIN species s ON si.species_id = s.species_id
JOIN rangers r ON si.ranger_id = r.ranger_id
ORDER BY si.sighting_time DESC
LIMIT 2;

-- Problem 7
UPDATE species
SET conservation_status = 'Historic'
WHERE discovery_date < '1800-01-01';

-- Problem 8
SELECT 
    sighting_id,
    CASE
        WHEN EXTRACT(HOUR FROM sighting_time) < 12 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM sighting_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS time_of_day
FROM sightings;

-- Problem 9
DELETE FROM rangers
WHERE ranger_id NOT IN (
    SELECT DISTINCT ranger_id FROM sightings
);












DROP Table sightings;
DROP Table rangers;
DROP Table species;