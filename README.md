
![logo](https://github.com/bjanderson70/sf-logging-only-edx/blob/master/imgs/LoggingOnly.png)
# sf-logging-only-edx
Logging Only concerns for apex code [Use the main sf-cross-cutting-concerns for all funcitonality]. I **will not be supporting externally** this version.

This code designed to encapsulate common logging concerns . See the [Wiki](https://github.com/bjanderson70/sf-logging-only-edx/wiki) for more informaiton on logging aspects.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. 
See deployment for notes on how to deploy the project on a live system.

### Prerequisites

SFDX package

## Running the tests

The unit tests have a minimum of 96% code coverage. Tests can be invoked from favortite case tool.
In Salesforce Org, navigate to **Setup->Apex Classes** and run all tests. 

1. First, push into scratch or, **sfdx force:source:push -u WFLogging-Scratch-Org -w 30**.
2. Second, run tests, **sfdx force:apex:test:run -y -c -r human** (assumes only one scratch org; otherwise, will need -u parameter)

### And coding style tests

All code, files and objects related to Apex Cross-Cutting Concerns are prefixed with 'accc'

## Deployment or Retrieval

To deploy/install select the button below

 **Retrieve From your Org**
 1. clone git repo
 2. cd sf-logging-only-edx
    - may need to oauth to Org
 3. mkdir ./mdapipkg # if not already defined
 4. sfdx force:mdapi:retrieve -r ./mdapipkg -u <TargetUserName> -k manifest/package.xml
 
  **Deploy To your Org**
 1. clone git repo
 2. cd sf-logging-only-edx 
 - may need to oauth to Org
 3. sfdx force:source:deploy -p force-app/

## Apex Docs
If you download **CCCDocs** directory and navigate to _ApexDocumentation_ directory and bring up _index.htm_ in the browser you will get the JavaDoc-like information. The documentation will also link to the Wiki

## Contributing

Please read [Contributing](Contributing) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

version 0.9.9.1

## Authors

* **Bill Anderson** 

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details

## Acknowledgments



