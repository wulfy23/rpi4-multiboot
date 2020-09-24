#!/bin/sh


#^notreally@curl sh
#echo "THIS IS A TESTING NON FUNCTIONAL SCRIPT"; exit 0
#https://raw.github.com/wulfy23/rpi4-multiboot/master/multiboot/current/openwrt/snapshot.tar.gz
#https://raw.githubusercontent.com/wulfy23/rpi4-multiboot/master/multiboot/current/openwrt/snapshot.tar.gz
#echo "https://raw.github.com/wulfy23/rpi4-multiboot/master/multiboot/current/openwrt/snapshot.tar.gz"
#echo "$gRbasep/$GmbSUB/current/openwrt/snapshot.tar.gz"
#https://raw.githubusercontent.com/wulfy23/rpi4-multiboot/master/multiboot/setup/rpi-multiboot.sh
#gRurepo="wulfy23/rpi4"; GmbSUB="builds/multiboot"

#v1 RAMFSv="/etc/custom/4-model-b/ramfs"
#v2 setinline<@>>>init RAMFSout="/etc/custom/4-model-b/ramfs" #v2@@@?ini?@@@outLIVE???
#v3



#ROOT_CMD="$(sed -n 's|^.*root=\(\S\+\)\s.*|\1|p' /boot/cmdline.txt)"
#######
#blkid | sed -n '/dev\/mmcblk0p2/s/.*\ PARTUUID=\"\([^\"]*\)\".*/\1/p'
#sed -i -e "s|PARTUUID=$FSTAB_CMD|/dev/mapper/sdcard|g" /etc/fstab
########
#sed -i '$s/$/ cryptdevice=\/dev\/mmcblk0p2:sdcard/' /boot/cmdline.txt
########
#ROOT_CMD="$(sed -n 's|^.*root=\(\S\+\)\s.*|\1|p' /boot/cmdline.txt)"
#sed -i -e "s|$ROOT_CMD|/dev/mapper/sdcard|g" /boot/cmdline.txt








#@??? . /lib/functions.sh . /lib/upgrade/common.shNOPE> # dependencies :>>> mount-utils partx-utils <<< block-mount fdisk
#if mountpoint -q /tmp/rootfs ; then
#[root@dca632 /usbstick 42°]# mountpoint -d /boot #179:1
#[root@dca632 /usbstick 42°]# mountpoint -x /dev!
#[root@dca632 /usbstick 41°]# cat /usr/lib/opkg/info/mount-utils.list
#/usr/bin/mountpoint
#/usr/bin/mount
#/usr/bin/umount
#/usr/bin/findmnt




testrootfsvianoncmdline() {

    mountpoint -d /
    grep $(mountpoint -d /) /proc/1/mountinfo

}




#cat $(find /proc/ | grep mountinfo | grep -v '/task') #allsame

#findmnt -n -S UUID=ff313567-e9f1-5a5d-9895-3ba130b4a864
#[root@dca632 /usbstick 41°]# findmnt / ##### #findmnt -A -r
#TARGET SOURCE         FSTYPE OPTIONS #/      /dev/mmcblk0p2 ext4   rw,noatime
# -n, --noheadings       don't print column headings
#-P = format
# -S, --source <string>  the device to mount (by name, maj:min,
#                          LABEL=, UUID=, PARTUUID=, PARTLABEL=)
#                           -T, --target <path>    the path to the filesystem to use
###########################################################################################################3
#proc mountinfo
#find /sys/devices/platform | grep block | grep uevent
#find /sys/devices/platform | grep block | grep 'dev$'
###########
#/sys/devices/platform/emmc2bus/fe340000.emmc2/mmc_host/mmc0/mmc0:aaaa/block/mmcblk0/uevent:MAJOR=179
#/sys/devices/platform/emmc2bus/fe340000.emmc2/mmc_host/mmc0/mmc0:aaaa/block/mmcblk0/dev:179:0
#/sys/devices/platform/emmc2bus/fe340000.emmc2/mmc_host/mmc0/mmc0:aaaa/block/mmcblk0/mmcblk0p1/uevent:MAJOR=179
#/sys/devices/platform/emmc2bus/fe340000.emmc2/mmc_host/mmc0/mmc0:aaaa/block/mmcblk0/mmcblk0p1/dev:179:1
#/sys/devices/platform/emmc2bus/fe340000.emmc2/mmc_host/mmc0/mmc0:aaaa/block/mmcblk0/mmcblk0p2/uevent:MAJOR=179
#/sys/devices/platform/emmc2bus/fe340000.emmc2/mmc_host/mmc0/mmc0:aaaa/block/mmcblk0/mmcblk0p2/dev:179:2







PREREQ="fdisk blkid" #PREREQ="grep cut sed parted fdisk findmnt partprobe"




#note: technically *ramfs.sh* are special.bin only? > 70%logic used here too
######################## handle updated files from refresh back into normal fs || >>> . /boot ???
if [ -f /boot/ramfs.func.sh ] && [ ! -f /etc/custom/ramfs/ramfs.func.sh ]; then
    echo "Updating: /etc/custom/ramfs/ramfs.func.sh"; sleep 1
    mkdir -p /etc/custom/ramfs/
    cp /boot/ramfs.func.sh /etc/custom/ramfs/ramfs.func.sh

elif [ -f /boot/ramfs.func.sh ] && [ -f /etc/custom/ramfs/ramfs.func.sh ]; then
    if cmp -s /boot/ramfs.func.sh /etc/custom/ramfs/ramfs.func.sh; then
        : #echo "cmp -s /boot/ramfs.func.sh /etc/custom/ramfs/ramfs.func.sh = 0"
    else
        echo "Updatingnewer: /etc/custom/ramfs/ramfs.func.sh"; sleep 1
        echo "cmp -s /boot/ramfs.func.sh /etc/custom/ramfs/ramfs.func.sh = 1"
        #cp -f /boot/ramfs.func.sh /etc/custom/ramfs/ramfs.func.sh
    fi
else
    #!getsthisscript echo ">>> please run rpi-multi.sh-getfiles to download core files"
    #ISREALLYVANILLA=1
    #$0 init; exit 0

    #if [ "$1" != "init" ]; then
    #    echo "running >>> $0 init"
    #    $0 init
    #    exit 0
    #else
        echo "no-core-files>>> $0 init"
        #exit 0
    #fi

fi





Dupd="$(date +%Y%M%d)" #@early repocheckFF





#@@@>sdROOTFSd???
sdROOTFS="/dev/sda2" #NOTE: > cmdline.txt@boot/os3=non-destructive@init<part/formatterinramfs-skipsthisfornow EDITIFNEEDEDTHO



gRurepo="wulfy23/rpi4-multiboot"
gRbasep="https://raw.githubusercontent.com/${gRurepo}"
gRbasep="${gRbasep}/master"
GmbSUB="multiboot"

LATESTIMG="$gRbasep/$GmbSUB/current/openwrt/snapshot.tar.gz"





############# TEMPat1 > [ -n "DEBUG" ] && dbgslp=1 #z@:-0
dbgslp=1 #!Q!



#NB:20200916>hardcoded>install Z>os99 UPDATETOTHIS
restoreOSdefault="os99" #os99=baseos<onlyusedwhenneworwecantfindsuitableANDtoggleOSpersist = z #TOPFORNOWTESTEDtoggleOSpersist=1 #@@@





rm /tmp/blkid 2>/dev/null #@blkidmulti||BLKID
if [ ! -f /tmp/blkid ]; then blkid > /tmp/blkid; fi
BLKID="cat /tmp/blkid"








echU() {
    if [ ! -z "$DEBUG" ]; then
        echo "${*}"
        sleep ${dbgslp:-0}
    fi
}




fails() { echo "${*}" && exit 1; }
msgexit() { echo "${*}"; exit 1; }










prereqcheka() {
FN="prereqcheka"

#echo "$FN VERBOSE-manual-ON"; VERBOSE=1

    if [ -f /root/.$(basename $0).prereq ]; then
		[ -n "$VERBOSE" ] && echo "V> $PREREQ@/root/.$(basename $0).prereq [ok]"
        return 0
    fi

    for COMMAND in $PREREQ; do
        if ! command -v $COMMAND > /dev/null; then
            echo "$COMMAND [nope]"
            MISSINGCOMMANDS="${MISSINGCOMMANDS} $COMMAND" #FAIL_REASON="$COMMAND not found"; return 1
		else
		    [ -n "$VERBOSE" ] && echo "V> $COMMAND [ok]"
        fi
    done

    if [ ! -z "$MISSINGCOMMANDS" ]; then
		#[ -n "$VERBOSE" ] && echo "$MISSINGCOMMANDS [please-install]"
		echo "$MISSINGCOMMANDS [please-install]"
        return 1
    fi

    touch /root/.$(basename $0).prereq
    return 0
}




#MOVEDHIGH!!!!!!!!!!!!!!!!!! CALL VERY LATE !!!!!!!!!!!!!!!!!!!!!!!!!
################ IF WE ARE DOWN THIS FAR WE MUST BE INIT > ADD A DOINIT or MIGHT be REFRESH Too #if [ ! -z "$DOINIT" ]; then

gitdlcorefiles() { #and extract etc was inline

if [ ! -z "$gRTAR" ]; then

    [ -z "$gRTARn" ] && fails "need gRTARn"
    [ -z "$tarROOT" ] && fails "need tarROOT"

    echU "Downloading git-tar: $gRTAR"
    if ! curlgitfile "$gRTAR" "/tmp/${gRTARn}"; then
        fails "MULTIBOOT-TAR-DL... [fail:$ISSUES:$dlISSUES]" #fails "MULTIBOOT-TAR-DL... [fail:$ISSUES:$dlISSUES] $gRTARn"
    fi


    echU "Extracting /tmp/${gRTARn} > $tarROOT >>> tar -xvzf /tmp/${gRTARn} -C $tarROOT"
    #tar -xvzf /tmp/${gRTARn} -C $tarROOT
    if extractatar "/tmp/${gRTARn}" "$tarROOT"; then
        if [ -z "$VERBOSE" ]; then echo "${gRTARn} > $tarROOT [complete]" ; fi
            #check for a 'runme.sh in tarroot?'
    else
        fails "${gRTARn} > $tarROOT [failed"
    fi

fi
#runascript "/tmp/gitscript"; retval=$0 #can pass VERBOSE here too
#if [ -z "$DEBUG" ]; then echU "nondbg rm /tmp/gitscript" && echU rm /tmp/gitscript 2>/dev/null; fi




#DEBUG=1
if [ ! -z "$gRSCR" ]; then #STANDALONE KEEPING AS SEPERATE BLOCK @> DLPHASE #if [ ! -z "$VANILLA" ] && [ -z "$ISSUES" ]; then

    #@@@ every run || .ff || refresh versioncompare/report?>@refresh
    #GITPATH
    gRAMFS="$gRbasep/$GmbSUB/setup/special.bin"
    RAMFSout="/etc/custom/4-model-b/ramfs"
    if [ -f "$RAMFSout" ]; then echU "Replacing: $RAMFSout"; else echU "Creating: $RAMFSout"; fi

    echU "Downloading ramfs: $gRAMFS"
    if ! curlgitfile "$gRAMFS" "${RAMFSout}"; then
        fails "ramfsdl..."
    else

	echo "ramfs: $gRAMFS > $RAMFSout [ok]"; #echU "ramfs: $gRAMFS > $RAMFSout [ok]"

	if [ -z "$VANILLA" ]; then
		echo "$RAMFSout > /boot/os0/kernel8.img"
		cp $RAMFSout /boot/os0/kernel8.img
	else
		echo "$RAMFSout > /boot/os0/kernel8.img [skip-> $0 init]"
	fi

     fi


    #set -x df -lt > if bin/sh
    if ! curlgitfile "$gRbasep/$GmbSUB/setup/rpi-multiboot.sh" "/bin/rpi-multiboot.sh"; then
        fails "failed-dl: $gRbasep/$GmbSUB/setup/rpi-multiboot.sh"
    else
        echo "$gRbasep/$GmbSUB/setup/rpi-multiboot.sh > /bin/rpi-multiboot.sh"
    fi
fi

}

























