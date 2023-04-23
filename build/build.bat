dpkg-scanpackages.py -m debs > Packages

.\bzip2.exe -k -f .\Packages


 python3 .\dpkg-scanpackages.py -m .\debs\ > .\Packages