# ✅ Image node
FROM node:22-alpine

WORKDIR /app

# ✅ Copie des dépendances d'abord (cache)
COPY src/package*.json ./
RUN npm install --omit=dev && npm cache clean --force

COPY src/ ./

# ✅ Utilisateur non-root (Alpine)
RUN addgroup -g 1001 nodejs && \
    adduser -D -u 1001 -G nodejs nodejs && \
    chown -R nodejs:nodejs /app

USER nodejs

EXPOSE 3000

# ✅ Healthcheck
HEALTHCHECK --interval=30s --timeout=3s \
    CMD node -e "require('http').get('http://localhost:3000/health', (r) => process.exit(r.statusCode === 200 ? 0 : 1))"

CMD ["node", "server.js"]