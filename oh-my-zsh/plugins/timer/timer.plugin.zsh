function timer() {
    local OPTIND opt total description

    while getopts "m:t:" opt
    do
        case "$opt" in
        m)  description="$OPTARG" ;;
        t)  total="$OPTARG" ;;
        \?) exit 1 ;;
        esac
    done

    if [[ -z "$total" ]]
    then
        echo "Usage: timer -t <time in minutes> -m <description>"
        return
    fi

    total=$((total*60))

    clear
    echo " $description"

    for ((i=0; i<=total; i++))
    do
        percent=$((i*100/total))
        filled_bar=$((30*percent/100))
        empty_bar=$((30-filled_bar))
        printf -v filled '%*s' "$filled_bar"
        printf -v empty '%*s' "$empty_bar"
        echo -ne "\r ${filled// /█}${empty// /░} $percent%"
        sleep 1
    done
    echo
    spd-say -t female2 -r -30 -p -20 "The timer for $description has finished"
}
