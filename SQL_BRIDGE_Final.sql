/*
• Create a new database called BuildingEnergy, and create tables EnergyCategories, EnergyTypes, BuildingEnergy, and Buildings. 
• Each energy category can have many energy types. 
• Populate the Energyçies table with rows for Fossil and Renewable.
• Populate the EnergyTypes table with rows for Electricity, Gas, Steam, Fuel Oil, Solar, and Wind.
• In EnergyTypes table, it indicates that Electricity, Gas, Steam, and Fuel Oil are Fossil energy
• sources, while Solar and Wind are renewable energy sources.
*/

DROP SCHEMA buildingEnergy;
CREATE SCHEMA BuildingEnergy;
 
DROP TABLE IF EXISTS EnergyTypes;
DROP TABLE IF EXISTS EnergyCategories;
DROP TABLE IF EXISTS Buildings;
 
CREATE TABLE EnergyCategories
(
 cat_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,    
 cat_name VARCHAR(50) NOT NULL
);
 
SELECT * FROM EnergyCategories;
 
INSERT INTO EnergyCategories 
  (cat_name)
 VALUES 
  ("Fossil"),
  ("Renewable")
;
 
SELECT * FROM EnergyCategories;
 
CREATE TABLE EnergyTypes
(
 energy_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
 energy_name VARCHAR(100) NOT NULL,
 cat_id INT NOT NULL,
 FOREIGN KEY fk_cat(cat_id)
 REFERENCES EnergyCategories(cat_id)
);
 
SELECT * FROM EnergyTypes;

INSERT INTO EnergyTypes 
  (energy_name, cat_id)
 VALUES 
  ("Electricity", "1"),
  ("Gas", "1"),
  ("Steam", "1"),
  ("Fuel Oil", "1"),
  ("Solar", "2"),
  ("Wind", "2")
; 

SELECT cat_name as energycategory, energy_name as energytype 
FROM EnergyTypes a 
 INNER JOIN EnergyCategories b
 ON a.cat_id = b.cat_id
;

CREATE TABLE Buildings
(
 building_id INT NOT NULL AUTO_INCREMENT, 
 building_name VARCHAR(200) NOT NULL,
 energy_id INT NOT NULL,
 PRIMARY KEY(building_id, energy_id),
 FOREIGN KEY fk_cat(energy_id)
 REFERENCES EnergyTypes(energy_id)
);

INSERT INTO Buildings 
  (building_name, energy_id)
 VALUES 
  ("Empire State Building", "1"),
  ("Empire State Building", "2"),
  ("Empire State Building", "3"),
  ("Chrysler Building", "1"),
  ("Chrysler Building", "3"),
  ("Borough of Manhattan Community College", "1"),
  ("Borough of Manhattan Community College", "3"),
  ("Borough of Manhattan Community College", "5")
; 

/*
• Select the buildings and associated energy types for each building.
*/
SELECT building_name as building, energy_name as energytype 
FROM EnergyTypes a 
 INNER JOIN Buildings b
 ON a.energy_id = b.energy_id
ORDER BY building_name
;

/*
• Add this information to the BuildingEnergy database, inserting rows as needed in various tables. 
• Building: Bronx Lion House; Energy Types: Geothermal
• Brooklyn Childrens Museum: Energy Types: Electricity, Geothermal
*/

INSERT INTO EnergyTypes 
  (energy_name, cat_id)
 VALUES 
  ("Geothermal", "2")
; 

SELECT * FROM EnergyTypes;

INSERT INTO Buildings 
  (building_name, energy_id)
 VALUES 
  ("Brooklyn Childrens Museum", "1"),
  ("Brooklyn Childrens Museum", "7"),
  ("Bronx Lion House", "7")
; 

SELECT * FROM Buildings;

/*
• Select all of the buildings that use Renewable Energies.
*/
SELECT Building_name as building, energy_name as energytype, cat_name as energycategory
FROM EnergyTypes a, 
     Buildings b,
     EnergyCategories c
WHERE a.energy_id = b.energy_id
  AND a.cat_id = c.cat_id
  AND c.cat_id = 2
;

/*
• Frequency with which energy types are used in various buildings.
*/

SELECT energy_name as energytype, count(energy_name) as count 
FROM EnergyTypes a, 
     Buildings b,
     EnergyCategories c
WHERE a.energy_id = b.energy_id
  AND a.cat_id = c.cat_id
GROUP BY energy_name
ORDER BY count desc
;