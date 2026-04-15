#!/bin/bash


PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))

echo "Enter your username:"

read USERNAME

USER_INFO=$($PSQL "SELECT games_played, best_game FROM users WHERE username='$USERNAME'")

if [[ -z $USER_INFO ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  GAMES_PLAYED=$(echo $USER_INFO | cut -d '|' -f1)
  BEST_GAME=$(echo $USER_INFO | cut -d '|' -f2)

  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."

fi


echo "Guess the secret number between 1 and 1000:"
read GUESS

GUESS_COUNT=1

while [[ $GUESS != $SECRET_NUMBER ]]
do
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  elif [[ $GUESS -gt $SECRET_NUMBER ]]
  then
    echo "It's lower than that, guess again:"
  else
    echo "It's higher than that, guess again:"
  fi

  read GUESS
  ((GUESS_COUNT++))
done

echo "You guessed it in $GUESS_COUNT tries. The secret number was $SECRET_NUMBER. Nice job!"


USER_DATA=$USER_INFO

if [[ -z $USER_DATA ]]
then
  INSERT_RESULT=$($PSQL "INSERT INTO users(username, games_played, best_game) VALUES('$USERNAME', 1, $GUESS_COUNT)")
else
  GAMES_PLAYED=$(echo $USER_DATA | cut -d '|' -f1)
  BEST_GAME=$(echo $USER_DATA | cut -d '|' -f2)

  ((GAMES_PLAYED++))

  if [[ -z $BEST_GAME || $BEST_GAME -eq 0 || $GUESS_COUNT -lt $BEST_GAME ]]
  then
    BEST_GAME=$GUESS_COUNT
  fi

  UPDATE_RESULT=$($PSQL "UPDATE users
  SET games_played=$GAMES_PLAYED, best_game=$BEST_GAME
  WHERE username='$USERNAME'")
fi



