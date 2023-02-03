format="rdf-star"
context="./context/john.n3"
access="access"
quiet="--quiet"
core="core"
ruleset="surfaces-language"

while test $# -gt 0; do
    case "$1" in
        -h|--help)
            echo "Test the different serializations for Solid pod resources for data access and retrieval"
            echo " "
            echo "options:"
            echo "-h, --help                show brief help"
            echo "-f, --format=format       one of: [rdf-star, n3, surfaces]"
            echo "-c, --context=context     context file. defaults to  ./context/context_valid.n3"
            echo "-d, --data                output data instead of access rights"
            exit 0
            ;;
        -f|--format)
            shift
            format=$1
            shift
            ;;
        -c|--context)
            shift
            context=$1
            shift
            ;;
        -d|--data)
            shift
            access="data"
            ;;
        -v|--verbose)
            shift
            quiet=""
            ;;
        -t|--test)
            shift
            core="test"
            ;;
        -r|--rules)
            shift
            ruleset="policy-language"
            ;;
        *)
            echo "$1 is not a recognized flag!"
            exit 1
            ;;
    esac
done

echo "Running test for - format: $format - context: $context - output data: $output_data"
echo "Command: eye --nope $quiet --blogic ./${core}/* $context ./rules/$ruleset/$format/wac-$access.n3 ./data/$format/*"
echo ""
eye --nope $quiet --blogic ./${core}/* $context ./rules/$ruleset/$format/wac-$access.n3 ./data/$format/*