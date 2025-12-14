# 🚀 Quick Start - API Documentation

## View API Documentation (4 Ways)

### Option 1: Live Hosted Documentation (Easiest! 🌐)

**Just visit**: [https://nicechester.github.io/rental-apis](https://nicechester.github.io/rental-apis)

✅ No setup required  
✅ Always up-to-date  
✅ Works on any device  
✅ Share with team instantly

### Option 2: Open HTML Directly
```bash
# macOS
open openapi/index.html

# Linux
xdg-open openapi/index.html

# Windows
start openapi/index.html
```

### Option 3: Serve Locally (Recommended for development)
```bash
# Make script executable (first time only)
chmod +x openapi/serve.sh

# Start server
cd openapi
./serve.sh

# Or specify custom port
./serve.sh 3000
```

Then open: **http://localhost:8000**

### Option 4: Python SimpleHTTPServer
```bash
cd openapi

# Python 3
python3 -m http.server 8000

# Python 2
python -m SimpleHTTPServer 8000
```

Then open: **http://localhost:8000**

---

## What You'll See

**Interactive Swagger UI** with:
- 🎯 Dropdown to select any of 12 services
- 📖 Complete API documentation
- 🧪 "Try it out" for testing endpoints
- 📋 Request/response examples
- 🔍 Schema definitions
- ⚡ Port numbers for each service

---

## Service Endpoints Quick Reference

| Service | Port | Base URL |
|---------|------|----------|
| Auth Service | 8081 | http://localhost:8081/api/v1 |
| Admin Service | 8082 | http://localhost:8082/api/v1 |
| Instrument Service | 8083 | http://localhost:8083/api/v1 |
| Booking Service | 8084 | http://localhost:8084/api/v1 |
| Payment Service | 8085 | http://localhost:8085/api/v1 |
| Messaging Service | 8086 | http://localhost:8086/api/v1 |
| Appraisal Service | 8087 | http://localhost:8087/api/v1 |
| Review Service | 8088 | http://localhost:8088/api/v1 |
| Notification Service | 8089 | http://localhost:8089/api/v1 |
| File Upload Service | 8090 | http://localhost:8090/api/v1 |
| Search Service | 8091 | http://localhost:8091/api/v1 |
| User Service | 8092 | http://localhost:8092/api/v1 |

---

## Test an API

### 1. Start the Service
```bash
cd services/auth-service
mvn spring-boot:run
```

### 2. Open Swagger UI
- Open `index.html` in browser
- Select "Auth Service" from dropdown

### 3. Try an Endpoint
- Click on **POST /auth/register**
- Click **"Try it out"**
- Fill in the request body
- Click **"Execute"**
- See the response!

---

## Example: Test Registration

1. **Start Auth Service**:
```bash
cd services/auth-service
mvn spring-boot:run
```

2. **Open Swagger UI** and select "Auth Service"

3. **Try POST /auth/register** with:
```json
{
  "email": "test@example.com",
  "password": "SecurePass123!",
  "name": "Test User",
  "role": "renter"
}
```

4. **See Response**:
```json
{
  "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "refreshToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "user": {
    "id": "user-123",
    "email": "test@example.com",
    "name": "Test User",
    "role": "renter"
  }
}
```

---

## Using with Postman

### Import OpenAPI Specs

1. Open Postman
2. Click **Import** → **Link** or **File**
3. Select any `.yaml` file from this directory
4. Postman will create a collection with all endpoints!

---

## Using with VS Code

### REST Client Extension

1. Install "REST Client" extension
2. Create `test.http`:

```http
### Register User
POST http://localhost:8081/api/v1/auth/register
Content-Type: application/json

{
  "email": "test@example.com",
  "password": "SecurePass123!",
  "name": "Test User",
  "role": "renter"
}

### Login
POST http://localhost:8081/api/v1/auth/login
Content-Type: application/json

{
  "email": "test@example.com",
  "password": "SecurePass123!"
}

### Get Profile (needs token)
GET http://localhost:8092/api/v1/users/me
Authorization: Bearer {{accessToken}}
```

---

## Validate OpenAPI Specs

```bash
# Install validator
npm install -g @apidevtools/swagger-cli

# Validate a spec
swagger-cli validate openapi/auth-service.yaml

# Validate all specs
for file in openapi/*.yaml; do
  echo "Validating $file..."
  swagger-cli validate "$file"
done
```

---

## Generate Client SDKs

### TypeScript Client
```bash
npm install -g openapi-typescript-codegen

openapi-typescript-codegen \
  --input openapi/auth-service.yaml \
  --output src/clients/auth \
  --client axios
```

### Python Client
```bash
pip install openapi-python-client

openapi-python-client generate \
  --path openapi/auth-service.yaml \
  --output-path clients/python
```

---

## Mock API Server

### Using Prism (Recommended)
```bash
# Install
npm install -g @stoplight/prism-cli

# Start mock server
prism mock openapi/auth-service.yaml

# Server runs at http://localhost:4010
# Try: curl http://localhost:4010/auth/register
```

---

## Troubleshooting

### Swagger UI Not Loading?
- Make sure you're serving the files (not just opening HTML)
- Check browser console for CORS errors
- Use `./serve.sh` or Python HTTP server

### Can't See My Service?
- Check the dropdown in Swagger UI
- Make sure the YAML file exists
- Validate the YAML syntax

### Try It Out Not Working?
- Make sure the service is running on the correct port
- Check the server URL in the YAML file
- Look for CORS issues in browser console

---

## Next Steps

1. ✅ View APIs in Swagger UI
2. ✅ Start a service: `mvn spring-boot:run`
3. ✅ Test endpoints in Swagger UI
4. ✅ Import into Postman
5. ✅ Generate client SDKs
6. ✅ Build your app!

---

**Need Help?**
- Full docs: See `README.md`
- Service code: Check `../services/`
- Database schema: Check `../database/`

**Happy Coding! 🎻**

