# 64 Slices of Pizza

## Goals

64 Slices of Pizza! Practice working with CSV files and designing schema based on the CSV data.

## Scenario

Severina Snap has a side-hustle running a pizza store. She's not very personable, so the stores are delivery-only. The stores are known for having magical combinations of rare and various toppings.

Severina and [Daldus, the owner of 32 Flavors Ice Cream](https://github.com/Code-Platoon-Assignments/sql-32-flavors-1), go way back and have always talked about combining to form their dream establishmet, Dogweed's 1024 Calories of Pizza and Ice Cream (named after [a special ingredient they both use](https://texasbeyondhistory.net/ethnobot/images/dogweed.html) for an ice cream flavor and pizza topping), but, it has yet to happen.

Now that 32 Flavors is switching over to computers though, 64 Slices is following suit. Severina heard great things about you from Daldus and has hired you as well to build their inventory system!

64 Slices is a bit more modern, they actually have been using spreadsheets to manage their inventory, but, unfortunately things are a bit disorganized.

## Project

Severina has given you csv exports of their existing spreadsheets. This is their current inventory, driver, and delivery information. There may or may not be a bit more information in there or some gaps - they're not sure, to be honest, as they're always working quite hard.

Your task is, based on these CSV files, to build their data model and system.

### Deliverables

For each stage ...

- An entity-relationship diagram
- SQL files to create the postgres data schema and for all queries
- A working postgres database with the data imported

*Recommendation: Do each stage on a separate git branch so you can refer back easily to previous work.*

## Stage 1

Design a conceptual data model - make an Entity-Relationship diagram - and then use that and the data itself to design your data schema and create a Postgres database and import the data into it.

Severina also wants to know:

- How many drivers she has.
- Which driver is the most productive overall?
- Each day, who was the most productive driver?

## Stage 2 - Stretch Goal!

Severina has found another spreadsheet! This one has invoice data that drivers submit - 64 Slices is a great employer and pays for driver's gas costs.

Update your conceptual data model and data schema accordingly. 

**This data is not as well organized as the rest.** It may take some work to get it into the database, and, you may want to write a Python helper script.

Severina also wants to know:

- Which driver spent the most on gas overall?
- Each day, which driver spent the most on gas?
- Each day, after expenses, what is 64 Slices profit?