runascript() { FN="runascript"

    local scriptFILE="${1}"

    case "$scrMETHOD" in
        sh1)
            if [ -z "$VERBOSE" ]; then
                if sh "${scriptFILE}" 1>/dev/null 2>/dev/null; then
                    echU "$FN-$scrMETHOD: $scriptFILE [success]"; return 0
                else
                    echU "$FN-$scrMETHOD: $scriptFILE [failed]"; return 1
                fi
            else
                if sh "${scriptFILE}"; then
                    echU "$FN-$scrMETHOD: $scriptFILE [success]"; return 0
                else
                    echU "$FN-$scrMETHOD: $scriptFILE [failed]"; return 1
                fi
            fi
        ;;
        *) "unknown scrMETHOD: $scrMETHOD"; return 1; ;;
    esac
    return 1
}




extractatar() { FN="extractatar"

    echo "$FN> VERBOSE-MANUAL-ON"; VERBOSE=1

    local tarFILE="${1}"
    local tarBASE="${2}"
    [ ! -f "${tarFILE}" ] && echU "$FN $tarFILE [nofile]" && fails "oops"
    [ ! -d "${tarBASE}" ] && echU "$FN $tarBASE [nodir]" && fails "oops"

            if [ -z "$VERBOSE" ]; then
                if tar -xvzf ${tarFILE} -C ${tarBASE} 1>/dev/null 2>/dev/null; then
                    echU "$FN-$tarFILE > $tarBASE: [success]"; return 0
                else
                    echU "$FN-$tarFILE > $tarBASE: [fail]"; return 1
                fi
            else
                if tar -xvzf ${tarFILE} -C ${tarBASE}; then
                    echU "$FN-$tarFILE > $tarROOT: [success]"; return 0
                else
                    echU "$FN-$tarFILE > $tarROOT: [fail]"; return 1
                fi
            fi
}





curlgitfile() { FN="curlgitfile"

    #echo "BIGFOOT"; set -x

    local gitFILE="${1}"; local gitFILEo="${2}"; local gitFILEn=$(basename $gitFILE) #for error 404 name
    if curl -s -L "${gitFILE}" 1>$gitFILEo; then
        if [ "$(du -c ${gitFILEo} | head -n 1 | tr -s '\t' ' ' | cut -d' ' -f1)" -lt 300 ]; then #404 in ramfs!

            if cat ${gitFILEo} | grep -q '/bin/sh'; then
                return 0

            elif cat ${gitFILEo} | grep -q '404: Not Found'; then
                dlISSUES="non-existent-file:$gitFILEn"
                ISSUES="${ISSUES} non-existent-file:$gitFILEn"
                echU "$FN> ${gitFILE}@${gitFILEo} 404 > rm $dlISSUES"
                rm ${gitFILEo}
                return 1
            fi
        fi
        [ -n "$DEBUG" ] && echU "$FN> ${gitFILE}>${gitFILEo} [ok]" #echU "$FN> ${gitFILE}>${gitFILEo} [ok]"
        return 0
    else
        echU "$FN> ${gitFILE}>${gitFILEo} [fail]"
        #######!!! maynotbescript
        echU "rm /tmp/gitscript 2>/dev/null"
        : #rm /tmp/gitscript 2>/dev/null
    fi
}




























usage() {
cat <<EOF

    $(basename $0) [init]                           #setup local files dirs and initial parameters
                                                    #reboots, partitions and brings you back in os1


    $(basename $0) [refresh]                        #download the latest suppl files ( update )


    $(basename $0) info                             #wip- various state / installed os info




    LIMITATIONS:

        Currently configs are saved every flash / toggle... anything else ( -n / upload )
        is untested and to be considered not working.

        Syncing these supporting files is a wip... you may need to run getfiles / refresh
        in newly flashed os...

        Unless something goes wrong with partitioning... the baseos ( original ) remains
        untouched... and can be reverted to... ( but not encouraged -> often ) due to
        complexities of config syncing and baseos operations likely zapping multi
        data or settings.




    ############################ not tested with new format ( toggle will occur on flash )
    ### tba - failure detection / auto-toggle back... you'd need to edit config.txt on a pc
    ### for now should a critical error occur...

    $(basename $0) [toggle] [slotN||off]            #switch between (next)boot osNUM

            i.e.: toggle os2
            i.e.: toggle os2 enter                      #switch to os2 and rebootnow
            i.e.: toggle os1 enter revertos=os2         #switch to os1+rebootnow nextreboot>enter os2 (usesametoggleosasreverttokeep)

                    revertos=[keep|osN] #operating system to rebootinto after||fallback from toggleOS[orsimilar?] is performed
                    #!@ENTER... (~default@topvar<-z=stay||current)

    --help|-h|help


    ############################# old format tar special images only... use sysupgrade ( after init ) with regular images
    ############################# for now, sysupgrade only supports multi<>multi flashing...

    $(basename $0) install r14419-23-mwan3.tar.gz os2 [conf=export|none]
    $(basename $0) install http://r14419-23-mwan3.tar.gz os2 enter conf
        $LATESTIMG os2


EOF


}

#https://raw.github.com/wulfy23/rpi4-multiboot/master/multiboot/current/openwrt/snapshot.tar.gz
#https://github.com/wulfy23/rpi4-multiboot/blob/master/multiboot/current/openwrt/snapshot.tar.gz


usageparkinfo() {
:
    ########################################3>>>TBA
    #$(basename $0) ramboot NAME (once off)
    #or
    #$(basename $0) toggle os0 ramopt=xyz enter ???
    #or
    #$(basename $0) toggle os0 ramopt=xyz enter keep ??? #!A||B||C
    ###############################################


    #backupboot < backupfolderONusbPART for sysupgrade... retain all bootfiles... ( use instead of multi.tar.gz ) > usbosX only
    #mmc os still need to be re-installed || could tar them into either just rootfs or seperate "install like tar.gz"


}











#DEBUG=1 ################# check the basic repo and prereq





if [ -z "$1" ]; then usage && exit 0; fi #early usage bork @info is only 1 param cmd?



if [ ! -z "${PREREQ}" ]; then
	prereqcheka
fi
if $(command -v curl 2>/dev/null 1>/dev/null); then echU "curl [present]"; else ISSUES="${ISSUES} curlnotinstalled"; fi

#echo "SMILEY"; exit 0


if [ ! -f "/tmp/.$(basename $0).repocheck.${Dupd}" ]; then
    if curl -s -L "$gRbasep/README" 1>/dev/null; then
        echU "repo-online"; touch "/tmp/.$(basename $0).repocheck.${Dupd}"
    else
        ISSUES="${ISSUES} repooffline:$gRbasep/README"
    fi
fi
if [ ! -z "$ISSUES" ]; then echo "issues: $ISSUES" && exit 1; fi




allparams="${*}"
sACTION="$1"



scrMETHOD="sh1" #STATIX to test > set in sACTIONw-all-gSCRpaths LEAVE as a default



#@@@usbonly@<bootMNT||bootDEVresolveearly
mmcpartcount=$(blkid | grep '^/dev/mmcblk0' | wc -l)



if [ -f /boot/multiboot.ini ]; then #DEBUG=1
    echU "multiboot.ini[load]"
    . /boot/multiboot.ini
else
    echU "multiboot.ini [nope] @ VANILLA=1 [wip]"
    #VANILLA=1 #OFF@0925>unpolated->fresh-os@info
    VANILLA=1 #BACKON@-> init wont start if not vanilla -> echo something there on 'init'
fi #VANILLA@initsACTIONcaseexit #@@@~if VANILLA &&|| POPULATE >>> INSTALLSLOT="os1 os2"







if [ -f /boot/.initialize ] && [ "$sACTION" != "info" ]; then #letthroughinfo
    : #infohandle-seenext
elif [ -f /boot/.initialize ]; then
    echo "multiboot [non-complete-state]>reboot(wait 5mins reboots twice) or repair [$0 info]"
    exit 0
else
    if [ ! -z "$VANILLA" ]; then #FRESH or SETUP
	    echo "fresh-os (VANILLA)"; sleep ${dbgslp:-0}
    fi
fi






echU "DBGCASETOP: sACTION:$sACTION ${*}" #[ -n "$DEBUG" ] && echo "DBGCASETOP: sACTION:$sACTION ${*}"



#@v1 INTGRATE PARSE EXPANDPARAMS??? inside below case?
#VALUE=`echo $1 | sed 's/^[^=]*=//g'`
case "$sACTION" in
    install)
            DOINSTALL=1
            #@@@wasntshifted
            shift 1


            echo "THIS-FEATURE-IS-NOT_AVAILABLEFROMTHIS-SCRIPT"
            echo "use $0 init"
            echo "then after reboot"
            echo "use> sysupgrade <IMAGE>"

            exit 0


            echo "DBG-CASE@install)sACTION:$sACTION ${*}"
            echU "DBG-CASE@install)sACTION:$sACTION ${*}"
            # echo "BURRY"; exit 0


            ###################################################################################################
            #-!!!OSOPERATIONS(file?)<<<~toggle--------otherone@setup
            #1wasfile> install||info||backup||migrate||>>>toggle???@<enter etc.... @sACTION
            #2image@install
            ########################################## ADDSOLD
            #if [ -z "$1" ]; then echu "param1: targz/http/s empty" && usage && exit 1; fi
            #if [ -z "$2" ]; then echu "param2: os slot empty [os1|os2]" && usage && exit 1; fi
            ####???caseshift||grep-q<!!!if [ -z "$3" ]; then echU "param3: config not given"; else CONFIG=1; fi
            #sACTION="$1"
            #shift
            #	case "$sACTION" in
            #		install)
            ###################################################################################################

			IMAGE="$1"
			if [ -z "$2" ]; then echo "$0 $sACTION $IMAGE slot-name?"; usage; exit 0; fi
			dSLOT="$2" #@@@slotvalid?||resolve-slotrootfsblockdev-etc.etc.
            if [ -z "$3" ]; then
				shift 2
			else
				: #
			fi




#		;;

#		*)
#			echo "$sACTION [unsupported]"; usage; exit 0
#		;;
#	esac



case "$IMAGE" in
	http://*|\
	https://*) URL="$IMAGE"; IMAGE="$(basename $URL)"; #wget -O/tmp/sysupgrade.img "$IMAGE" || exit 1 #!!!IMAGE=/tmp/sysupgrade.img
	;;
esac
case "$IMAGE" in
	*"rootfs"*|*"rtfs"*|*".img"*)
		echo "image: $IMAGE nonvalid" && usage && exit 0
	;;
	*".tar.gz")
		:
	;;
	*)
		echo "image: $IMAGE non tar.gz" && usage && exit 0
	;;
esac

#conf=shared||export||sync =Z=once/exportagain?
#@@@shared@init.d hookANDmultiboot.ini sharedconfdir(boot/multiconf/shared)

#@@@

