# Set permissions
set_perm_recursive $MODPATH 0 0 0755 0644
set_perm_recursive $MODPATH/vendor 0 0 0755 0755
set_perm_recursive $MODPATH/system 0 0 0755 0755

find /system/vendor/ -name "*thermal*" -type f -print0 | while IFS= read -r -d '' nama;do if [[ "$nama" == *.conf ]];then mkdir -p "$MODPATH/$nama";rmdir "$MODPATH/$nama";touch "$MODPATH/$nama";fi;done >/dev/null 2>&1