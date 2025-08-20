# Imagem base otimizada para desenvolvimento com Node.js
FROM node:20-alpine

# Diretório de trabalho dentro do container
WORKDIR /app

# Copiar arquivos de dependências para aproveitar cache no build
COPY package*.json ./

# Instalar dependências
RUN npm install

# Copiar o restante do código da aplicação
COPY . .

# Expor a porta padrão do Next.js
EXPOSE 3000

# Iniciar servidor de desenvolvimento
CMD ["npm", "run", "dev"]