#toggle aka on reboot enter this flashed os POSSIBLY better to use or call at the end the other script...
#probable config synctoall function || cp restore.tar.gz ...



    ;;



    ##################################### ORIGINALONIMPORTNEEDSFIXING
    info)
            DOINFO=1
            #[ -n "$DEBUG" ] && echo "ZEBRA allparams: $allparams"
            #[ -n "$DEBUG" ] && echo "ZEBRA allavailparams: ${*}"
            #echo "ZEBRA allparams: $allparams"
            #echo "ZEBRA allavailparams: ${*}"
            echU "ZEBRA allparams: $allparams"
            echU "ZEBRA allavailparams: ${*}"
            shift
            #echo "ZEBRA exit"; exit 0

            #OSINFO="${1:-summary}"
			#if [ -z "$2" ]; then
			#	shift 1
			#else
			#	:
			#fi

	;;

    refresh)
        DOREFRESH=1
        #GITPATH
        gRSCR="$gRbasep/$GmbSUB/setup/rpi-multiboot.sh" #gRSCR="$gRbasep/$GmbSUB/rpi-multiboot-setup.sh"
        scrMETHOD="sh1"
        gRTAR="$gRbasep/$GmbSUB/setup/multi.tar.gz"; gRTARn=$(basename $gRTAR); tarROOT="/"
        shift 1
    ;;

    init) DOINIT=1 #notusedyet->@skipsections-wip
        #WAYTOOEARLY workaround -> on initsuccess
        #echo 'init=1' >> /boot/multiboot.ini
        if [ -z "$VANILLA" ]; then
            echo "VANILLA!=1 (/boot/multiboot.ini found)" #REPAIRMEOFF
            if [ "$mmcpartcount" -ne 2 ]; then echo "mmcpartcount: $mmcpartcount != 2"; fi
            fails "multiboot is setup [cannot-init>repair-or-refresh]WIP"
        fi

        #GITPATH
        gRSCR="$gRbasep/$GmbSUB/setup/rpi-multiboot.sh" #gRSCR="$gRbasep/$GmbSUB/rpi-multiboot-setup.sh"
        scrMETHOD="sh1"

        #well... this script and all other toggle / install suppl files etc... for now just extact / version check it boot/bin etc.
        #OFFTOSKIPnTEST gRTAR="$gRbasep/builds/multiboot/multi.tar.gz"; gRTARn=$(basename $gRTAR); tarROOT="/"
        gRTAR="$gRbasep/$GmbSUB/setup/multi.tar.gz"; gRTARn=$(basename $gRTAR); tarROOT="/"

        shift 1 #echU "SHIFT2 dbg-LEFTOVER-params-init-parse1-end[$#]: ${*}"; sleep 3
    ;;




    ################################################# v1 IMPORTS

    toggle)
	    DOTOGGLE=1

        echo "DBG>>> toggle > DEBUGon"; DEBUG=1

        [ -n "$DEBUG" ] && echU "toggle allparams: $allparams"

        if [ -z "$2" ]; then
		    #NONISSUESecho "please enter param2: os1||os2||os3||off" && usage #&& exit 0 #@@@!!!<<< probably leave on see what happens
            ISSUES="${ISSUES} toggle PARAM2-MISSING" #ISSUES="${ISSUES} please enter param2: os1||os2||os3||off"
	    fi


        if [ ! -z "$2" ]; then

        case "$2" in
	    	os1|os2|os3) toggleOSto="${2}"; ;;
            os99) toggleOSto="${2}"; ;;
            off) toggleOSto="os99"; ;; #LEAVE z ? or set to os99 toggleOSto="off"
            *) echo "toggle-param2-destos: $2 invalid" && usage && exit 9; ;;
        esac

        fi


        if [ ! -z "$ISSUES" ]; then
		    fails "togglesetup-fails: $ISSUES ( $0 --help )"
	    fi
        shift 2 #echU "SHIFT2 dbg-LEFTOVER-params-toggle-parse1-end[$#]: ${*}"; sleep 3
        #echo "BEETLE"; exit 50 #fornowdontdescend likely need to... then run early checks then function
    ;;

    --help|-h|help) usage && exit 0; ;; #seperate from * >> no-params-print-miniinfo
    *) echo "unknown action: $sACTION" && usage && exit 0; ;;
esac




#DEBUG=1
#REENABLEME!!! if [ ! -z "$DOTOGGLE" ] && [ ! -z "$VANILLA" ]; then fails "toggle [notyetinstalled]"; fi #precasesACTION? LEAVEforNOW

################################ PRECHECKS2akaVALIDATEcorrectENVIRONMENT HERE



#verbose||summary||debug
if [ "${#}" -gt 0 ]; then

    #info @ >>> ALLEXTRA


    echU "dbg-LEFTOVER-params-POSTPARSE1[$#]: ${*}"

    while [ "${#}" -gt 0 ]; do
        echU "leftover-param: $# $1"
        case "$1" in #NOTE:> shifts at end
                #TECHNICALLY only a toggle or install method... parse it here anyway (might be run on its own)
                enter) echo "ENTER: $1 SYSTEM WILL REBOOT ON SUCCESS"; ENTEROS=1; ;;


                #revertos) echo "REVERTOS: $1 SYSTEM WILL REBOOT ON SUCCESS"; RESTOREOS="${1}"; ;;
                #echo "REVERTOS: $1 SYSTEM WILL REBOOT ON SUCCESS"; RESTOREOS="${1}"
                #TECHNICALLY only a toggle or install method... parse it here anyway (might be run on its own)

                *"revertos="*)
                    ############################ SHSUBSTITUTION #RESTOREOS="${????1}"
					#RESTOREOS= #! restoreOS NOTrevertOS is determined from existing settings if RESTOREOS is not set...
					#revertOS="${1#*=}" #-c=*|--cache=*)
                    ########## cut method
                    #revertOS=$(echo $1 | cut -d'=' -f2)
                    #if [ -z "$revertOS" ]; then echo "revertos= is empty"; usage; exit 0; fi
                    #RESTOREOS=$(echo $1 | cut -d'=' -f2)

                    RESTOREOS="${1#*=}" #-c=*|--cache=*)
                    if [ -z "$RESTOREOS" ]; then echo "revertos= is empty"; usage; exit 0; fi

                    case "$RESTOREOS" in #case "$revertOS" in
                        os99|off)
                            :
                        ;;
                        os1|os2|os3)
                            :
                        ;;
                        os0)
                            :
                        ;;
                        *) echo "revertos=$RESTOREOS invalid"; usage; exit 0; ;;
                        #*) echo "revertos=$revertOS invalid"; usage; exit 0; ;;
                    esac
                ;;

                #*) echo "no-rules: $1"; ;;
                *)
                    echo "no-rules: $1"; sleep 2
                ;;
        esac


        shift
    done

else
    #@DEBUG
    echU "allparams-cleared-shifted"
fi


#set -x











getrestoreos() { #UMMM... for now i think just used to set a varval then maintested!z so noECHO? ENTERISSUES... too specific>mainish

#1 retonly -> we pass ok-its-set checks || print ||... meh... just echo 1 and test Z in main for now


	#!@> init > OSalt > cmdline osalt


    if [ -f /boot/.prefixrestore ]; then #os_prefix=os2/
        if [ "$(cat /boot/.prefixrestore | wc -l)" -eq 0 ]; then #echo ".prefixrestore zero lines"
            ENTER_ISSUES="${ENTER_ISSUES} .prefixrestore-zero-lines"
        fi
        RESTOREosFF="$(cat /boot/.prefixrestore | grep '^os_prefix=' | cut -d'=' -f2)"
    fi

    ############### notyetused-alternate>>>better? place
    if [ -f /boot/multiboot.ini ]; then #os_prefix=os2/
        if [ "$(cat /boot/multiboot.ini | grep '^prefixretore=' | wc -l)" -eq 0 ]; then
            return 1 #echo ".prefixrestore zero lines"
        fi

        if [ "$(cat /boot/multiboot.ini | grep '^prefixrestore=' | wc -l)" -gt 1 ]; then
            return 1 #multiplevalues
        fi

        if [ "$(cat /boot/multiboot.ini | grep '^prefixrestore=' | wc -l)" -eq 1 ]; then #technically not needed
            RESTOREosINI="$(cat /boot/multiboot.ini | grep '^prefixrestore=' | cut -d'"' -f2 | cut -d'"' -f1)"
        fi
    fi

    if [ ! -z "$RESTOREosINI" ] && [ ! -z "$RESTOREosFF" ]; then
        : #echU "wehavetwospots"
        if [ "$RESTOREosINI" != "$RESTOREosFF" ]; then
            : #cantecho>statix prefer ini first for now
        fi
    fi

    if [ ! -z "$RESTOREosINI" ]; then echo "$RESTOREosINI"; return 0; fi
    if [ ! -z "$RESTOREosFF" ]; then echo "$RESTOREosFF"; return 0; fi

    return 1
} #if [ ! -z "$RESTOREosINI" ]; then #if [ ! -z "$RESTOREosFF" ]; then



#if [ ! -z "$DOINIT" ]; then #CHEATSKIP
#if [ ! -z "$DOINIT" ]; then #CHEATSKIP
#if [ ! -z "$DOINIT" ]; then #CHEATSKIP


#!!! realvar restoreOS<RESTp NOSUCHVARrevertOSparam->revertos if [ ! -z "$revertOS" ]; then echU "passed revertos=$revertOS [ok]"; fi
#if [ ! -z "$revertOS" ]; then echU "passed revertos=$revertOS [ok]"; fi
if [ ! -z "$RESTOREOS" ]; then echU "passed revertos=$RESTOREOS [ok]"; fi

#ENTEROS!zifALLBELOWWASHERE... we need to condense parsed into real anyway&keepglobal used for toggle


if [ -z "$RESTOREOS" ]; then #RESTOREOS@parse-val CHANGESand||SETS
    restoreOS=$(getrestoreos) #WAS HERE summs ENTER_ISSUES=notes
fi
#if [ -z "$restoreOS" ]; then #nothing given or nothing set > revert to no multi
#    restoreOS=$(getrestoreos) #WAS HERE summs ENTER_ISSUES=notes
#fi
if [ ! -z "$RESTOREOS" ] && [ -z "$restoreOS" ]; then #RESTOREOS@parse-val CHANGESand||SETS
    restoreOS="$RESTOREOS"
fi







if [ ! -z "$ENTEROS" ]; then
        echo "ENTEROS> Determine environment EARLY"; sleep 2
        if [ -z "$restoreOS" ]; then #nothing given or nothing set > revert to no multi
            fails "we cant enter if we dont know or have not set restore/revert behavior"
        else
            echo ">>> (enter-whoops): early restore-behave-param: $restoreOS"
        fi
fi
#echo " activeOS: $activeOS"



#fi #ENDNOTzDOINITSKIP
#fi #ENDNOTzDOINITSKIP



#echo "NOGGIN"; exit 0
#DEBUG=1




cmdlinegetprop() {

    FN="cmdlinegetprop"
    local cmdlinegetprop="${1}" #rootfs|ramopt|...
	if read cmdline < /proc/cmdline; then
		case "$cmdlinegetprop" in
			rootfs)
				case "$cmdline" in
					*root=*) cmdlineprop="${cmdline##*root=}"; cmdlineprop="${cmdlineprop%% *}"; ;;
				esac
			;;
			ramopt)
				case "$cmdline" in
                    *ramopt=*) cmdlineprop="${cmdline##*ramopt=}"; cmdlineprop="${cmdlineprop%% *}"; ;;
                esac
            ;;
		esac #endcase1cmdlinegetprop
		if [ ! -z "${cmdlineprop}" ]; then echo "${cmdlineprop}"; return 0; fi
	else
		echo "cmdline is not readable" >> /tmp/ISSUELOG #echU "cmdline is not readable"
        fails "$FN> commandline-notreadable"
    fi
	return 1
} #cmdlineprop-ZCANTECHO: #echo "cmdline@$cmdlinegetprop empty" ######echU "cmdline@$cmdlinegetprop empty"
#echo "$(cat /boot/cmdline.txt) os_prefix=$OSdir ramopt=partinit" > "$OSbase/$OSdir/cmdline.txt"




getactiveOS() {

	FN="getactiveOS" #@@@!!!!!!!!!!!!!!!!!!!!!!!!!! root ! rootfs

    case "$(cat /proc/cmdline)" in
    	*"multisetup"*|*"ramopt=partinit"*|*"ramopt="*)
		    activeOS="os0"; activeOSpart="/dev/ram" #/dev/ramDUMMYVAL #activeOSpart="$(cmdlinegetprop "rootfs")"
		;; #partexpand #0=ramfs@/boot/os0/kernel8.img >>> validate ??? mounts@devroot etc... #SETUPhereTBA... >>> detect@3props
        *"os_prefix=os1"*) activeOS="os1"; activeOSpart="$(cmdlinegetprop "rootfs")"; ;;
        *"os_prefix=os2"*) activeOS="os2"; activeOSpart="$(cmdlinegetprop "rootfs")"; ;;
        *"os_prefix=os3"*) activeOS="os3"; activeOSpart="$(cmdlinegetprop "rootfs")"; ;;
        *) #non of our funky params... must be native
            activeOS="os99"; activeOSpart="$(cmdlinegetprop "rootfs")"
            if [ "$activeOSpart" != "/dev/mmcblk0p2" ]; then echo "hmmmm no opts but not mmcblk0p2"; sleep 3; fi
            #99=raw >>> validate mmcpart2...@beta usb #SETUPhereTBA... >>> detect@3props
        ;;
    esac
}




getconfigtxtval() {
    FN="getconfigtxtval"
    local paramcnt=
    if cat /boot/config.txt | grep -vE '(^$|^#)' | grep -q "^$1"; then
        paramcnt=$(cat /boot/config.txt | grep -vE '(^$|^#)' | grep "^$1" | wc -l)
        if [ "$paramcnt" -gt 1 ]; then echo "warning: multiple values for: $1"; fi

        cat /boot/config.txt | grep -vE '(^$|^#)' | grep "^$1" | tail -n1 #FORNOWJUSTSPITOUTHEAFULLSINGLELINE

    else
        : #TESTINGFOR-Z-CANNOT-ECHO-HERE #echo "$FN> ZEROENABLED"; #echo "cat /boot/config.txt | grep -vE '(^$|^#)' | grep \"^$1\""
    fi

}
#@@@v1
#if grep -q '^os_prefix=' /boot/config.txt; then echo "config.txt has os_prefix... [setup-already?]" && exit 0; fi


