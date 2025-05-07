# Data Files & Column Details

The original datasets were obtained from multiple yearly CSV files on [data.gv.at](https://www.data.gv.at/). After merging each dataset by year, five consolidated files were created, representing:

1. **Jahreskarten der Wiener Linien Wien**

   * **Original Columns**
     * `NUTS1` (AT1 für Ostösterreich)
     * `NUTS2` (AT13 für Bundesland Wien)
     * `NUTS3` (AT130 für Stadt Wien)
     * `DISTRICT_CODE` (90001 für Wien)
     * `SUB_DISTRICT_CODE` (0 da nicht verwendet)
     * `YEAR` (Jahr, für das die Werte gelten)
     * `REF_YEAR` (Datenjahr)
     * `ANNUAL_TICKETS` (Anzahl von Jahreskarten)
   * **Included in Final Table**
     * `YEAR` → stored as `data_year`
     * `ANNUAL_TICKETS` → renamed to `ticket_count`
   * **Dropped / Not Imported**
     * `NUTS1`, `NUTS2`, `NUTS3`, `DISTRICT_CODE`, `SUB_DISTRICT_CODE` were excluded as they were redundant for the analysis.
     * `REF_YEAR` was later removed to retain a single year column.

2. **Fahrgastzahlen der Wiener Linien Wien**

   * **Original Columns**
     * `NUTS1` (AT1 für Ostösterreich)
     * `NUTS2` (AT13 für Bundesland Wien)
     * `NUTS3` (AT130 für Stadt Wien)
     * `DISTRICT_CODE` (90001 für Wien)
     * `SUB_DISTRICT_CODE` (0 da nicht verwendet)
     * `YEAR` (Jahr)
     * `REF_YEAR` (Datenjahr)
     * `BUS` (Autobus)
     * `TRAM` (Straßenbahn)
     * `UNDERGROUND` (U-Bahn)
   * **Included in Final Table**
     * `YEAR` → stored as `data_year`
     * `BUS`, `TRAM`, `UNDERGROUND` columns retained
   * **Dropped / Not Imported**
     * `NUTS1`, `NUTS2`, `NUTS3`, `DISTRICT_CODE`, `SUB_DISTRICT_CODE` were removed
     * `REF_YEAR` was removed subsequently

3. **Jahreskarten und PKW seit 2002 – Wien**

   * **Original Columns**
     * `NUTS` (NUTS2-Region)
     * `DISTRICT_CODE` (Gemeindebezirkskennzahl)
     * `SUB_DISTRICT_CODE` (Zählbezirkskennzahl)
     * `REF_YEAR`
     * `REF_DATE`
     * `TIC_VALUE` (Ausgestellte Wiener Linien Jahreskarten)
     * `PKW_VALUE` (Zugelassene PKW)
     * `TIC_DENSITY` (Ausgestellte Wiener Linien Jahreskarten pro 1.000 EinwohnerInnen)
     * `PKW_DENSITY` (Zugelassene PKW pro 1.000 EinwohnerInnen)
   * **Included in Final Table** (`annual_tickets_cars`)
     * `REF_YEAR` → stored as `data_year`
     * `TIC_VALUE`
     * Only `data_year` and `TIC_VALUE` were required; PKW-related columns remained in the table but were not utilized in subsequent queries.
   * **Dropped / Not Imported**
     * `NUTS`, `DISTRICT_CODE`, `SUB_DISTRICT_CODE`, `REF_DATE` were excluded
     * Rows affected by data mismatches were corrected by manually editing the CSV (removing commas and periods) and executing CREATE/INSERT statements

4. **PKW-Bestand und EinwohnerInnen Wien**

   * **Original Columns**
     * `NUTS1` (AT1 für Ostösterreich)
     * `NUTS2` (AT13 für Bundesland Wien)
     * `NUTS3` (AT130 für Stadt Wien)
     * `DISTRICT_CODE` (90001 für Wien)
     * `SUB_DISTRICT_CODE` (0 da nicht verwendet)
     * `YEAR` (Jahr)
     * `REF_YEAR` (Datenjahr)
     * `DISTRICT` (Name des Bezirks)
     * `PASSENGER_CARS` (Anzahl der PKW)
     * `POPULATION` (Bevölkerungszahl)
   * **Included in Final Table** (`pkw_population`)
     * `YEAR` → `data_year`
     * `DISTRICT`
     * `PASSENGER_CARS`
     * `POPULATION`
   * **Dropped / Not Imported**
     * `NUTS1`, `NUTS2`, `NUTS3`, `DISTRICT_CODE`, `SUB_DISTRICT_CODE` removed
     * `REF_YEAR` removed subsequently

5. **Verkehrsmittelwahl Wien**

   * **Original Columns**
     * `NUTS1` (AT1 für Ostösterreich)
     * `NUTS2` (AT13 für Bundesland Wien)
     * `NUTS3` (AT130 für Stadt Wien)
     * `DISTRICT_CODE` (9 für Wien)
     * `SUB_DISTRICT_CODE` (0 da nicht verwendet)
     * `YEAR` (Jahr)
     * `BICYCLE` (Anteil Fahrräder)
     * `BY_FOOT` (Anteil zu Fuß)
     * `CAR` (Anteil PKW)
     * `MOTORCYCLE` (Anteil Motorräder)
     * `PUBLIC_TRANSPORT` (Anteil öffentlicher Verkehr)
   * **Included in Final Table** (`mode_share`)
     * `YEAR` → `data_year`
     * `BICYCLE`, `BY_FOOT`, `CAR`, `MOTORCYCLE`, `PUBLIC_TRANSPORT`
   * **Dropped / Not Imported**
     * `NUTS1`, `NUTS2`, `NUTS3`, `DISTRICT_CODE`, `SUB_DISTRICT_CODE` removed
     * Additional columns (e.g., `bikesharing`, `carsharing`) were selectively retained or dropped based on final merge requirements
     * Partial data rows were imported according to availability

---

## Course of Events

1. **Data Acquisition & Merging**
   * The necessary yearly CSV files were located on [data.gv.at](https://www.data.gv.at/)
   * Each dataset’s CSVs (2015–2021 or 2002–2021) were merged into a single file, resulting in five combined CSVs, one per data category

2. **Initial Database & Table Creation**
   * MySQL Workbench was opened to create the `vienna_mobility` database:
     ```sql
     CREATE DATABASE IF NOT EXISTS vienna_mobility;
     USE vienna_mobility;
     ```
   * The Table Data Import Wizard was used for four CSVs, with only the required columns and rows selected

3. **Handling the Last File**
   * The final CSV contained over 100 rows, but only approximately 80 imported automatically
   * Unnecessary columns and rows were removed in Excel, commas and periods were standardized, and the file was converted into an SQL script
   * The script (CREATE TABLE and INSERT statements) was executed to finalize the table with accurate data

4. **Schema Revisions & Data Cleaning**
   * Columns were renamed (e.g., `ref_year` → `data_year`) for consistency
   * Redundant primary keys and extra columns (`REF_YEAR`, `NUTS1`, `NUTS2`, etc.) were removed
   * Duplicates were eliminated via temporary tables and aggregation:
     ```sql
     CREATE TABLE annual_tickets_clean AS
     SELECT data_year, MAX(ticket_count) AS ticket_count
     FROM annual_tickets
     GROUP BY data_year;
     DROP TABLE annual_tickets;
     RENAME TABLE annual_tickets_clean TO annual_tickets;
     ```

5. **Advanced Queries & Final Analysis**
   * Joins were written to compare annual ticket counts against ridership (rides per ticket)
   * Year-over-year growth rates were calculated for both tickets and ridership
   * Passenger car usage per 1,000 inhabitants was summarized by district
   * Mode share across transport types was analyzed, identifying the top mode for each year
   * After duplicates were removed and columns streamlined, the final queries executed without issues

---

## How to Proceed

1. **Check the `cleaned_data/` directory**
   * Contains the five merged, cleaned CSVs originally sourced from data.gv.at
   * The `original_data/` directory holds the raw, unmerged CSV files

2. **Run `create_clean_tables.sql`**
   * Executes schema creation, duplicate cleaning, and column renaming

3. **Run `analysis_queries.sql`**
   * Generates advanced comparisons of ticket counts, ridership, car ownership, and mode shares

4. **Review Results in MySQL Workbench**
   * Examine output columns such as `rides_per_ticket` and district rankings by car ownership

5. **Run `export_queries.sql`**
   * Exports query results to CSV for the Tableau dashboard

---

This README demonstrates the data wrangling processes, SQL transformations, and analytical workflows applied to Vienna mobility datasets.
