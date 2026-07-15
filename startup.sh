#!/bin/bash

# Start Neo4j
sudo systemctl start neo4j
sleep 5  # give Neo4j time to initialize

# Start Backend
cd ~/projects/alarm-normalizer/backend
source ~/projects/alarm-normalizer/venv/bin/activate  # adjust path if different
nohup python -m uvicorn main:app --host 0.0.0.0 --port 8000 > /tmp/backend.log 2>&1 &

# Start Frontend
cd ~/projects/alarm-normalizer/frontend
nohup npm run dev -- --host > /tmp/frontend.log 2>&1 &

echo "AIOps stack started. Check /tmp/backend.log and /tmp/frontend.log"
