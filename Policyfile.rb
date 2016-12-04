name "curl-windows"
default_source :supermarket
run_list "curl-windows::default"
cookbook "curl-windows", path: "."
#cookbook "curl-windows", github: "taylormonacelli/curl-windows"
