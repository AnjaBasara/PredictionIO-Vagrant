#!/usr/bin/env bash

SETUP_DIR=$HOME/.pio
INSTALL_SCRIPT_PATH='https://raw.githubusercontent.com/AnjaBasara/predictionio/develop/bin/install.sh'

mkdir -p $SETUP_DIR

if [ ! -x "$(command -v pio-start-all)" ]; then

  echo "Installing PredictionIO..."
  bash -e -c "$(curl -sS $INSTALL_SCRIPT_PATH)" 0 -y
  if [ $? -ne 0 ]; then

    echo "ERROR: PredictionIO installation failed."
    echo "ERROR: Please try to destory and re-setup VM again by running (in the same current directory):"
    echo "ERROR: $ vagrant destroy"
    echo "ERROR: (enter y) followed by"
    echo "ERROR: $ vagrant up"
    exit 1

  else

    echo "Finish PredictionIO installation."

  fi

else
  echo "--------------------------------------------------------------------------------"
  echo "PredictionIO already installed. Skip installation."
  echo "--------------------------------------------------------------------------------"
  pio-start-all
  echo "--------------------------------------------------------------------------------"
  echo -e "\033[1;32mPredictionIO VM is up!\033[0m"
  echo -e "\033[1;33mYou could run 'pio status' inside VM ('vagrant ssh' to VM first) to confirm if PredictionIO is ready.\033[0m"
  echo "--------------------------------------------------------------------------------"
fi
