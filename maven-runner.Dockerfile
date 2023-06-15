FROM gh-runner:base

ARG MAVEN_VERSION="3.8.5"

RUN curl https://www-eu.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.zip -L -o /tmp/maven.zip \
    && unzip -qq -d /usr/share /tmp/maven.zip \
    && rm /tmp/maven.zip \
    && ln -s /usr/share/apache-maven-${MAVEN_VERSION}/bin/mvn /usr/bin/mvn

# since the config and run script for actions are not allowed to be run by root,
# set the user to "runner" so all subsequent commands are run as the "runner" user
USER runner