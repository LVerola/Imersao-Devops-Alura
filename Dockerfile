# SELECIONA A IMAGEM DO PYTHON BASE PARA O DOCKER
FROM python:3.11-slim-buster

# Define o diretório de trabalho dentro do container
WORKDIR /app

# Copia o arquivo de requisitos para instalar as dependências
COPY requirements.txt .

# Instala as dependências do projeto
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante dos arquivos do projeto para o diretório de trabalho
COPY . .

# Define a variável de ambiente para o FastAPI
EXPOSE 8000

# Comando para iniciar o servidor FastAPI usando Uvicorn
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]

# CRIE O CONTAINER COM O COMANDO ABAIXO
# docker build -t api .

# VERIFIQUE SE O CONTAINER FOI CRIADO COM O COMANDO ABAIXO
# docker images

# INICIE O CONTAINER COM O COMANDO ABAIXO
# docker run -p 8000:8000 api