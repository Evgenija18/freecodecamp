#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -A -c"
echo -e "\n~~~~~ MY SALON ~~~~~"

echo -e "\nWelcome to My Salon. How can I help you?\n"

SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id" | sed 's/|/ /g')

display_services() {
echo "$SERVICES" | while read SERVICE_ID SERVICE_NAME
do
  echo "$SERVICE_ID) $SERVICE_NAME"
done
}

while true
do 
  display_services
  echo -e "\nEnter the service you want."
  read SERVICE_ID_SELECTED

  SERVICE_EXIST=$($PSQL "SELECT service_id FROM services WHERE service_id = $SERVICE_ID_SELECTED")

  if [[ -z $SERVICE_EXIST ]]
  then
    echo -e "\nI could not find that service. Please choose again."
    continue
  fi

  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

  if [[ -z $CUSTOMER_NAME ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME

    NEW_CUSTOMER=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')") 
    
  fi


  SERVICE_NAME_SELECTED=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
  echo -e "\nWhat time would you like your $SERVICE_NAME_SELECTED, $CUSTOMER_NAME?"
  read SERVICE_TIME

  NEW_CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  APPOINTMENT_TIME=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($NEW_CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME');")
  
  echo -e "\nI have put you down for a $SERVICE_NAME_SELECTED at $SERVICE_TIME, $CUSTOMER_NAME."
  break
done
