#!/bin/bash

# Run a generic Main method for testing purposes.  To use this script do the following:
# 1) Inside a maven project create an src/main/java/Main.java class
# 2) mvn dependency:copy
# 3) mvn compile
# 4) run.sh <args>
#
# If any dependencies need to be updated they can be updated by:
# 1) rm target/dependency/<jarfile>
# 2) (cd <projectDirectory; mvn clean package -DskipTests) && cp <projectDirectory>/target/<jarfile> target/dependencies
# 3) run.sh <args>


JOPTS="$LOG4J_CONF $MEM_CONF $DEBUG_OPTS"

# Make sure we are in a maven project
if [[ -f ./pom.xml ]]; then

    # if there is no target directory, create it
    if [[ ! -d ./target ]]; then
        mvn compile dependency:copy-dependencies -DskipTests -Dinvoker.skip=true
    fi

    # if there is no dependency directory, copy dependencies
    if [[ ! -d ./target/dependency ]]; then
        ~/bin/copydep
    fi

    # Find files with a main method and run them
    files=$(grep -l 'public static void main(' $(find . -name \*.java))
    classes=''
    multiple=0
    for f in $files; do
        pkg=$(grep '^package ' $f | cut -d\  -f2 | cut -d\; -f1)
        className=$(basename $f '.java')
        if [[ ! -z $classes ]]; then
            multiple=1
        fi
        classes="$classes ${pkg}.$className"
    done

    class=$classes
    if [[ multiple -eq 1 ]]; then
        echo
        echo "Multiple main methods found!"
        echo "Select which class to run:"
        select class in $classes; do
            break;
        done
    fi

    echo java $JOPTS -cp target/dependency/*:target/classes $class $@
    java $JOPTS -cp target/classes:target/dependency/* $class $@

fi
