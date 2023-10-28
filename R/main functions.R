



#' People data request
#'
#' @param obs Number of rows returned. Max = 1000.
#' @param gender Boolean argument. "male" or "female" values accepted
#' @param birthday_interval Vector of two interval dates in yyyy-mm-dd format.
#'
#' @return
#' @export
#'
#' @examples
people_data <- function(obs = 10, gender = NULL, birthday_interval = c("1990-01-01", "2000-01-01")){

 tryCatch({
   if (is.null(gender) == F){
     path <- paste0("https://fakerapi.it/api/v1/persons?_quantity=",obs,"&_gender=",gender,
                    "&_birthday_start=",birthday_interval[1],"&_birthday_end=",birthday_interval[2])
   }else{
     path <- paste0("https://fakerapi.it/api/v1/persons?_quantity=",obs,"_locale=mx_MX",
                    "&_birthday_start=",birthday_interval[1],"&_birthday_end=",birthday_interval[2])
   }
 }, error = function(e){
   stop("Arguments `obs` and `birthday_interval` are required")
 })

  return(jsonlite::fromJSON(path)$data)

}


#' Coordinates data request
#'
#' @param obs Number of rows returned
#'
#' @return
#' @export
#'
#' @examples
coords_data <- function(obs = 10){

  tryCatch({
    path <- paste0("https://fakerapi.it/api/v1/places?_quantity=",obs)
  }, error = function(e){
    stop("Argument `obs` is required")
  })
  return(jsonlite::fromJSON(path)$data)

}

#' Addresses data request
#'
#' @param obs Number of rows returned
#'
#' @return
#' @export
#'
#' @examples
addresses_data <- function(obs = 10){

  tryCatch({
    path <- paste0("https://fakerapi.it/api/v1/addresses?_quantity=",obs)
  }, error = function(e){
    stop("Argument `obs` is required")
  })
  return(jsonlite::fromJSON(path)$data)

}

#' Books data request
#'
#' @param obs Number of rows returned
#'
#' @return
#' @export
#'
#' @examples
books_data <- function(obs = 10){

  tryCatch({
    path <- paste0("https://fakerapi.it/api/v1/books?_quantity=",obs)
  }, error = function(e){
    stop("Argument `obs` is required")
  })
  return(jsonlite::fromJSON(path)$data)

}

#' Companies data request
#'
#' @param obs Number of rows returned
#'
#' @return
#' @export
#'
#' @examples
companies_data <- function(obs = 10){

  tryCatch({
    path <- paste0("https://fakerapi.it/api/v1/companies?_quantity=",obs)
  }, error = function(e){
    stop("Argument `obs` is required")
  })
  return(jsonlite::fromJSON(path)$data)

}

#' Credit cards data request
#'
#' @param obs Number of rows returned
#'
#' @return
#' @export
#'
#' @examples
creditcards_data <- function(obs = 10){

  tryCatch({
    path <- paste0("https://fakerapi.it/api/v1/credit_cards?_quantity=",obs)
  }, error = function(e){
    stop("Argument `obs` is required")
  })
  return(jsonlite::fromJSON(path)$data)

}

#' Texts data request
#'
#' @param obs Number of rows returned
#' @param characters String characters returned on each row
#'
#' @return
#' @export
#'
#' @examples
texts_data <- function(obs = 10, characters = 120){

  tryCatch({
    path <- paste0("https://fakerapi.it/api/v1/texts?_quantity=",obs, "&_characters=",characters)
  }, error = function(e){
    stop("Argument `obs` is required and `characters`")
  })
  return(jsonlite::fromJSON(path)$data)

}


#' Users data request
#'
#' @param obs Number of rows returned
#' @param genre Boolean argument. "male" or "female" values accepted
#'
#' @return
#' @export
#'
#' @examples
users_data <- function(obs = 10, genre = "female"){

  tryCatch({
    path <- paste0("https://fakerapi.it/api/v1/users?_quantity=",obs, "&_gender=",genre)
  }, error = function(e){
    stop("Argument `obs` is required and `characters`")
  })
  return(jsonlite::fromJSON(path)$data)

}


#' Producs data request
#'
#' @param obs Number of rows returned
#' @param prices_interval Vector of prices. Must be 2 values: min and max
#' @param tax Tax percent. Value between 0 and 100
#' @param category_type Type of values returned on sku column. Values accepted: "integer", "string" and "uuid"
#'
#' @return
#' @export
#'
#' @examples
products_data <- function(obs = 10, prices_interval = c(0,100), tax = 30, category_type = "uuid"){

  tryCatch({
    path <- paste0("https://fakerapi.it/api/v1/products?_quantity=",obs, "&_price_min=",prices_interval[1],
                   "&_price_max=",prices_interval[2], "&_taxes=", tax, "&_categories_type=", category_type)
  }, error = function(e){
    stop("Argument `obs` is required and `characters`")
  })
  return(jsonlite::fromJSON(path)$data)

}


#' Images data request
#'
#' @param obs Number of rows returned
#' @param image_type Images category. Can be one of the following: any, animals, architecture, nature, people, tech, kittens, pokemon
#' @param width Width img in px. 640
#' @param height Height img in px. 480
#' @param only_url_img Boolean value. If TRUE only return url images vector
#'
#' @return
#' @export
#'
#' @examples
images_data <- function(obs = 10, image_type = "any", width = 640, height = 480, only_url_img = FALSE){

  if (only_url_img == TRUE){
    tryCatch({
      path <- paste0("https://fakerapi.it/api/v1/products?_quantity=",obs, "&_type=",image_type,
                     "&_width=",width, "&_height=", height)
    }, error = function(e){
      stop("Argument `obs` is required and `characters`")
    })
    return(jsonlite::fromJSON(path)$data$image)
  }else{
    tryCatch({
      path <- paste0("https://fakerapi.it/api/v1/products?_quantity=",obs, "&_type=",image_type,
                     "&_width=",width, "&_height=", height)
    }, error = function(e){
      stop("Argument `obs` is required and `characters`")
    })
    return(jsonlite::fromJSON(path)$data)
  }

}


#' Custom table request
#'
#' @param obs Number of rows returned
#' @param data Data frame or tibble with column names and column types. First must can contain the names of the columns that we want to return. Second column must contain the value type. Accepted value types: "boolean","boolean_digit","buildingNumber","building_number","card_expiration","card_number","card_type","city","company_name","counter","country","countryCode","country_code","date","dateTime","date_time","ean","email","firstName","first_name","image","lastName","last_name","latitude","longText","long_text","longitude","name","null","number","phone","pokemon","postcode","state","streetAddress","streetName","street_address","street_name","text","upc","uuid","vat","website","word"
#'
#' @return
#' @export
#'
#' @examples
custom_data <- function(obs = 10, data){

  data <- data |>
    setNames(c("colname", "coltype"))

  path <- paste0("https://fakerapi.it/api/v1/custom?_quantity=", obs)
  query_params <- paste0("&", data$colname, "=", data$coltype, collapse = "")
  path <- paste0(path, query_params)

  return(jsonlite::fromJSON(path)$data)

}