getosSTATE() {
    :
    getactiveOS

	#echo "cmdlinegetprop-rootfs: $(cmdlinegetprop "rootfs")"
	#echo "cmdlinegetprop-ramopt: $(cmdlinegetprop "ramopt")"
    #activeOS=
    #echU
}




setconfigval() {

#1 file #2 add = either reenable or echo #3 var #5 value || 3@alllineFORNOW #HAVEALREADYDUPCHECKED... either sed or add

	local confFILE="$1"
	local confACTION="$2"
	local confVALUE="$3"

    echo "${confFILE} ${confVALUE} ${confACTION}"


	case "${confACTION}" in


        replace) #used for multiboot.ini bug@enable-needs-all-offalternatevars(tobe#enabledsameall)... this just updates right val
				#VALUE=`echo $1 | sed 's/^[^=]*=//g'`
                varN=${confVALUE%=*}
				varV="${confVALUE#*=}"

                echo "varN: $varN"
                echo "varV: $varV"
                sleep 3

                echo "SLASHADDSBUG sed -i \"s!${varN}\=.*$!${varN}=${varV}!g\" ${confFILE}"
                sed -i "s!${varN}\=.*$!${varN}=${varV}!g" ${confFILE} 2>/dev/null #&& echo "commented-reenabled" #&& return 0
                replaceRET=$?
                if [ "$replaceRET" -ne 0 ]; then
                    #echo ": $replaceRET"
                    #setconfigval "/boot/multiboot.ini" enable "os_prefix=$toggleOSto"
                    echo "replace: $replaceRET [>adddirect]"
                    echo "${varN}=${varV} >> $confFILE"
                    echo "${varN}=${varV}" >> $confFILE

                else
                    echo "replace: $replaceRET [ok]"
                fi
                #setconfigval "/boot/config.txt" enable "os_prefix=$toggleOSto"
                #sed -i "s!${varN}=.*$!${varN}=${varV}!g" ${confFILE} 2>/dev/null #&& echo "commented-reenabled" #&& return 0
                #sed -i "s!${varN}=!${varN}=${varV}!g" ${confFILE} 2>/dev/null #&& echo "commented-reenabled" #&& return 0
        ;;


        enable)
            #sed -i "s!#${confVALUE}!${confVALUE}!g" ${confFILE} && echo "commented-reenabled" && return 0
            #sed -i 0,!\#${confVALUE}!s!!${confVALUE}! ${confFILE} 2>/dev/null && echo "commented-reenabled" #&& return 0
            sed -i "s!#${confVALUE}!${confVALUE}!g" ${confFILE} 2>/dev/null #&& echo "commented-reenabled" #&& return 0
        ;;


        add) #REAL^:^...=os1 bug... disable last first >>> using main if ! -z from to handle@disable semi clearer for now
            ############################# NOTE:>>>using enable ADD is buggy at #NAME possibly due to && on COMMAhalfwork
            #TRYSILENCENOCOMMA
            sed -i 0,!\#${confVALUE}!s!!${confVALUE}! ${confFILE} 2>/dev/null && echo "commented-reenabled" && return 0
            ################# NOTE: THIS IF OFF FOR TESTING USED TO HIT THIS IF ABOVE DIDNOT RETURN > ASSUME SETUP ADDED PLACEHOLDERS
            echo ${confVALUE} >> ${confFILE} && echo "fresh-added" && return 0
			#echo "DBG \$(cat ${confFILE} | grep \"${confVALUE})\""
			#$(cat ${confFILE} | grep "${confVALUE}")
		;;

        disable) #for now only calling on main "fromVAL!z" this no sanity needed
			sed -i "s!${confVALUE}!#${confVALUE}!g" ${confFILE} && echo "line-disabled: $confVALUE" && return 0
        ;;

		*)
			echo "$FN> unknown action $confACTION" && return 1
		;;
	esac

}
#VALUE=`echo $1 | sed 's/^[^=]*=//g'`




writerevertos() {
FN="writerevertos" #fixup if blank... do in main for now?

if [ -z "$restoreOS" ]; then
    #fails "$FN> restoreOS-Z"
    echo "$FN> restoreOS-Z HACK > restoreOS=os99 should be written to multiboot.ini on setup or cmdline x=y>update@both-ini+.file"
    restoreOS=os99
    echo "$FN> DBG PUTS restoreOS=os99 in /boot/.restoreprefix but thats only used by ramfs@os0"
    echo "$FN> DBG @@@ check ramfs@os0 default initscript ramfsinit.sh? for .prefixrestore handler... "
    echo "$FN> WIP HEREDOC CHECK / WRITE (oninstall) > os2-PART:/usr/sbin/x or custom/startup/ or /etc/uci-defaults etc. etc."
    echo "$FN> WIP HEREDOC CHECK / WRITE ($0 !!!! toggle) || osX@fboot&&startup checkprefixrestore"
    sleep 5
fi

#THISISNOTWORKING
#echo "SETTTTTTTT-x"; set -x
#setconfigval "/boot/multiboot.ini" enable "restoreos=$restoreOS"
setconfigval "/boot/multiboot.ini" replace "restoreos=$restoreOS"
#|| setconfigval "/boot/config.txt" enable "os_prefix=$toggleOSto"
#echo "SETTTTTTTT+x"; set +x

echo "os_prefix=$restoreOS/" > /boot/.prefixrestore

}

#RESTOREOS="${1#*=}"












if [ ! -z "$DOTOGGLE" ]; then

    #echo TOGGLEMAIN; sleep 2

    #echo "getconfigtxtval \"os_prefix\""; getconfigtxtval "os_prefix"
    setosprefix=$(getconfigtxtval "os_prefix" | cut -d'=' -f2)
    if [ ! -z "$setosprefix" ]; then
        setospretty=$(echo $setosprefix | sed 's!\/!!g')
        toggleOSfrom=$(echo $setosprefix | sed 's!\/!!g')
    fi


    getosSTATE


    #echo " activeOS: $activeOS"
    #echo " activeOSpart: $activeOSpart"
    #echo " setosprefix: $setosprefix"
    #echo " toggleOSfrom: $toggleOSfrom"
    #echo " toggleOSto: $setosprefix"

    #getOSinSLOT #@@@> i.e.: @ini or cat ini || ls -1 | wc -l ISSOMETHINGINSTALLEDTHERE
    #isOSinSLOT #@@@> i.e.: @ini or cat ini || ls -1 | wc -l ISSOMETHINGINSTALLEDTHERE



    #if toggleOSto = os99 || off then... do some fixups etc...


    if [ "$activeOS/" != "$setosprefix" ]; then
        REBOOTPENDING=1
        #echo "####################################################################"
        #echo "CurrentOS:$activeOS differs from $setospretty [reboot-pending?||retoggled]" #dontexit-retoggle
        #echo "####################################################################"
        :
    fi

    #echo "CurrentOS:$activeOS togglefrom:$toggleOSfrom toggleto:$toggleOSto"
    echo "CurrentOS:$activeOS togglefrom:$toggleOSfrom toggleto:$toggleOSto revertos:${restoreOS:-keep}"


    #off then off again = safe-ish > OSfrom is z... handle this state(lightly) > keep broad for other states
    if [ -z "$toggleOSfrom" ] && [ "$toggleOSto" = "os99" ]; then
        echo ">>>>>>>>>>> off already :) [continue-for-fun]"; sleep 2
    fi
    #CurrentOS:os99 togglefrom: toggleto:os99 #possible activeOS = toggleto... best not at the moment therebegremlinsthere


    if [ "$toggleOSfrom" = "$toggleOSto" ]; then echo "$toggleOSfrom = $toggleOSto = current [noaction]"; exit 0; fi


    #whats in the slot
    echo "############################################################# toSLOTinfo"
    cat /boot/multiboot.ini 2>/dev/null | grep $toggleOSto | grep OSinstalled #should exist already on toggle or main-er check
    #sleep 3


    if [ "$toggleOSfrom" = "$toggleOSto" ]; then #current [noaction]"; exit 0; fi
        :
    else

        ################### HANDLE params@reboottoggles or enternow etc...
        #@@@ final if/s here if-z ifDOINIT > set current etc.
        #uses restoreOS in env derived from PARAM revertos=@RESTOREOS then file or WIPdefault@top current(this)||last?||???
        #possible just feed it 3 vars... env@restoreOS filerevertosOS defaultrestoreOS and do the logic inside otherwise...
        #need to check here... has it changed... is an os there... etc. etc. etc. can come from togglefrom if param@???gremlins!
        echo "writing restoreos: $restoreOS (brute-ish-wip)"
        writerevertos
    fi

    if [ ! -z "$toggleOSfrom" ] && [ "$toggleOSfrom" != "$toggleOSto" ]; then
	    #echo "DBG: setconfigval \"/boot/config.txt\" disable \"os_prefix=$toggleOSto\""
	    setconfigval "/boot/config.txt" disable "os_prefix=$toggleOSfrom"

        if [ -z "$toggleOSto" ] || [ "$toggleOSto" = "os99" ] || [ "$toggleOSto" = "off" ]; then
			echo "toggled off" #sed -i "s!^os_prefix!#os_prefix!g" ${confFILE} && echo "line-disabled: $confVALUE" && return 0
        fi

    fi

	#echo "DBG: setconfigval \"/boot/config.txt\" add \"os_prefix=$toggleOSto\""
	#ADDHASBUG@#>>>added enable setconfigval "/boot/config.txt" add "os_prefix=$toggleOSto"
    if [ -z "$toggleOSto" ] || [ "$toggleOSto" = "os99" ] || [ "$toggleOSto" = "off" ]; then
        : #dont "set" the os99 in config.txt NOTE: didnotwork anyway... (sedonly)
    else
        setconfigval "/boot/config.txt" enable "os_prefix=$toggleOSto"
    fi
        #@@@ sed chosenSLOT@multiboot.ini #@@@slide chosenOS-last || toggle?||> toggle revertOS too?

	echo "############dbgshowallend"; cat /boot/config.txt | grep os_prefix

    exit 0
    #echo "EMPTY+exit"; exit 0
fi





###################################### FUNCSDOINITSTART ###########################################




getdiskinfo() {

	#test if disk exists?
	local retval=
	local resultxt=

	case "$1" in
		numparts)
			local DISK="$2"
			blkid | grep "^$DISK" | wc -l
		;;
		ismounted)
			local MPOINT="$2"
			mount | grep " $MPOINT " | cut -d' ' -f1
		;;
	esac
}
#if [ "$(blkid | grep "^$BdISK" | wc -l)" -ne 2 ]; then echo "the mmc card appears to be partitioned already" && exit 0; fi






