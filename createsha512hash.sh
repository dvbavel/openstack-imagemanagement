hashpassword=$1
python -c 'import crypt; print crypt.crypt("$hashpassword", "$6$somesalt$")'
