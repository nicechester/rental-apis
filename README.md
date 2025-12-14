# OpenAPI Specifications
## P2P String Instrument Rental Platform

This directory contains OpenAPI 3.0 specifications for all microservices in the platform.

---

## 🎯 Quick Start - Interactive API Documentation

### 🌐 Live Documentation (Easiest!)

**Visit the hosted documentation**: [https://nicechester.github.io/rental-apis](https://nicechester.github.io/rental-apis)

No setup required - explore all 12 services instantly! 🚀

### 💻 Local Documentation

**Open `index.html` in your browser** to explore all APIs with Swagger UI locally:

```bash
# Open in default browser
open openapi/index.html

# Or serve with a local server
cd openapi
python3 -m http.server 8000
# Then visit: http://localhost:8000
```

**Features**:
- ✅ Interactive API exploration
- ✅ Try out endpoints directly
- ✅ View request/response schemas
- ✅ Select between 12 services
- ✅ Beautiful, modern UI
- ✅ No installation required!

---

## Available Services

| Service | File | Port | Description |
|---------|------|------|-------------|
| Authentication | `auth-service.yaml` | 8081 | User authentication, registration, session management |
| User | `user-service.yaml` | 8092 | User profiles, favorites, balance management |
| Instrument | `instrument-service.yaml` | 8083 | Instrument listings, availability, CRUD |
| Booking | `booking-service.yaml` | 8084 | Booking management, status workflow |
| Payment | `payment-service.yaml` | 8085 | Payments, refunds, payouts, escrow |
| Messaging | `messaging-service.yaml` | 8086 | Conversations, real-time messaging |
| Appraisal | `appraisal-service.yaml` | 8087 | Instrument appraisals, appraiser workflows |
| Review | `review-service.yaml` | 8088 | Reviews and ratings |
| Notification | `notification-service.yaml` | 8089 | Multi-channel notifications |
| File Upload | `file-upload-service.yaml` | 8090 | Image upload, processing, CDN |
| Search | `search-service.yaml` | 8091 | Full-text search, filtering, discovery |
| Admin | `admin-service.yaml` | 8082 | Platform administration, moderation |

---

## Tools & Visualization

### Swagger UI (Online)
View and interact with the APIs:
```bash
# Visit https://editor.swagger.io/
# Copy and paste the YAML content
```

### Swagger UI (Local)
```bash
npm install -g swagger-ui-watcher
swagger-ui-watcher openapi/auth-service.yaml
```

### Redoc (Static Documentation)
```bash
npm install -g redoc-cli
redoc-cli bundle openapi/auth-service.yaml -o docs/auth-service.html
```

### Postman Collection
Import OpenAPI specs directly into Postman:
1. Open Postman
2. Click Import → Link
3. Paste URL or upload YAML file

### Code Generation

#### Generate TypeScript Client
```bash
npm install -g openapi-typescript-codegen
openapi-typescript-codegen --input openapi/auth-service.yaml --output ./src/clients/auth
```

#### Generate Python Client
```bash
pip install openapi-python-client
openapi-python-client generate --path openapi/auth-service.yaml
```

#### Generate Server Stubs
```bash
# Node.js/Express
npx @openapitools/openapi-generator-cli generate \
  -i openapi/auth-service.yaml \
  -g nodejs-express-server \
  -o server/auth

# Python/Flask
openapi-generator-cli generate \
  -i openapi/auth-service.yaml \
  -g python-flask \
  -o server/auth
```

## API Testing

### Using Newman (Postman CLI)
```bash
# Convert OpenAPI to Postman collection
npm install -g openapi-to-postmanv2
openapi2postmanv2 -s openapi/auth-service.yaml -o auth-collection.json

# Run tests
newman run auth-collection.json -e environment.json
```

### Using Dredd (API Testing)
```bash
npm install -g dredd
dredd openapi/auth-service.yaml http://localhost:3000
```

## Validation

### Validate OpenAPI Specs
```bash
npm install -g @apidevtools/swagger-cli
swagger-cli validate openapi/auth-service.yaml
```

### Lint OpenAPI Specs
```bash
npm install -g @stoplight/spectral-cli
spectral lint openapi/auth-service.yaml
```

## Documentation Generation

### Generate Complete Documentation Site
```bash
# Install
npm install -g widdershins
npm install -g shins

# Generate Markdown
widdershins openapi/auth-service.yaml -o docs/auth.md

# Convert to HTML
shins --inline -o docs/auth.html docs/auth.md
```

## Mock Servers

### Prism (HTTP Mock Server)
```bash
npm install -g @stoplight/prism-cli
prism mock openapi/auth-service.yaml
# Server runs at http://localhost:4010
```

### Mockoon
1. Download Mockoon: https://mockoon.com/
2. Import OpenAPI spec
3. Start mock server

## Integration

### Backend Implementation Checklist

For each service, implement:
- [ ] All endpoints defined in OpenAPI spec
- [ ] Request validation (using schema)
- [ ] Response formatting (matching schema)
- [ ] Authentication (JWT validation)
- [ ] Authorization (role-based access)
- [ ] Error handling (matching error schemas)
- [ ] Rate limiting (as documented)
- [ ] Logging and monitoring
- [ ] API documentation (auto-generated)

### Frontend Integration

```typescript
// Example: Using generated TypeScript client
import { AuthService } from './clients/auth';

const authService = new AuthService({
  baseUrl: 'https://api.laviolin.com/v1',
  token: 'your-jwt-token'
});

const response = await authService.login({
  email: 'user@example.com',
  password: 'password123'
});
```

## Environment Variables

```bash
# API Base URLs
API_BASE_URL=https://api.laviolin.com/v1
WS_BASE_URL=wss://api.laviolin.com/ws

# Service-specific URLs (if microservices)
AUTH_SERVICE_URL=https://auth.laviolin.com/v1
USER_SERVICE_URL=https://user.laviolin.com/v1
INSTRUMENT_SERVICE_URL=https://instrument.laviolin.com/v1
# ... etc
```

## Common Request Examples

### Authentication
```bash
# Register
curl -X POST https://api.laviolin.com/v1/auth/register \
  -H "Content-Type: application/json" \
  -d '{
    "email": "user@example.com",
    "password": "SecurePass123!",
    "name": "John Doe",
    "role": "renter"
  }'

# Login
curl -X POST https://api.laviolin.com/v1/auth/login \
  -H "Content-Type: application/json" \
  -d '{
    "email": "user@example.com",
    "password": "SecurePass123!"
  }'
```

### Authenticated Requests
```bash
# Get user profile
curl -X GET https://api.laviolin.com/v1/users/me \
  -H "Authorization: Bearer YOUR_JWT_TOKEN"

# Create instrument listing
curl -X POST https://api.laviolin.com/v1/instruments \
  -H "Authorization: Bearer YOUR_JWT_TOKEN" \
  -H "Content-Type: application/json" \
  -d @instrument.json
```

## Best Practices

### API Versioning
- Current version: `/v1/`
- Future versions: `/v2/`, `/v3/`, etc.
- Maintain backward compatibility for at least one version

### Error Handling
All errors follow consistent format:
```json
{
  "error": "Error Type",
  "message": "Human-readable error message",
  "fields": {
    "fieldName": "Field-specific error"
  }
}
```

### Pagination
Paginated endpoints include:
```json
{
  "data": [...],
  "pagination": {
    "currentPage": 1,
    "totalPages": 10,
    "totalItems": 200,
    "itemsPerPage": 20,
    "hasNextPage": true,
    "hasPreviousPage": false
  }
}
```

### Rate Limiting
Response headers include:
```
X-RateLimit-Limit: 100
X-RateLimit-Remaining: 95
X-RateLimit-Reset: 1234567890
```

## CI/CD Integration

### GitHub Actions Example
```yaml
name: API Validation
on: [push, pull_request]
jobs:
  validate:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Validate OpenAPI specs
        run: |
          npm install -g @apidevtools/swagger-cli
          for file in openapi/*.yaml; do
            swagger-cli validate "$file"
          done
```

## Contributing

When updating OpenAPI specs:
1. Validate spec: `swagger-cli validate openapi/service-name.yaml`
2. Test with mock server: `prism mock openapi/service-name.yaml`
3. Update changelog
4. Regenerate client SDKs if needed
5. Update API documentation

## Additional Resources

- **OpenAPI Specification**: https://spec.openapis.org/oas/v3.0.3
- **Swagger Editor**: https://editor.swagger.io/
- **Redoc**: https://github.com/Redocly/redoc
- **Prism Mock Server**: https://stoplight.io/open-source/prism
- **OpenAPI Generator**: https://openapi-generator.tech/

## Support

For API-related questions:
- Email: api@laviolin.com
- Documentation: https://docs.laviolin.com
- Status: https://status.laviolin.com

