# Week 6 GA Sashi Adhithya 21f3000611

## Objective
Build and deploy a FastAPI application that predicts iris species using a trained ML model. The application must be containerized, pushed to Artifact Registry, and deployed on GKE using GitHub Actions and CML.

## Steps Followed
1. **Developed API** using FastAPI (`main.py`)
2. **Downloaded model** from MLflow registry
3. **Dockerized** the app with `Dockerfile` and `requirements.txt`
4. **Built & Tagged Docker Image**
5. **Pushed Image** to Artifact Registry after fixing IAM issues
6. **Deployed to GKE** using `kubectl` and YAML configuration
7. **Integrated GitHub Actions + CML** for automated CD pipeline
8. **Tested Live API Endpoint** with `curl`

## GCP Components Used
- Vertex AI Workbench
- Artifact Registry
- Google Kubernetes Engine (GKE)
- GitHub Actions
- Cloud IAM

## Challenges and Fixes
- IAM Permission issues (fixed with policy binding)
- Kubernetes ImagePull errors (fixed Docker tag)
- Network/port mapping errors (fixed service YAML and uvicorn port)

## Final Outcome
API successfully deployed and running at:
`http://34.30.216.9/predict/`
