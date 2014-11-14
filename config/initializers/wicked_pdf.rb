# NOTE: Script for wkhtmltopdf.sh
# xvfb-run -a -s "-screen 0 1366x786x16" wkhtmltopdf "$@"
WickedPdf.config = {
  #:wkhtmltopdf => '/usr/local/bin/wkhtmltopdf',
  #:layout => "pdf.html",
  # use script in deployment server
  exe_path: '/usr/local/bin/wkhtmltopdf.sh'
  # :exe_path => '/usr/bin/wkhtmltopdf'
}
