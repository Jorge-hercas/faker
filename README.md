# faker
This package aims to connect to the faker API and be able to easily build tables with random data, mainly for the purpose of testing and practicing.

## Installation

```
devtools::install_github("Jorge-hercas/faker")
```


## Some examples

Creating a custom table with `custom_data`:

```
library(faker)

data <- dplyr::tibble(
  name = c("country", "date"),
  type = c("country", "dateTime")
)

faker::custom_data(obs = 5, data = data)
```

Expected result:

```
 country                  date.date date.timezone_type date.timezone
1                                           Singapore 2008-01-29 23:26:09.000000                  3           UTC
2                                              Greece 1980-10-24 23:05:42.000000                  3           UTC
3                                                Niue 2013-09-02 12:41:39.000000                  3           UTC
4                                           Mauritius 2002-11-03 06:04:39.000000                  3           UTC
5 British Indian Ocean Territory (Chagos Archipelago) 2003-11-24 07:36:39.000000                  3           UTC
```

Returning persons data with `people_data()`:

```
library(faker)

people_data(obs = 5, gender = "female")
```

Expected result:

```
 id firstname    lastname                       email          phone   birthday gender address.id
1  1   Dolores     Cormier elmer.klein@jakubowski.info +6724030425697 1994-12-13 female          0
2  2   Vicenta     Collins           kelsi39@yahoo.com +6476349355679 1996-07-03 female          0
3  3     Anahi Heidenreich  rodriguez.gerard@yahoo.com +9143094031764 1996-01-20 female          0
4  4       May     O'Keefe        ulubowitz@kohler.net +3306610460720 1997-05-23 female          0
5  5      Bert        Koch     bartell.laury@gmail.com +3473531323992 1996-05-20 female          0
               address.street address.streetName address.buildingNumber     address.city address.zipcode   address.country
1           2634 Jake Gateway        Herman Keys                   9901       Lake Jadon      89815-3042           Iceland
2 55868 Veum Village Apt. 241    Osinski Freeway                  22723   Antoinetteview      80724-6732        Madagascar
3          1126 Coty Mountain       Curt Village                   8699        New Emely      67191-4940 Brunei Darussalam
4        54129 Ashley Viaduct        Stokes Mill                  52049 Lake Bertramport      10380-2688         Hong Kong
5   1130 Sauer Locks Apt. 632          Hand Loop                   5251       Littelview      85073-6223     Guinea-Bissau
  address.county_code address.latitude address.longitude              website                              image
1                  SH        -64.68583          69.47556 http://cummerata.com http://placeimg.com/640/480/people
2                  GF         31.16957         102.96191     http://crist.net http://placeimg.com/640/480/people
3                  TG        -34.26726         -71.80847    http://larkin.org http://placeimg.com/640/480/people
4                  BL        -87.65108         126.72840   http://oconner.biz http://placeimg.com/640/480/people
5                  MV        -64.63051         -80.77942      http://feil.net http://placeimg.com/640/480/people
```







