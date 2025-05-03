FROM python:3.11

# Expose the correct port for Streamlit
EXPOSE 8501

# Set working directory and copy files
WORKDIR /app
COPY . /app

# Upgrade pip and install dependencies
RUN pip install --no-cache-dir -U pip
RUN pip install --no-cache-dir -r requirements.txt

# Install required NLTK data
RUN python -c "import nltk; nltk.download('punkt'); nltk.download('punkt_tab'); nltk.download('stopwords')"

# Run Streamlit app
ENTRYPOINT ["streamlit", "run", "home.py", "--server.port=8501", "--server.address=0.0.0.0"]