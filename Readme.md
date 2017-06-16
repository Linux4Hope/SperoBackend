# SperoBackend
[![Build Status](https://travis-ci.org/Linux4Hope/SperoBackend.svg?branch=master)](https://travis-ci.org/Linux4Hope/SperoBackend)
[![Coverage Status](https://coveralls.io/repos/github/Linux4Hope/SperoBackend/badge.svg)](https://coveralls.io/github/Linux4Hope/SperoBackend)

# [ARCHIVED] Currently not in Development


## Build, Testing, Development

1. Need to have Java 8 installed. This guide will assume you are running Ubuntu
16.04 LTS 64bit. If you don't have the following packages installed globally,
run these commands below:

        sudo apt update
        sudo apt upgrade
        sudo apt install openjdk-8-jdk openjdk-jre maven

If you don't have [Intellij](https://www.jetbrains.com/idea/) installed, please proceed in installing the IDE.

2. Clone this repo.

3. Once Intellij is open, proceed on opening the project using the open project
settings Intellij presents to you on the welcome screen or under `File` in the
application bar.

4. Follow any prompts for importing dependencies. Proceed to build the
dependencies and click `run`.

5. The application should start and should be accessible in your web browser
using the address `localhost:4567`.

6. You may use Intellij to run the unit tests or in the command line of the
project using Maven by running `mvn test`.

7. To run Maven test with Coveralls, add the Coveralls token in `pom.xml`
for a successful run of the tests. To run the test, run
`mvn clean test jacoco:report coveralls:report`. Refer to the documentation on
Coveralls on adding the Coveralls token.
