mkdir my_lambda_function
cd my_lambda_function
python3 -m venv venv
source venv/bin/activate
# pip install pyspark
pip install pandas
pip install numpy
cp lambda/lambda.py .
deactivate
zip -r my_lambda_function.zip *
