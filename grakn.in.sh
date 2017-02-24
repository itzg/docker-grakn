export GRAKN_ENGINE_CONFIG="/conf/grakn-engine.properties"

if [ -z $FOREGROUND ]; then
  export FOREGROUND=true
fi

# Check grakn-engine.properties
# Set USE_KAFKA if taskmanager.distributed is true
GRAKN_TASKMANAGER_DISTRIBUTED=$(grep ^taskmanager.distributed= "${GRAKN_ENGINE_CONFIG}"| cut -d '=' -f 2)
if [[ $GRAKN_TASKMANAGER_DISTRIBUTED == "true" ]]; then
    USE_KAFKA=true
fi


# Check grakn.properties
GRAKN_CONFIG="$(grep ^graphdatabase.config= "${GRAKN_ENGINE_CONFIG}"| cut -d '=' -f 2)"

# Set USE_CASSANDRA if factory.internal is Titan
GRAKN_ENGINE_FACTORY=$(grep ^factory.internal= "${GRAKN_CONFIG}"| cut -d '=' -f 2)
if [[ $GRAKN_ENGINE_FACTORY == "ai.grakn.factory.TitanInternalFactory" ]]; then
    USE_CASSANDRA=true
fi
