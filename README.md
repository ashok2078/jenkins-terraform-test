  End-to-End Automated CI/CD Pipeline
 (Jenkins | Docker | Terraform | Shell Scripting)

This repository showcases a professional DevOps workflow that automates the deployment of a web application from code commit to a live containerized environment.

   Project Architecture
The pipeline follows a standard "Commit-to-Deploy" model to ensure rapid delivery and high availability.


    Tech Stack & Skills Demonstrated
  Orchestration: Jenkins (Pipeline-as-Code)
  Containerization: Docker (Building custom Nginx-Alpine images)
  IaC Integration: Terraform (Infrastructure validation)
  Scripting: Bash/Shell (Automated testing and environment setup)
  SCM: Git/GitHub

    Key Pipeline Stages
1. Source: Automated checkout of the latest code from GitHub.
2. Validation: Verifying tool versions (Terraform) and setting execution permissions for scripts.
3. Pre-Deployment Check: Validating the Docker daemon environment and user permissions.
4. Build: Creating a lightweight production-grade image using the `Dockerfile`.
5. Auto-Deploy: Performing zero-downtime deployment by replacing old containers with the latest version on port `8081`.

    Real-World Troubleshooting (Resolved during Development)
I have successfully addressed several industry-common challenges in this project:
Linux Permissions:** Resolved `docker.sock` permission denied errors by managing Linux user groups (`usermod -aG docker jenkins`).
Exit Codes Management: Debugged and fixed script execution errors (Exit Code 126/127).
Pipeline Resilience:  Implemented `|| true` logic to prevent pipeline failures during initial cleanup stages.
  Docker Context: Optimized image building by managing correct naming conventions and build context.

    Deployment Access
Once the Jenkins build is **SUCCESS** the application is accessible at:
`http://192.168.20.128:8081`
## Advanced Automation: Zero-Touch CI/CD
In the latest update, I have transitioned from manual builds to a "Fully Automated Deployment model":

GitHub Webhooks Integration: Configured webhooks to trigger the Jenkins pipeline automatically on every `git push`.
Secure Tunneling with Ngrok: Implemented an Ngrok tunnel to expose the local Jenkins VM to the internet, allowing GitHub to send real-time event payloads.
Event-Driven Architecture: The system now identifies code changes instantly, reducing the deployment time from minutes to seconds.

       How it works now
1. Developer pushes code to GitHub.
2. GitHub sends a POST request via "Ngrok Tunnel".
3. "Jenkins" receives the signal and starts the build immediately.
4. "Docker" redeploys the updated container.

---
📫 **Connect with me:** [Insert your LinkedIn Profile Link here]
