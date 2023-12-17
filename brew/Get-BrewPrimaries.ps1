# get all brew install pacakges and their dependencies
$brewDepsInstalled = brew deps --installed

# get all the installed packages
$installed = $brewDepsInstalled | % { $_.split(':')[0] }

# get all the unique dependencies
$dependencies = $brewDepsInstalled | % { $_.split(':')[1] } | % { $_.split(' ') } | Sort-Object -Unique

# output only those installed packages that are not dependencies
$installed | Where-Object { $_ -notin $dependencies }
