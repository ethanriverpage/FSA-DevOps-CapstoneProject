# Proof-of-Concept Web-based GameBoy Emulator deployed using GitHub Actions to AWS Amplify

This repository contains the code for building, testing, and deploying a web-based GameBoy emulator, including developing a demonstration GameBoy game using GBDK.
> This was done as part of an assessment for Fullstack Academy. The following information is hypothetical only for the purposes of this assessment.

This project depends on [ethanriverpage/FSA-DevOps-CapstoneCodeBase](https://github.com/ethanriverpage/FSA-DevOps-CapstoneCodeBase) for proper deployment.

### Project Details:
This project is being developed by the FSA Capstone Team for Nintendo European Research & Development SAS (NERD). The purpose of the project is to develop a browser-based Nintendo Game Boy emulator that will enable users to play classic games through a web browser, and allow Nintendo to monetize their retro games.

The team comprises four members: Ethan Page, Alexis Collier, Haider Shaghati, and Donald Hare.

### [Statement of Work](https://github.com/ethanriverpage/FSA-DevOps-CapstoneProject/blob/development/SOW.md)

### [Threat Modeling](https://github.com/ethanriverpage/FSA-DevOps-CapstoneProject/blob/development/THREAT.md)

### Credits:

* [binji](https://github.com/binji) for creating the emulator "binjgb"
* [GBDK](http://gbdk.sourceforge.net/) for creating the necessary development tools
* [AWS CLI](https://aws.amazon.com/cli/) for deployment to S3 & Amplify
* [GitHub Actions](https://github.com/features/actions) for CI/CD pipeline
* [GitHub Actions Secrets](https://docs.github.com/en/rest/actions/secrets) for storing environment variables