initbootOS() { #v1<setup.sh > v1.5 'boot+init' means setup a folder on /boot/osX
	local FN="initbootOS"
	#local dbgslp=1

	local OSname= #os99 etc nonfixup value
	local OSinitramfs=
	local rootfsmsg=
	local BOOTmnt="${1}"
	local OSname="${2}"
	local OSsub="${2}" #modded on os0 or os99 etc.
	local OSrootfspart="${3}" #modded on os0 or os99 etc.
	local OSnextos=
	local OSalt= #sysupgrade-or-toggletodefault


	#FLIPPED 4nowaltos 5nextos @init>initramfshardcodedsetnext>othersetalt
	#OSnextos="${OSname}" ###@os1||2||3 >>> OSalt only ramfs gets nextos os1 (on success?)
	if [ -z "${4}" ]; then
		echo "altos [empty] > $OSnextos"; sleep ${dbgslp:-0}; sleep ${dbgslp:-0}; sleep ${dbgslp:-0}
		#OSalt=$4
	else
		OSalt=$4
	fi

	if [ -z "${5}" ]; then
		: #echo "nextos [empty] > $OSnextos"
	else
		OSnextos="${5}"
	fi

	#local OSdir="$1" was 1 now 2 but do os99 fixup
	if [ -z "$OS99rfspART" ]; then msgexit "variable OS99rfspART [empty@global-/dev/(mmcp2||sda2)]"; fi
	getdiskinfo ismounted "$BOOTmnt" >/dev/null || msgexit "$BOOTmnt [no-mount]"
	if [ -z "$OSname" ] || [ -z "$BOOTmnt" ]; then echo "$FN> missing params"; return 1; fi

	#if [ -z "$OSsub" ] || [ "$OSsub" = "os99" ] || [ "$OSsub" = "baseos" ]; then #possible native / os99 install
	if [ "$OSname" = "os99" ] || [ "$OSname" = "baseos" ]; then
		OSsub="."
	fi


	if [ "$OSname" = "os0" ]; then
		OSinitramfs="${OSrootfspart}"
		OSrootfspart="$OS99rfspART"
		#ramdisk_size=32768 root=/dev/ram0 init=/init vt.cur_default=1 elevator=deadline sdhci.debug_quirks2=4
		rootfsmsg="(ramfsdummy-baseos)"
	fi


	local OSbase="${BOOTmnt}" #variable for "pre-pend" to each new OS... typically /boot or where dest "boot" is mounted
	local OSdir="${OSsub}" #original-namefornow-OSsub
	echo "######################################################### $FN"
	echo "        osname: $OSname"
	echo "        nextos: $OSnextos"
	echo "         altos: $OSalt"
	echo "         ossub: $OSsub"
	echo "  osrootfspart: $OSrootfspart ${rootfsmsg}"
	echo "  installingto: $OSbase/$OSdir $(getdiskinfo ismounted "$BOOTmnt")"
	#echo " installing to: $BOOTmnt/$OSsub"
	sleep 2
	sleep ${dbgslp:-0}

	if [ "$OSname" = "os99" ] || [ "$OSname" = "baseos" ]; then
		echo "baseos [return-after-header]"
		sleep 1
		sleep ${dbgslp:-0}
		return 0
	fi


    	if [ "$OSdir" = "os0" ]; then
		if [ -z "${OSinitramfs}" ]; then msgexit "ramfs: $OSinitramfs [empty]"; fi
		if [ ! -f "${OSinitramfs}" ]; then msgexit "ramfs: $OSinitramfs [invalid-nofile]"; fi
	fi


	if [ ! -d "$OSbase" ]; then echo "OSbase: $OSbase/ [notpresent->exit 1]"; exit 1; fi
	if [ -d "$OSbase/$OSdir" ]; then echo "OSdir: $OSbase/$OSdir exists return 0"; return 0; fi


	#echo "Setting up: $OSbase/$OSdir"; sleep 2
	mkdir -p "$OSbase/$OSdir" "$OSbase/$OSdir/config" "$OSbase/$OSdir/config/raw" #2+3->wip

	#!!! ADDED RETURN for baseos / os99... leave this logic for a little bit for reference
	if [ ! -z "$OSinitramfs" ]; then #echo "cp $RAMFSv $OSbase/$OSdir/kernel8.img"; cp $RAMFSv "$OSbase/$OSdir/kernel8.img"
        	echo "$OSdir ramfs kernel"
        	echo "cp $OSinitramfs $OSbase/$OSdir/kernel8.img"
        	cp $OSinitramfs "$OSbase/$OSdir/kernel8.img"
    	else

		if [ "$OSsub" != "." ]; then
			#echo "$OSdir regular kernel"
        		cp ${BOOTmnt}/kernel8.img "$OSbase/$OSdir/" #PUTITTHERENOW will OVERWRITE with INITRAM
		else
			echo "$OSdir baseos [kernel-skip]"
		fi

	fi
	sleep ${dbgslp:-0}


	if [ "$OSsub" != "." ]; then

		echo "#################################### Copy ${BOOTmnt} [basic-files dtb sample-txts]"

		cp ${BOOTmnt}/*.dtb "$OSbase/$OSdir/" #cp ${BOOTmnt}/bcm2711-rpi-4-b.dtb "$OSbase/$OSdir/"
		cp -rf ${BOOTmnt}/overlays "$OSbase/$OSdir/"


		#!!! copy key .txt but cmdline.txt only matters? + lower generate it... below is for clarity / failsafe
		cp ${BOOTmnt}/config.txt "$OSbase/$OSdir/"
		cp ${BOOTmnt}/cmdline.txt "$OSbase/$OSdir/"
		cp ${BOOTmnt}/distroconfig.txt "$OSbase/$OSdir/"
		#########cp ${BOOTmnt}/c*.txt "$OSbase/$OSdir/"
		#########cp ${BOOTmnt}/cmdline.txt "$OSbase/$OSdir/cmdline.txt.original"

	else
		echo "baseos: ${BOOTmnt}/$OSsub [basic-files-skip]"
		sleep 1
		sleep ${dbgslp:-0}
	fi


	#echo "cmdline.txt rootfs=${OSrootfspart} $OSbase/$OSdir/cmdline.txt"
	echo "Writing cmdline-rootpart: root=${OSrootfspart} $OSbase/$OSdir/cmdline.txt"; sleep ${dbgslp:-0}; sleep ${dbgslp:-0}

    if [ ! -z "$OSinitramfs" ]; then

        echo "$(cat /boot/cmdline.txt) os_prefix=$OSdir ramopt=partinit" > "$OSbase/$OSdir/cmdline.txt"

		cmdlinemod "$OSbase/$OSdir/cmdline.txt" "setval" "root" "$OSrootfspart"
		#echo "set-root: $(cmdlinemod "$OSbase/$OSdir/cmdline.txt" "getval" "root")"
		cmdlinemod "$OSbase/$OSdir/cmdline.txt" "setval" "nextos" "$OSnextos"
		#echo "setnextos: $(cmdlinemod "$OSbase/$OSdir/cmdline.txt" "getval" "nextos")"
		sleep ${dbgslp:-0}


        ###################@@@ unsure if prefix config.txt is loaded/merged/ignored etc...?
        #DEBUGGINGSKIP
		#echo "Create $OSbase/$OSdir/cmdline.txt.multi [for sysup repairs]"
        #cp "$OSbase/$OSdir/cmdline.txt" "$OSbase/$OSdir/cmdline.txt.multi"
        #echo "Create $OSbase/$OSdir/config.txt.multi [for sysup repairs]"
        #cp "$OSbase/$OSdir/config.txt" "$OSbase/$OSdir/config.txt.multi"


    else

        echo "$(cat /boot/cmdline.txt) os_prefix=$OSdir" > "$OSbase/$OSdir/cmdline.txt"

		cmdlinemod "$OSbase/$OSdir/cmdline.txt" "setval" "root" "$OSrootfspart"
		#echo "set-root: $(cmdlinemod "$OSbase/$OSdir/cmdline.txt" "getval" "root")"
		sleep ${dbgslp:-0}


        case "$OSdir" in #@@@inibasedALSOlikerootfsparts
            *os1*)
		        cmdlinemod "$OSbase/$OSdir/cmdline.txt" "setval" "altos" "$OSalt"
		        #initnoneedusetoggle if!znextos cmdlinemod "$OSbase/$OSdir/cmdline.txt" "setval" "nextos" "$OSnextos"
	        ;;
	        *os2*)
		        cmdlinemod "$OSbase/$OSdir/cmdline.txt" "setval" "altos" "$OSalt"
		        #initnoneedusetoggle if!znextos cmdlinemod "$OSbase/$OSdir/cmdline.txt" "setval" "nextos" "$OSnextos"
            ;;
	        *os3*)
		        cmdlinemod "$OSbase/$OSdir/cmdline.txt" "setval" "altos" "$OSalt"
		        #initnoneedusetoggle if!znextos cmdlinemod "$OSbase/$OSdir/cmdline.txt" "setval" "nextos" "$OSnextos"
	        ;;
            *)
                echo "altos unknown for: $OSdir"; sleep 5
                #echo "nextos unknown for: $OSdir"; sleep 5
            ;;
        esac; sleep ${dbgslp:-0}; sleep ${dbgslp:-0}
        #echo "isvalid workaround early"; echo 'isvalid=1' >> "$OSbase/$OSdir/os.ini"


	fi



	#echo "########################### cmdline.txt mod1"; cat "$OSbase/$OSdir/cmdline.txt"; sleep 2
	#echo "setnextos: $(cmdlinemod "$OSbase/$OSdir/cmdline.txt" "getval" "nextos")"



########################################################## NOTUSED!!! > isvalid=1@info
#######eval BUILD_ID=>OSBUILDID OSdate=

#echU "Write default: $OSbase/$OSdir/os.ini"

#echo "isvalid workaround early"
#echo 'isvalid=1' >> "$OSbase/$OSdir/os.ini"
############################### @@@>>> multiboot.ini
cat <<EOF > $OSbase/$OSdir/os.ini
############################# NOTE this file currently unused
isvalid=1
Prootpart="$OSrootfspart"
rootpart="$OSrootfspart"
Pbootpfx="$OSbase/$OSdir"
##############################unused
Pkname="kernel8.img"
EOF

return 0

}


#quiet ramdisk_size=32768 root=/dev/ram0 init=/init vt.cur_default=1 elevator=deadline sdhci.debug_quirks2=4
####################################################################################################
#THISISFORSYSUPGRADEorBACKUPRESTOREetcCONFIG-CMDLINEopsREPAIRs
#MAIN was keeping in /boot/config.txt.osX for copy method... dont do for now or copy back after
#echo "Create $OSbase/$OSdir/cmdline.txt.multi [for sysup repairs]"
#cp "$OSbase/$OSdir/cmdline.txt" "$OSbase/$OSdir/cmdline.txt.multi"
#@@@ unsure if prefix config.txt is loaded/merged/ignored etc...?
#echo "Create $OSbase/$OSdir/config.txt.multi [for sysup repairs]"
#cp "$OSbase/$OSdir/config.txt" "$OSbase/$OSdir/config.txt.multi"
#THISISFORSYSUPGRADEorBACKUPRESTOREetcCONFIG-CMDLINEopsREPAIRs
####################################################################################################




cmdlinemod() {

	local MODFILE="${1}"

	case "$2" in
		getval)
			local GETVAR="$3"
			#shift 3
			awk -F ${GETVAR}'=' '{printf $2}' $MODFILE | sed -e "s/ .*$//"
		;;
		setval)
			local GETVAR="$3"
			local SETVAL="$4"
			#what is it now? root= always there...
			local GETCUR=$(cmdlinemod "$MODFILE" getval "$GETVAR")

			if [ -z "$GETCUR" ]; then
				echo "$(basename $MODFILE) ${GETVAR}= [NEW]> ${GETVAR}=${SETVAL}"; sleep 1
				sed -i "s!\$! ${GETVAR}=${SETVAL}!g" "${MODFILE}"
			else
				echo "$(basename $MODFILE) ${GETVAR}=${GETCUR} [MOD]> ${GETVAR}=${SETVAL}"; sleep 1
				sed -i "s! ${GETVAR}=${GETCUR}! ${GETVAR}=${SETVAL}!g" "${MODFILE}"
			fi
		;;

	esac

	return 1
}


#sed -n 's|^.*root=\(\S\+\)\s.*|\1|p' /boot/cmdline.txt
#sed -i 0,!\#${confVALUE}!s!!${confVALUE}! ${confFILE} 2>/dev/null && echo "commented-reenabled" && return 0
#awk -F 'ubi.mtd=' '{printf $2}' /proc/cmdline | sed -e 's/ .*$//'
#sed -i 's!$! nextos=os2!g' "$OSbase/$OSdir/cmdline.txt"










bootdir_initfiles() {

	local FN="bootdir_initfiles"
	echo "######################### $FN> init"

	cp /boot/config.txt /boot/config.txt.original #setupstateoriginal

	#???cp /etc/custom/ramfs/config.txt.seed /boot/config.txt@gitdltar||builtin
	#TESTS
	##############################################################################################################################
	#cp /boot/config.txt /boot/config.txt.last #pretoggle?recopyeverytoggle?
	#cp /boot/config.txt /boot/config.txt.sed #sedtogglepractice-toggle?
	#cp /boot/config.txt /boot/config.txt.alt #who knows... similar to last?
	##############################################################################################################################
	###############################################################################################################################
	########################################## initramfs os99 = psuedo nativeOS... note:funcbelowretonnosdafailfriendly
	#cp /boot/config.txt /boot/config.txt.os99 #psuedooff
	#cp /boot/config.txt /boot/config.txt.default #initiallyoffbutcanbeswitchedtoyourpreferencefor-onetime-toggle-revertTOs echoALTs#

#!!!CORRECTION copy back here or leave !!!DOTHISINinitbootOS</boot/config.txt.default @ osX root= DIFFERENT or notset properly
################################################################################################################################
####cp /boot/config.txt /boot/config.txt.os0; echo "os_prefix=os0/" >> /boot/config.txt.os0 #ramfs@kernelimg+cmdline root=/dev/ram[ign]
####cp /boot/config.txt /boot/config.txt.os1; echo "os_prefix=os1/" >> /boot/config.txt.os1 #slot1 kernel-cmdline-+mmcp3
####cp /boot/config.txt /boot/config.txt.os2; echo "os_prefix=os2/" >> /boot/config.txt.os2
####cp /boot/config.txt /boot/config.txt.os3; echo "os_prefix=os3/" >> /boot/config.txt.os3 #sdaXwipdef-man-editNpartNcp@toggleprevention

}







################################# DOINIT ################################################



#!!!DYNAMICNEWVARFOR-BOOTDISK
BdISK="/dev/mmcblk0"

case "$BdISK" in
	"/dev/mmcblk0"*)
		BpART="${BdISK}p1"
		OS99rfspART="${BdISK}p2"
	;;
	"/dev/sd"*)
		BpART="${BdISK}1"
		OS99rfspART="${BdISK}p2"
	;;
	*) msgexit "bootdisk: $BdISK [unsupported]"; ;;
esac
BpARTm="/boot"





if [ ! -z "$DOINIT" ]; then #####################################################################################################


	if [ -z "$VANILLA" ] && [ ! -z "$ISSUES" ]; then ####################@@@ original-onrouter-setup.sh
		echo "not vanilla or issues: $ISSUES"
		exit 0
	fi

	if grep -q 'init=1' ${bootMNT}/multiboot.ini 2>/dev/null; then
		#check for initialize log || echo "run> init apply"
		echo "INITAPPLY!"
		exit 0
	fi


	BdISKnumparts=$(getdiskinfo "numparts" "$BdISK")

	if [ "$(getdiskinfo "ismounted" "$BpARTm")" != "$BpART" ]; then
		echo "bootpart: $BpART not mounted at $BpARTm" && exit 0
	else
		echo "bootpart: $BpART mounted at $BpARTm [ok]"
	fi

    	#if [ "$BdISKnumparts" -ne 2 ]; then echo "bootdisk: $BdISK($BdISKnumparts) partitioned already" && exit 0; fi
	if [ -f /boot/.initialize ]; then echo "reboot to initialize or initialize failed" && cat /boot/.initialize && exit 0; fi



	#echo "skip gitdlcorefiles"; sleep 2
	gitdlcorefiles #moved here from inline above as function as used by "refresh" also #testfor $RAMFSout


	#@@@ source multiboot.ini or similar for rootfs variable per osX!!!!!!!!!!!!!!!!!!!!!!!!!
	#@@@ source multiboot.ini or similar for rootfs variable per osX!!!!!!!!!!!!!!!!!!!!!!!!!
	#@@@ source multiboot.ini or similar for rootfs variable per osX!!!!!!!!!!!!!!!!!!!!!!!!!


	bootdir_initfiles

	######################################################################################################################
	#!!! 'nextos' is on cmdline for ~ucidef/early 'sed-back'... > was sendingos1>os2 and os2>os1 = 'toggleos' or 'altos'!!!
	#!!! 'altos' ~@ os.ini ~ 3 gets tricky... pulled in by sysupgrade... or 'toggle (default)'...
	######################################################################################################################
	#>>> TESTING os99 #initbootOS "$BpARTm" "os99" "/dev/mmcblk0p2" #99isoff NOTE: if 2 = file > we copy instead of kernel
	RAMFSout="/etc/custom/4-model-b/ramfs" #DEBUGCOPY-REMOVE
	######################################################################################################################
	#####echo "initbootOS \"$BpARTm\" \"os0\" \"$RAMFSout\""
    	initbootOS "$BpARTm" "os0" "$RAMFSout" "" "os1" # successonly!!! hardcoded after install boot info os1 ... optionally use 'var'
    	initbootOS "$BpARTm" "os1" "/dev/mmcblk0p3" "os2" #now setting these as 'altos'
    	initbootOS "$BpARTm" "os2" "/dev/mmcblk0p4" "os1" #as above
    	initbootOS "$BpARTm" "os3" "$sdROOTFS" "os1" #assume os1 @@@!!!ASKFIRST@>conditional?<ini-installed_os? #sdROOTFS="/dev/sda2"

    	#NOTE: this is a generic setup dump... "install" dumps and untars current config to slotrootfs
    	echo "Dumping recent osrestore.tar.gz > /boot"; sleep 2; sysupgrade -k -b /boot/osrestore.tar.gz
	#######@@@@@toggle 'conf' || conf=backup1.tar.gz? || conf=current?
	#@echo "/boot/osrestore.tar.gz" > .ramfsliveconfigloadonce #rm'd? checkfirst

    #writetogglepartsini... @@@> multiboot.ini?||writesomeothermetadatahere
    #/boot/.toggleparts part1=os1/ part2=os2/ (two supported for now topmost selected on toggle from non-togglemember)

    #NOTE: create /boot/.multibootsetup||ok from ramfs and remove below-ish or keep-setup-oneforrunninglog i.e. grep -q partsok...
    #no /boot/.initialize means all done or echo sed lines there too...
    echU "touch /boot/.initialize ramfsff" && touch /boot/.initialize


    #@@@!!!!!!!!!!!!!!!!!!!! toggle os0 && checkup on os0/cmdline.txt = ramfsopt=partinit
    #NOTE: below assumes its vanilla with all commented out and present... check those conditions here... too!!!


    #dbg still mounted?

    #if all ok... && ! -z noreboot(aka stop at final payload/s noapply?) <NOPE'now' print a message with a 5 sec pause and reboot
    #else PRINT ISSUES &&||cleanup||repairish



	#ISSUES -z then echo 'init=1' >> ${bootMNT}/multiboot.ini
	#ISSUES -z then
	echo 'init=1' >> ${bootMNT}/multiboot.ini
	#@@@ touch something else as initialize might be seperate...


    ########################@@@ init (no touch initialize or sed os0 ... 'apply' = reboot sedos0 and touch

    if [ -z "$NOREBOOT" ]; then
		#setconfigval "/boot/config.txt" enable "os_prefix=os0/"
		echo "set os0 in config.txt"
    		sed -i 's!#os_prefix=os0/!os_prefix=os0/!' /boot/config.txt
    		sleep 2

    	echo "rebooting to setup alt rootfs partitions... MANUALLY OFF"
    	#echo "rebooting to setup alt rootfs partitions..."
    	#sleep 6
    	#reboot
	else
		echo "run> $0 init apply [to-reboot-and-partition]"
	fi

    #@ramfs-init.sh... >>> > /boot/multiboot-init.sh for... ??? VANILLA probably
    #echo 'init=1' >> /boot/multiboot.ini

fi #END-DOINITWRAPPER ##############################################################################################







if [ ! -z "$DOREFRESH" ]; then
    #bootmountcheckheretoo
    echo "DOREFRESHDEBUGFORCEON"; sleep 2
    if [ -n "$DEBUG" ]; then
        echo "     setupscript: $gRSCR"
        echo "        setuptar: $gRTAR"
        echo "https://raw.githubusercontent.com/wulfy23/rpi4-multiboot/master/multiboot/setup/rpi-multiboot.sh"
    fi
    gitdlcorefiles #&& exit 0 || fails
fi




##################################### EXITPART1
##################################### EXITPART1
##################################### EXITPART1
#exit 0
##################################### EXITPART1
##################################### EXITPART1
##################################### EXITPART1
[ -n "$DEBUG" ] && echo "PART2: debug:$DEBUG" #echo PART2






#####################################################################################################


#BEGIN OSMANGE-SYSUP.SH aka INSTALL a tar.gz


#####################################################################################################
#we will need e2fsck in imageMakefile and COPY_BINplatform.sh > can live without short term...

rpi4multi_get_cmdlinerootfs() {

	local rootfsdev
	if read cmdline < /proc/cmdline; then
		case "$cmdline" in
			*root=*)
				rootfsdev="${cmdline##*root=}"
				rootfsdev="${rootfsdev%% *}"
			;;
		esac
		echo "${rootfsdev}"
	fi
}



rpi4multi_do_flash_usb() {

	FN="rpi4multi_do_flash_usb"

	local tar_file=$1
	local tar_pfx="./"
	local bootpart=$2
	local rootfspart=$3

	local kernelunpack="/var/kernelunpack"					#.bin unpack

	if [ -d "$kernelunpack" ]; then
		echo "removing previous unpackdir: $kernelunpack"
		#NEEDS EMPTY OR ROOT SAFETY FF or wc -c
		rm -rf $kernelunpack
	fi

	echo "$FN> begin"; sleep 2

	echo ""
	echo "         tarfile: $1"
	echo "        bootpart: $bootpart"
	echo "      rootfspart: $rootfspart"
	echo "      saveconfig: $4"
	echo ""
	sleep 3
 	#echo "   bootpartavail: $bootpartavail"; echo " rootfspartavail: $rootfspartavail"; sleep 3


	#echo "whats my PATH: $PATH"; sleep 5 #PATH: /usr/sbin:/usr/bin:/sbin:/bin
	#########################################################################################################
	#echo "find / | grep e2fsck"; sleep 2; find / | grep e2fsck #/tmp/root/usr/sbin/e2fsck + /usr/sbin/e2fsck ?
	if command -v e2fsck; then
        	echo "e2fsck [present]" && sleep 1
        else
		echo "e2fsck [notpresent]" && sleep 1
	fi
	#e2fsck || fsck.ext2 etc symlinks #echo "e2fsck"; sleep 2; e2fsck; sleep 2 #echo "fsck.ext2"; sleep 2; fsck.ext2; sleep 2
	#ext2 var?


    ######################## WE SHOULD DO INITIAL TAR CONTENT VALIDATION EARLIERHERE



    mkdir -p /boot #NEEDS TO BE REMOVED LATER... ??? one too may boot/ somewhere either p1?



	echo "Dump a config if needed now"; sleep 3
	#echo "LARRY exit"; exit 0


	####################################################################################################
	#echo "mount -t ext2 $bootpart /boot"
	#if ! mount -t ext2 $bootpart /boot; then
	#	echo "mounting of bootpart: $bootpart failed"; sleep 3; return 1
	#fi
	####################################################################################################
	#if [ ! -f /boot/.wrtboot ]; then
	#	echo "${bootpart} > .wrtboot [no]"; sleep 2; return 1
		##########echo "${bootpart}@/boot/.wrtboot [create]"; sleep 2; touch /boot/.wrtboot #tmpfix
	#else
	#	echo "${bootpart} .wrtboot [ok]"
	#fi
	#sleep 2
	####################################################################################################



	##########echo "ls -lah /boot"; sleep 2; ls -lah /boot; sleep 5
	    #################echo "mount"; sleep 1; mount; sleep 3
	    ################### echo "df -h | grep boot"; df -h | grep boot; sleep 3


####TURNBACKON!!!!!!!
	#mkdir -p /rootfs
	#echo "mount -t ext4 $rootfspart /rootfs"
	#if ! mount -t ext4 $rootfspart /rootfs; then
	#	echo "mounting of rootfspart: $rootfspart failed" && sleep 2 && return 1
	#fi



	#if [ ! -f /rootfs/.wrtrootfs ]; then
	#	echo "${rootfspart} .wrtrootfs [no]"; sleep 2; return 1
		#######echo "${rootfspart} .wrtrootfs [create]"; sleep 2; touch /rootfs/.wrtrootfs #tmpfix
	#else
	#	echo "${rootfspart} .wrtrootfs [ok]"
	#fi
	#sleep 2




#IDENTICAL!!!
##################################################################################### FROMrt2600acFAILEDoldfilemmcattempt202007
#	local board_dir=$(tar tf $tar_file | grep -m 1 '^'$tar_pfx'sysupgrade-.*/$')
#	board_dir=${board_dir%/}
#	echo "board_dir: $board_dir"; sleep 2
#################################	#echo "shouldnoexist: ls -lah $board_dir/"; ls -lah $board_dir/; sleep 2


	local board_dir=$(tar tzf $tar_file | grep -m 1 '^'$tar_pfx'sysupgrade-.*/$')
	board_dir=${board_dir%/}
	echo "board_dir: $board_dir"; sleep 2

	####################################### 2020 while bug is checked
	if [ -z "$board_dir" ]; then
		echo "board_dir: [nope] in $tar_file [abort]"; sleep 10
        	echo "dbg: lets have a look"; sleep 2; tar tzf $tar_file; sleep 20
        	return 1
	fi

	#echo "shouldnoexist: ls -lah $board_dir/"; ls -lah $board_dir/; sleep 2


    ################### DO WE NEED TO UNPACK IT? ##########################################################
	################### THEONLYREASON ??? >>> tar xzf ${kernelunpack}/${board_dir}/rootfs.tar.gz -C /rootfs
    #######################################################################################################



	if [ -d "$kernelunpack" ]; then echo "there is an unpack dir present already: $kernelunpack"; sleep 5; fi

	echo "mkdir -p $kernelunpack"; sleep 2
	mkdir -p $kernelunpack

	echo "creating tar extract dir: $kernelunpack"; sleep 1
	echo "tar xzf $tar_file -C ${kernelunpack}/"; sleep 2
	tar xzf $tar_file -C ${kernelunpack}/
	echo "ls -lah $kernelunpack/"; ls -lah $kernelunpack/; sleep 5

	rootfstarname=$(find $kernelunpack | grep 'rootfs.tar.gz$' | head -n1)
	echo "rootfstarname: $rootfstarname"

	mkdir -p $kernelunpack/bootfilesnew
	tar xf ${kernelunpack}/bootfiles.tar.gz -C $kernelunpack/bootfilesnew
	rm $kernelunpack/bootfilesnew/config.txt
	rm $kernelunpack/bootfilesnew/cmdline.txt

	echo "next: cp -arf $kernelunpack/bootfilesnew/. $bootpart/"
	#cp -arf $kernelunpack/bootfilesnew/. $bootpart/
	#cp: can't preserve ownership
	cp -arf $kernelunpack/bootfilesnew/. $bootpart/ 2>/dev/null
	sleep 2


	echo "mount|clean $rootfspart/"
	echo "mkdir -p /rootfs"
	mkdir -p /rootfs
	echo "mount $rootfspart /rootfs"
	mount $rootfspart /rootfs
	sleep 2


	#if .vanilla
	cleanrootfsdirs "/rootfs"
	sleep 2


	echo "next: cp $kernelunpack/*rootfs.tar.gz $rootfspart/ (@/rootfs)"
	cp $kernelunpack/*rootfs.tar.gz /rootfs/rootfs.tar.gz
	sleep 2


	echo "extract $rootfspart/"
	echo "(cd /rootfs && tar -xzvf *rootfs.tar.gz)"

    sleep 2


	#(cd /rootfs && tar -xzvf *rootfs.tar.gz)
	(cd /rootfs && tar -xzf *rootfs.tar.gz)
	#rm /rootfs/rootfs.tar.gz
	sleep 2



	echo "fixup cmdline.txt" #@@@report||precheckneeded
    sed -i "s!root=/dev/mmcblk0p2!root=$rootfspart!g" $bootpart/cmdline.txt
	cat $bootpart/cmdline.txt
	sleep 2



    #if CONFIG or .vanilla
	echo "config $rootfspart/"
	sysupgrade -k -b /rootfs/r.tar.gz
	(cd /rootfs && tar -xvzf r.tar.gz)
	sleep 2


	echo "toggle $rootfspart/"; sleep 2

	echo "sync-n-umount $rootfspart @ /rootfs TODO"; sleep 2


	echo "image install [complete]"; exit 0 #echo "SAFETY2 exit"; exit 0


	#if [ ! -f "$UPGRADE_BACKUP" ]; then
	#	echo "$UPGRADE_BACKUP [no keep settings] > skip cp to /rootfs/$BACKUP_FILE"; sleep 3
	#else
	#	echo "cp -v $UPGRADE_BACKUP /rootfs/$BACKUP_FILE"; sleep 3
	#	cp -v $UPGRADE_BACKUP /rootfs/$BACKUP_FILE
	#	sleep 2
	#fi

	#sync
	#umount -a || sleep 5 && umount -a
	#reboot -f

}






cleanrootfsdirs() {
	local rootfsmnt="$1" #NOTWORKIN>var->tmp-L    run init boot; do
	for fold in etc root lib bin overlay sbin usr proc sys tmp mnt dev www rom var run init; do
		if [ -e ${rootfsmnt}/$fold ]; then
			echo -n " /${fold}"
			rm -rf ${rootfsmnt}/${fold}
		else
			echo -n " -/${fold}";
		fi; sleep 1
	done; echo ""
	#echo "######################### postclean check"; sleep 2; ls -la $rootfsmnt/; sleep 5
}


writewrtboottoggle() {
    echo "writeboottoggleremovedforspace"; sleep 5
}



rpi_get_bootpart() {
	#probably take param 2 to source os2.ini
#FN="rpi_get_bootpart"
#echo "$FN> ${*}"
	echo "/dev/mmcblk0p1" #echo "/dev/sda1"
}




rpi_get_rootfspart() {
	#probably take param 2 to source os2.ini #echo "sda3" #echo "/dev/sda3"
	#NOTE: case is temporary check and load /boot/osX/os.ini

#FN="rpi_get_rootfspart"
#echo "$FN> ${*}"


case "$1" in
	os1)
	    echo "/dev/mmcblk0p3"
	;;
	os2)
	    echo "/dev/mmcblk0p4"
	;;
	os3)
		echo "/dev/sda6"
	;;
esac
}




rpi4multi_do_upgrade() {

	FN="rpi4multi_do_upgrade"

	local tar_file="$1"
	local tar_pfx="./"
	########################################## ADDS #local board=$(board_name)
	local board=$(cat /tmp/sysinfo/board_name | cut -d',' -f2)
	local cmdlinerootfs="$(rpi4multi_get_cmdlinerootfs)"
	local os_slot="$2"
	local osBdir="/boot/$2"
	#echo "DBG local rootfspart=\"\$(rpi_get_rootfspart \"$2\")\""
	local rootfspart="$(rpi_get_rootfspart "$2")"
	local bootpart="$(rpi_get_bootpart)"
	local kernelmax=5194304 #4194304 # ~ 4MB

	if [ ! -z "$3" ]; then
		echo "CONFIG will be migrated"
		local SAVECONFIG=1
	else
		echo "CONFIG not REQUESTED"
	fi

	#toggle


	if [ -z "$bootpart" ]; then echo "unable to retrieve bootpart"; return 1; fi
	if [ -z "$rootfspart" ]; then echo "unable to retrieve rootfspart"; return 1; fi


	########################################## ADDS
	echo "            board: $board"
	echo ""
	echo "        multislot: $os_slot"
	echo "          bootDIR: $osBdir"
	########################################## ADDS

	echo "         bootpart: $bootpart"
	echo "       rootfspart: $rootfspart"
	echo ""
	echo "    cmdlinerootfs: $cmdlinerootfs"
	echo "         tar_file: $tar_file"
	echo ""
	sleep 2

    ################################### dont think this is used... platform.sh has copy data .bootalt...
	#if [ -f "/.bootalt" ]; then
	#	echo "testcopydataflag>/.bootalt found here: `pwd`"
	#	echo "###################################### cat /.bootalt"
	#	cat /.bootalt; sleep 3
	#else
	#	echo "/.bootalt found not here: `pwd`"
	#fi; sleep 2


	if ! echo "${cmdlinerootfs}" | grep -Eq '(/dev/sd|/dev/mmc)'; then
		echo "cmdlinerootfs: $cmdlinerootfs != sdx or mmc"; sleep 3
		return 1
	fi
	#echo "################################### ADDS_DBG: cmdlinerootfs"; echo "cmdlinerootfs: $cmdlinerootfs"


	case "$board" in
	4-model-b)
	    echo "############################### 4-modelb setupgrade ENV"; sleep 2

	    if [ "$cmdlinerootfs" = "$rootfspart" ]; then
		    echo "cmdlinerootfs: $cmdlinerootfs = rootfspart: $rootfspart"
		    wehaveissues=1
		    wehaveissues="$wehaveissues rootfsisrunningfs"
	    fi

	#NB: DO NOT SYSUPGRADE IF YOUR usb boot.txt is using rootfs on mmc !!! aka block devs must reside on same disk for sysup

	case "$rootfspart" in #case "$cmdlinerootfs" in
		"/dev/mmcblk0p3")
			echo "rootfs on internal mmc: /dev/mmcblk0p3 os1"; sleep 3
		;;
		"/dev/mmcblk0p4")
			echo "rootfs on internal mmc: /dev/mmcblk0p4 os2"; sleep 3 #bootpart="/dev/mmcblk0p1"; rootfspart="/dev/mmcblk0p6"
		;;
		"/dev/sda3")
			echo "rootfs on external: /dev/sda3 TBA"; sleep 3 #bootpart="/dev/sda1"; #rootfspart="/dev/sda3"
		;;
		*)
			echo "unsupported rootfspart: $rootfspart"; sleep 2
			return 1
		;;
	esac
	;;
	*)
		echo "unsupported board: $board rpimulti.sh"; sleep 2
		return 1
		;;
	esac

	if [ ! -b "${rootfspart}" ]; then
		#echo "rootfspart: $rootfspart is not plugged in"
		wehaveissues="$wehaveissues rootfsdevNOBLOCKDEV"
	fi

	if [ ! -b "${bootpart}" ]; then
		#echo "bootpart: $bootpart is not plugged in"
		wehaveissues="$wehaveissues bootdevNOBLOCKDEV"
	fi

	echo "         bootpart: $bootpart"
	echo "       rootfspart: $rootfspart"
	sleep 2

    #if -b sdb? return 1? we dont support multple usb yet


	#synology_do_flash_usb $tar_file $bootpart $rootfspart
	rpi4multi_do_flash_usb $tar_file $osBdir $rootfspart $SAVECONFIG
	echo "TESTY"; exit 0


	if [ ! -z "$wehaveissues" ]; then
		echo "issues: $wehaveissues" && return 1
	else

		echo "OFF synology_do_flash_usb $tar_file $bootpart $rootfspart"
		#synology_do_flash_usb $tar_file $bootpart $rootfspart

		echo "safeexit"; exit 0
		return 0


	fi

}

#	[ -b "${rootfspart}" ] || echo "rootfspart: $rootfspart is not plugged in"
#	[ -b "${rootfspart}" ] || return 1
#	[ -b "${bootpart}" ] || echo "bootpart: $bootpart is not plugged in"
#	[ -b "${bootpart}" ] || return 1



#############################################################
#			NON-ONSYSLOGIC
#############################################################



echu() { #preusagespecificnote
echo ""; echo "	#########################################"; echo "	${*}"; echo "	#########################################"
echo ""
}



#local FILE="$2"
#@@@!!!@>getfsblkid.func

blkidmulti() {

    #! DISK global RM@top > /tmp/blkid
    #!grep-vswap@labels


#MOVEDtoTOP
#BLKID="cat /tmp/blkid"
#if [ ! -f /tmp/blkid ]; then blkid > /tmp/blkid; fi

case "$1" in
    labels)
        $BLKID | grep -v 'TYPE="swap"' | \
        awk -F "LABEL=" '{printf $2; printf "\n"}' | sed -e 's/"//g' | sed -e "s/\'//g" | awk '{print $1}'
    ;;
    mmcnum)
        $BLKID | grep "^$DISK" | wc -l
    ;;
    mmcuuidnum)
        $BLKID | grep "^$DISK" | grep ' UUID=' | wc -l
    ;;
    *)
        $BLKID
    ;;
esac
}







getfsblkidsampkeonky() {

if [ "$2" == "fs" ]; then valGET="TYPE";
elif [ "$2" == "uuid" ]; then valGET="UUID";
elif [ "$2" == "label" ]; then valGET="LABEL";
else valGET="TYPE";
fi
for o in `block info | grep "$1"`; do
	feilD="`echo "${o}" | cut -d'=' -f1`"
	if [ "$feilD" == "$valGET" ]; then
		foundVAL="`echo "${o}" | cut -d'=' -f2 | cut -d'"' -f2`"
		echo "$foundVAL"
	fi
done
}

#BLOCK
#getfsblkid "/dev/sdf1" (fs|label|uuid) #added 20190709 used by usbdevlistpossible
#block info "/dev/sda3" | grep -o -e "UUID=\S*"


#DEBUG=1








validaterootfsparts() {

    #MANUAL CHECKING OF -b &&|| root=@slot/cmdline.txt -> slot/os.ini<isvalid=1 isvalid=1===dontverifyblockdev/prechecked (i.e. usb)

        find /boot | grep '/cmdline.txt$' | while read THIS; do
			osrootfsdev=
            dirTHIS=$(dirname $THIS)
            #echo -n "$THIS"
            echo -n "$dirTHIS"

            if [ "$dirTHIS" = "/boot" ]; then
                echo " [baseos]"
            elif [ "$dirTHIS" = "/boot/os0" ]; then
                echo " [ramfs]"
            elif grep -q '^isvalid=1' $(dirname $THIS)/os.ini; then #2>/dev/null

                #echo "awk -F 'rootfs=' '{printf $2}' $(dirname $THIS)/cmdline.txt"
                #osrootfsdev=$(awk -F 'root=' '{printf $2}' $(dirname $THIS)/cmdline.txt)
                osrootfsdev=$(awk -F 'root=' '{printf $2}' $(dirname $THIS)/cmdline.txt | cut -d' ' -f1)
                echo " [valid] $osrootfsdev"
                #echo $(dirname $THIS)/cmdline.txt


				#awk -F 'os_prefix=' '{printf $2}' /boot/config.txt | sed -e 's/\//\n/g'



            else
                echo " [blank]" #echo " [invalid]"
            fi
            which usleep &>/dev/null && usleep 70000 #sleep 1
        done

    }











if [ ! -z "$DOINFO" ]; then #DOINFO=1

    if [ -z "$DISK" ]; then
        DISK="/dev/mmcblk0p"
    else
        echo "DISK: $DISK [set-early]"; sleep 3
    fi

    blkPARTSmmcnum=$(blkidmulti "mmcnum") #######blkPARTSmmcnum=$(blkid | grep "^$DISK" | wc -l)
    blkPARTSmmcUUIDnum=$(blkidmulti "mmcuuidnum") ########blkPARTSmmcUUIDnum=$(blkid | grep "^$DISK" | grep ' UUID=' | wc -l)
    osPFXsetCNT=$(cat /boot/config.txt 2>/dev/null | grep '^os_prefix' | wc -l)
    osPFXoffCNT=$(cat /boot/config.txt 2>/dev/null | grep '#os_prefix' | wc -l)

    if [ "$blkPARTSmmcnum" -eq 2 ] && [ "$blkPARTSmmcUUIDnum" -eq 2 ]; then
        blkPARTSstock=1
    fi



    #0925>tmpoff
    #echo "       blkmmccnt: $blkPARTSmmcnum"
    #echo "     blkmmcfscnt: $blkPARTSmmcUUIDnum"
    #echo "################################################### disk-to-os-detect-tests"
    #blkidmulti "labels" | grep -E '(^os|rootfs|boot)'



    if [ -f /boot/.initialize ] && [ ! -z "$blkPARTSstock" ]; then
        echo "################################################### INITIALIZE stage2"
        #if blkPARTSmmcUUIDnum 4 ok 2 reboot or issues...
        echo ""
        echo "###########------------> reboot or resolve partiion issues"
        echo ""
    elif [ -f /boot/.initialize ] && [ -z "$blkPARTSstock" ]; then
        echo ".initialize remove or partition issues"
    elif [ ! -f /boot/.initialize ] && [ "$blkPARTSmmcUUIDnum" -eq 4 ]; then
        #echo "################################################### INITIALIZE completed"
        echo "################################################### [setup] MORECHECKS i.e. osdirs kernels roofspartUUIDs"

	if [ "$(validaterootfsparts | wc -l)" -lt 3 ]; then
		echo "os-boot-dirs-incomplete"
	fi



	else
        echo "likely partition issues"
        :
    fi



    echo "################################################### INFO" #echo "### config.txt: os_prefix"
    #osPFXsetCNT=$(cat /boot/config.txt 2>/dev/null | grep '^os_prefix' | wc -l)
    if [ "$osPFXsetCNT" -eq 1 ]; then

        cursetpfx=$(cat /boot/config.txt 2>/dev/null | grep '^os_prefix' | sed 's!\/!!g')
        if ! grep -q "$cursetpfx" /proc/cmdline; then
            echo "$cursetpfx [reboot-pending] $(grep os_prefix /proc/cmdline)"
        else
            echo "$cursetpfx [current]"
        fi

    elif [ "$osPFXsetCNT" -gt 1 ]; then
        echo "WARNING: /boot/config.txt os_prefix > multiple enabled entries"
        cat /boot/config.txt 2>/dev/null | grep '^os_prefix'
    else
        #osPFXoffCNT=$(cat /boot/config.txt 2>/dev/null | grep '#os_prefix' | wc -l)
        if [ "$osPFXoffCNT" -eq 3 ]; then
            echo "osPFXoffCNT: $osPFXoffCNT [avg]"
            cat /boot/config.txt 2>/dev/null | grep '#os_prefix'
        elif [ "$osPFXoffCNT" -gt 3 ]; then
            echo "osPFXoffCNT: $osPFXoffCNT [added?]"
            cat /boot/config.txt 2>/dev/null | grep '#os_prefix'
        elif [ "$osPFXoffCNT" -eq 0 ]; then
            INFONOTE="${INFONOTE} config.txt-zeropfx"
            echo "osPFXoffCNT: $osPFXoffCNT [zero-notsetup>init or config.txt changed>checkbackup?]"
            cat /boot/config.txt 2>/dev/null | grep '#os_prefix'
        else
            echo "osPFXoffCNT: $osPFXoffCNT [1-2 edited]" #[6+wont hit this -gt 3
            cat /boot/config.txt 2>/dev/null | grep '#os_prefix'
        fi
    fi




    echo -n "################################################### /boot/multiboot.ini"
    if [ -f /boot/multiboot.ini ]; then
        echo " [ok]"
        cat /boot/multiboot.ini 2>/dev/null | grep -vE '(^#|^$)'
    else
        echo " [nofile]"
    fi

    echo -n "################################################### PFX-REST"
    if [ -f /boot/.prefixrestore ]; then
        echo $(cat /boot/.prefixrestore)
    else
        echo "not-set"
    fi
























    validaterootfsparts












    echo ""

    if [ ! -z "$INFONOTE" ]; then
        echo "INFONOTE: $INFONOTE"
    fi

    exit 0

fi





if [ ! -z "$DOINSTALL" ]; then

    if [ ! -z "$URL" ]; then
	    : #dl||>[tmp/storage-path]$IMAGE && IMAGE=storage/IMAGE
    fi

    echo "PARSETESTSKIPPAYLOAD"

    #rpi4multi_do_upgrade() { #rpi4multi_do_upgrade "$1" "$2" $CONFIG
    echU "rpi4multi_do_upgrade \"$IMAGE\" \"$dSLOT\" $CONFIG"
    sleep 2
    rpi4multi_do_upgrade "$IMAGE" "$dSLOT" $CONFIG

fi










############################################ PRE-END-sACTION=install
#echU ">>> debug check still mounted"
#mount | grep '^/dev/mmcblk0'
####################################################### sACTION install||toggle
#echU ">>> debug check config.txt all prefix lines"
#cat /boot/config.txt | grep os_prefix

#############################################################
#			NON-ONSYSLOGICEND
exit 0
#############################################################




    #awk -F 'ubi.mtd=' '{printf $2}' /proc/cmdline | sed -e 's/ .*$//'
	#awk '{print $1; printf "\n"}' <<<$'foo bar\nspam egg'
    #| sed -e 's/"//g' | sed -e "s/\'//g"
#blkid | awk -F "$VALUE" '{printf $2}' | sed -e 's/"//g' | sed -e "s/\'//g"
#echo "#####################################################################5"
#blkid | grepstuff "LABEL="
##################################################################### notused
grepstuff() { #streamfunctionasfileorcmd

	local VALUE="$1"
	local LINE=

	awk -F "$VALUE" '{printf $2; printf "\n"}' | sed -e 's/"//g' | sed -e "s/\'//g" | awk '{print $1}'
    ####
    #return 0
    ####
    #while read LINE; do
	#echo $LINE | awk -F "$VALUE" '{printf $2}' | sed -e 's/"//g' | sed -e "s/\'//g"
    #done
    #####
	#awk -F "$VALUE" '{printf $2}' | sed -e 's/"//g' | sed -e "s/\'//g"
    ####


    #| sed -e 's/"//g' | sed -e "s/\'//g"
    #| sed -e 's/ .*$//'

    #| sed -e 's/"//g' | sed -e "s/\'//g"
	#awk -F "$VALUE" '{printf $2}' $FILE | sed -e 's/ .*$//'
    #if ! -f
		# if command -v $FILEpart1 then CMD=FILEall?

	#awk -F "$VALUE" '{printf $2}' $FILE | sed -e 's/ .*$//'
}


#awk -F "$VALUE" '{printf $2; printf "\n"}' | sed -e 's/"//g' | sed -e "s/\'//g"
#sed -e 's/ .*$//'
#| sed -e 's/"//g' | sed -e "s/\'//g"
#blkid | awk -F 'LABEL=' '{printf $2; printf "\n"}'
#awk '{print $1; printf "\n"}' <<<$'foo bar\nspam egg'
#blkid | grep -v 'TYPE="swap"' | \
#    awk -F "LABEL=" '{printf $2; printf "\n"}' | sed -e 's/"//g' | sed -e "s/\'//g" | awk '{print $1}'
#blkid | awk -F 'LABEL=' '{printf $2}' | sed -e 's/ .*$//'
#blkid | awk -F 'LABEL=' '{printf $2; printf "\n"}' | sed -e 's/ .*$//'
#blkid | awk -F 'LABEL=' '{printf $2; printf "\n"}' | sed -e 's/"//g' | sed -e "s/\'//g"
###nohandle" or newline
#blkid | awk -F 'LABEL=' '{printf $2}' | sed -e 's/\//\n/g'
#awk -F 'LABEL=' '{printf $2}' BblockidK | sed -e 's/\//\n/g'
###
#awk -F 'os_prefix=' '{printf $2}' /boot/config.txt | sed -e 's/\//\n/g'
#awk -F 'os_prefix=' '{printf $2}' /boot/config.txt | sed -e 's/\//\n/g' | while read... grep isvalid=1 /boot/.../os.ini
#nope awk -F 'LABEL=' '{printf $2}' ./BK | sed 's/ .*$/\n/g'
#sameline?
#awk -F 'ubi.mtd=' '{printf $2}' /proc/cmdline | sed -e 's/ .*$//'
#grepstuff "ubi.mtd=" "file||command?"
#####
#awk -F "$VALUE" '{printf $2}' $FILE | sed -e 's/ .*$//'
#awk -F "$VALUE" '{printf $2}' $(CMD) | sed -e 's/ .*$//'
####
#awk -F 'os_prefix=' '{printf $2}' /boot/config.txt | sed -e 's/\//\n/g'
#awk -F 'os_prefix=' '{printf $2}' /boot/config.txt | sed -e 's/\//\n/g' | while read... grep isvalid=1 /boot/.../os.ini


FAKETESTINGVARS() {

DOINIT=1
VANILLA=1
ISSUES=
#echU() { echo "$*"; sleep 1; }
SCRUBBOOT 2>/dev/null
#SCRUBBOOT

}



#if [ "$(grep -E 'default.*0' < /boot/grub/grub.cfg)" ]; then
#	sed -i -e 's/set default="0"/set default="1"/' /boot/grub/grub.cfg
#elif [ "$(grep -E 'default.*1' < /boot/grub/grub.cfg)" ]; then
#	sed -i -e 's/set default="1"/set default="0"/' /boot/grub/grub.cfg
#fi
############
#echo -n "Grub set to: "
#grep default < /boot/grub/grub.cfg





#ROOT_CMD="$(sed -n 's|^.*root=\(\S\+\)\s.*|\1|p' /boot/cmdline.txt)"




#		set -- $(dd if="/dev/$diskdev" bs=1 skip=1168 count=16 2>/dev/null | hexdump -v -e '8/1 "%02x "" "2/1 "%02x""-"6/1 "%02x"')
#		sed -i "s/\(PARTUUID=\)[a-f0-9-]\+/\1$4$3$2$1-$6$5-$8$7-$9/ig" /mnt/boot/grub/grub.cfg











