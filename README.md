# Credit Card Validator

To get the app running locally simply run: `docker run -p 3000:3000 brandonburton/credit_card_validator`

Once the app is running you can visit `localhost:3000` in your browser to access it.

## What Does It Do

Given a credit card number, the app will try to identify which company the card belongs
to. It will then validate whether or not the number passes the [Luhn check](https://en.wikipedia.org/wiki/Luhn_algorithm).
If it does, the card number is valid.

## Currently Supported Card Companies

- Visa
- Mastercard
- Amex
- Discover

