#   James Wylde

wmic product get name, version

product where version="7.5.1.2" call uninstall /y

product where name="8x8 Work"

wmic product where name="Cofense Reporter" call uninstall /y

wmic product where name="cape pack v2.15" call uninstall /y
