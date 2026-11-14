name=${0##*/}
page=$SPEEDPDF_PAGE
wpm=$SPEEDPDF_WPM
multiword=$SPEEDPDF_MULTIWORD

usage() {
  echo "usage: $name <file.pdf> [-p page] [-w wpm] [-m]" >&2
  exit 2
}

die() {
  echo "$name: $1" >&2
  exit 1
}

[ $# -ge 1 ] || usage
pdf=$1
shift

while getopts "p:w:m" opt; do
  case $opt in
    p) page=$OPTARG ;;
    w) wpm=$OPTARG ;;
    m) multiword=1 ;;
    *) usage ;;
  esac
done

[ -f "$pdf" ] || die "not a file: $pdf"
[[ $page =~ ^[0-9]+$ ]] || die "page must be a number: $page"
[[ $wpm =~ ^[0-9]+$ ]] || die "wpm must be a number: $wpm"

speedread_args=(-w "$wpm")
[ -z "$multiword" ] || speedread_args+=(-m)

text=$(pdftotext -f "$page" "$pdf" -)
[ -n "$text" ] || die "no extractable text from page $page (scanned PDF?)"

speedread "${speedread_args[@]}" <<< "$text"
