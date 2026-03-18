# ✅ Image Debian slim (plus stable et sans vulnérabilités Alpine)
FROM node:18-bullseye-slim

WORKDIR /app

# ✅ Copie des dépendances d'abord (cache)
COPY src/package*.json ./
RUN npm install --omit=dev && npm cache clean --force

COPY src/ ./

# ✅ Utilisateur non-root
RUN groupadd -g 1001 nodejs && \
    useradd -u 1001 -g nodejs nodejs && \
    chown -R nodejs:nodejs /app

USER nodejs

EXPOSE 3000

# ✅ Healthcheck
HEALTHCHECK --interval=30s --timeout=3s \
    CMD node -e "require('http').get('http://localhost:3000/health', (r) => process.exit(r.statusCode === 200 ? 0 : 1))"

CMD ["node", "server.js"]