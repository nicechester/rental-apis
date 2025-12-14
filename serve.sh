#!/bin/bash
# Serve OpenAPI documentation locally

PORT=${1:-8000}

echo "=========================================="
echo "🎻 La Violin - API Documentation"
echo "=========================================="
echo ""
echo "Starting HTTP server on port $PORT..."
echo ""
echo "📖 Open in your browser:"
echo "   http://localhost:$PORT"
echo ""
echo "Press Ctrl+C to stop the server"
echo "=========================================="
echo ""

# Check if Python 3 is available
if command -v python3 &> /dev/null; then
    python3 -m http.server $PORT
elif command -v python &> /dev/null; then
    python -m SimpleHTTPServer $PORT
else
    echo "❌ Error: Python is not installed"
    echo "Please install Python 3 to run this server"
    exit 1
fi

