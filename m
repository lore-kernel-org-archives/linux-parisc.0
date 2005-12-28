From: Joel Soete <soete.joel@tiscali.be>
Subject: [parisc-linux] Re-use of an existing chroot disk to implement some
	vserver ; -)
Date: Wed, 28 Dec 2005 11:43:51 +0000
Message-ID: <43B27A77.7090800__24516.5392094806$1416623964$gmane$org@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
To: parisc-linux@lists.parisc-linux.org,
 vserver@list.linux-vserver.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello all,

For those who could have some interest,
here are just some notes I took for remind of an implementation of a linux-vserver on a parisc-linux boxe(s).
(only tested on 32bit up kernel on a c110 and d380 models, though).

This particular execise was to re-use existing chrooted disk(s) already debbootstrap, fully populated and customized (i.e. I didn't
want to loose that job ;-) ).

(take care to use it at your own risks ;-) )

0/ References
0.1/ the reference used are:
<http://linux-vserver.org/Step-By-Step+Guide+2.6>

0.2/ more details learning:
<http://www.morethan.org/step_step.html>

1/ Kernel sources:
1.1/ parisc-linux sources:
<http://cvs.parisc-linux.org/download/linux-2.6/linux-2.6.14-pa0.tar.bz2>
(to be sure I also grab some subsequent small patches but not taged before next merge :-( )

1.2/ vanilla patch 2.6.14.4:
<http://www.kernel.org/pub/linux/kernel/v2.6/patch-2.6.14.4.bz2>

1.3/ developement linux-vserver patches:
as announced <http://archives.linux-vserver.org/200512/0244.html>

<http://www.13thfloor.at/vserver/d_rel26/v2.1.0/patch-2.6.14.4-vs2.1.0.diff>
+ a fix
<http://www.13thfloor.at/~doener/vserver/patches/diff-2.6.14.3-vs2.1.0-rc10-rc10.1.diff>

This would results in 2 rejected hunk:
* this very small ack should fix a rejected one:
(due to the diff between parisc tree and vanilla one)
--- arch/parisc/kernel/syscall_table.S.orig     2005-09-24 10:40:28.000000000 +0200
+++ arch/parisc/kernel/syscall_table.S  2005-12-22 12:26:18.000000000 +0100
@@ -368,7 +368,7 @@
         ENTRY_COMP(mbind)               /* 260 */
         ENTRY_COMP(get_mempolicy)
         ENTRY_COMP(set_mempolicy)
-       ENTRY_SAME(ni_syscall)  /* 263: reserved for vserver */
+       ENTRY_DIFF(vserver)
         ENTRY_SAME(add_key)
         ENTRY_SAME(request_key)         /* 265 */
         ENTRY_SAME(keyctl)
====<>====

* the second should be get rid (already applied in p-l tree ;-) )

1.4/ build and install as usual the kernel and its modules:
# make oldconfig ; make vmlinux ; make modules ; make install

1.5/ install this kernel and reboot the system with this one.

2/ verser tools: utils-verser

2.1/ grab latest src:
<http://www.13thfloor.at/vserver/d_rel26/v2.1.0/util-vserver-0.30.209.tar.bz2>

2.2/ build tools tip:

2.2.a/ as for hppa the vserver syscall nr is 263 (and not the default 273) either use:
CPPFLAGS="-D__NR_vserver=263" set in the environment
(as recommended <http://archives.linux-vserver.org/200512/0094.html> but I didn't test it, sorry)

or apply this small hunk:
diff -NaurX /usr/src/dontdiff util-vserver-0.30.209.Orig/lib/syscall-fallback.h
util-vserver-0.30.209.build/lib/syscall-fallback.h--- util-vserver-0.30.209.Orig/lib/syscall-fallback.h   2005-10-28
18:09:27.000000000 +0200
+++ util-vserver-0.30.209.build/lib/syscall-fallback.h  2005-12-11 12:33:45.000000000 +0100
@@ -45,7 +45,7 @@
  #elif  defined(__mips__) && (_MIPS_SIM == _MIPS_SIM_NABI32)
  #define __NR_vserver   236
  #elif  defined(__hppa__)
-#define __NR_vserver   *
+#define __NR_vserver   263
  #elif  defined(__powerpc__)
  #define __NR_vserver   257
  #elif  defined(__s390__)
====<>====

2.2.b/ configure tools as per debian pkg spec:
CFLAGS="-Wall -g  -O2" ./configure \
         --build hppa-linux-gnu \
         --prefix=/usr --enable-release \
         --mandir=/usr/share/man \
         --infodir=/usr/share/info \
         --sysconfdir=/etc \
         --disable-dietlibc \
         --localstatedir=/var \
         --with-vrootdir=/var/lib/vservers

(this get rid of dietlibc which is afaik not available for hppa, though)

2.3/ install tools:
# make
# make install
and as per 'make install' advise:
# make install-distribution

# mkdir /var/lock/subsys


2.4/ install util vserver startup script

# update-rc.d vprocunhide defaults 25 15
# update-rc.d vservers-legacy defaults 90 02
# update-rc.d rebootmgr defaults 30 10
# update-rc.d vservers-default defaults 90 02

and set barrier (assuming it's a new install)
# setattr --barrier /var/lib/vservers

3/ test:
follow here advise of test in above 0/ reference.

4/ Create the vserver skeleton:
# vserver --verbose DebSid build  -m skeleton --hostname hplvsrvr --netdev eth0 --interface 192.168.248.145/24

(see 0.2/ for details)

5/ Change the existing chroot disk utilization into a vserver:

5.1/ the original mount points were obviously:
#/dev/sdl3      /chroot/boot            ext3    defaults,errors=continue        0       2
#/dev/sdl6      /chroot/var             ext3    defaults,errors=continue        0       2
#/dev/sdl7      /chroot/tmp             ext3    defaults,errors=continue        0       2
#/dev/sdl8      /chroot/home            ext3    defaults,errors=continue        0       2
#/dev/sdl9      /chroot/Develop         ext3    defaults,errors=continue        0       2

which had to be unmounted (as well as eventual proc and devpts)

5.2/ Backup the related vserver vdirbase

# cd /var/lib/vservers/
# mv DebSid DebSid.Orig
# mkdir DebSid

5.3/ change the mount point of the host fstab:

# New mount point for vserver
/dev/sdc5       /var/lib/vservers/DebSid                ext3    defaults,errors=continue        0       0
/dev/sdc3       /var/lib/vservers/DebSid/boot           ext3    defaults,errors=continue        0       0
/dev/sdc6       /var/lib/vservers/DebSid/var            ext3    defaults,errors=continue        0       0
/dev/sdc7       /var/lib/vservers/DebSid/tmp            ext3    defaults,errors=continue        0       0
/dev/sdc8       /var/lib/vservers/DebSid/home           ext3    defaults,errors=continue        0       0
/dev/sdc9       /var/lib/vservers/DebSid/Develop        ext3    defaults,errors=continue        0       0

# mount -a

5.4/ Backup guest dev and sysvinit scripts.

Note: this step is only because I would like to save the oportunity to boot with the disk

5.4.1/ pseudo devices

#  cd /var/lib/vservers/DebSid
# mv dev dev.Orig

btw install the one that skeleton install ;-)

# cd ../DebSid.Orig
# find dev | cpio -mpduv ../DebSid

(already prepare env for pre-start/post-stop stuff)
# cd -
# mv dev dev.VPS ; ln -s dev.VPS dev

5.4.2/ sysvinit scripts

# cd /var/lib/vservers/DebSid/etc
# mkdir init.d.Orig rc0.d.Orig rc1.d.Orig rc2.d.Orig rc3.d.Orig rc4.d.Orig rc5.d.Orig rc6.d.Orig rcS.d.Orig default.Orig
# cd init.d ; find . | cpio -mpduv ../init.d.Orig
# cd ../rc0.d ; find . | cpio -mpduv ../rc0.d.Orig
# cd ../rc1.d ; find . | cpio -mpduv ../rc1.d.Orig
# cd ../rc2.d ; find . | cpio -mpduv ../rc2.d.Orig
# cd ../rc3.d ; find . | cpio -mpduv ../rc3.d.Orig
# cd ../rc4.d ; find . | cpio -mpduv ../rc4.d.Orig
# cd ../rc5.d ; find . | cpio -mpduv ../rc5.d.Orig
# cd ../rc6.d ; find . | cpio -mpduv ../rc6.d.Orig
# cd ../rcS.d ; find . | cpio -mpduv ../rcS.d.Orig
# cd ../default ; find . | cpio -mpduv ../default.Orig

5.4.3/ remove some startup script
(see advises 0.1/)

# cd ../rc0.d
# rm K20makedev K25hwclock.sh S30urandom S31umountnfs.sh  S35networking S36ifupdown S40umountfs S90halt K89klogd
# cd ../rc6.d
# rm K20makedev K25hwclock.sh S30urandom S31umountnfs.sh  S35networking S36ifupdown S40umountfs S90reboot K89klogd
# cd ../rcS.d
# rm S05keymap.sh S48console-screen.sh S50hwclock.sh S40networking  S45mountnfs.sh S10checkroot.sh S02mountvirtfs
# rm S30procps.sh S35mountall.sh S36mountvirtfs S39ifupdown S30checkfs.sh S18ifupdown-clean S18hwclockfirst.sh
# cd ../rc2.d
# rm S20makedev S11klogd

5.4.4 prepare pre-start/post-stop

# cd /var/lib/vservers/DebSid/etc/

# mv default default.VPS ; ln -s default.VPS default
# mv init.d init.d.VPS; ln -s init.d.VPS init.d
# mv rc0.d rc0.d.VPS ; ln -s rc0.d.VPS rc0.d
# mv rc1.d rc1.d.VPS ; ln -s rc1.d.VPS rc1.d
# mv rc2.d rc2.d.VPS ; ln -s rc2.d.VPS rc2.d
# mv rc3.d rc3.d.VPS ; ln -s rc3.d.VPS rc3.d
# mv rc4.d rc4.d.VPS ; ln -s rc4.d.VPS rc4.d
# mv rc5.d rc5.d.VPS ; ln -s rc5.d.VPS rc5.d
# mv rc6.d rc6.d.VPS ; ln -s rc6.d.VPS rc6.d
# mv rcS.d rcS.d.VPS ; ln -s rcS.d.VPS rcS.d

5.4.5 install pre-start/post-stop scripts

# more /etc/vservers/DebSid/scripts/prepre-start
#!/bin/bash
#set -x

echo "$0 fixes sysvinit script's dir."

LNS="/bin/ln -s"
RMF="/bin/rm -f"
VPS_CFG="/var/lib/vservers"
VSP_MP="$VPS_CFG/DebSid"
VSP_Etc="$VSP_MP/etc"
VPS_SUFIX="VPS"
ORIG_SUFIX="Orig"
SUFIX="$ORIG_SUFIX"
InitDir="default init.d rc0.d rc1.d rc2.d rc3.d rc4.d rc5.d rc6.d rcS.d"

LinkDir () {

     LN_NAME="$1"
     LN_SRC="$LN_NAME.$SUFIX"

     if [ -d "$LN_SRC" ]
     then
         if [ -h "$LN_NAME" ]
         then
             $RMF "$LN_NAME"
             RC=$?
             if [ $RC -ne 0 ]
             then
                 echo "Failed to rm link $LN_NAME: please check !!!"
                 exit 1
             else
                 $LNS "$LN_SRC" "$LN_NAME"
                 RC=$?
                 if [ $RC -ne 0 ]
                 then
                     echo "Link $LN_NAME -> $LN_SRC failed."
                     exit 1
                 else
                     echo "Link $LN_NAME -> $LN_SRC is created."
                 fi
             fi
         else
             echo "$LN_NAME is not a link: please check !!!"
             exit 1
         fi
     else
         echo "$LN_SRC doesn't exist: please check !!!"
         exit 1
     fi
}

# dev
cd "$VSP_MP"
LinkDir dev

cd "$VSP_Etc"
for dir in $InitDir
do
     LinkDir "$dir"
done

exit 0
====<>====

# diff -Nau /etc/vservers/DebSid/scripts/prepre-start /etc/vservers/DebSid/scripts/postpost-stop
--- /etc/vservers/DebSid/scripts/prepre-start   2005-12-26 13:07:57.000000000 +0100
+++ /etc/vservers/DebSid/scripts/postpost-stop  2005-12-26 13:08:26.000000000 +0100
@@ -10,7 +10,7 @@
  VSP_Etc="$VSP_MP/etc"
  VPS_SUFIX="VPS"
  ORIG_SUFIX="Orig"
-SUFIX="$VPS_SUFIX"
+SUFIX="$ORIG_SUFIX"
  InitDir="default init.d rc0.d rc1.d rc2.d rc3.d rc4.d rc5.d rc6.d rcS.d"

  LinkDir () {
====<>====

# chmod u+x /etc/vservers/DebSid/scripts/prepre-start
# chmod u+x /etc/vservers/DebSid/scripts/postpost-stop


5.4.6/ some more customization (mtab and fstab)

Here are what look like mentioned files:

# more /etc/vservers/DebSid/apps/init/mtab
/dev/sdl5	/		ext3 rw,errors=continue 0 0
/dev/sdl3	/boot		ext3 rw,errors=continue 0 0
/dev/sdl6	/var		ext3 rw,errors=continue 0 0
/dev/sdl7	/tmp		ext3 rw,errors=continue 0 0
/dev/sdl8	/home		ext3 rw,errors=continue 0 0
/dev/sdl9	/Develop	ext3 rw,errors=continue 0 0

# more /etc/vservers/DebSid/fstab
none    /proc           proc    defaults                0 0
#none   /tmp            tmpfs   size=16m,mode=1777      0 0
none    /dev/pts        devpts  gid=5,mode=620          0 0

6/ Customize sshd for host and guest

For the host change the listen address:
(see /etc/ssh/sshd_config)
ListenAddress 192.168.248.45

Teh same for the guest:
(see /var/lib/vservers/DebSid/etc/ssh/sshd_config
ListenAddress 192.168.248.145


7/ first guest (aka DebSid here) start

7.1/ Start
It's now time to check if everything goes right:

# vserver DebSid start
  # vserver DebSid start
/etc/vservers/DebSid/scripts/prepre-start fixes sysvinit script's dir.
Link dev -> dev.VPS is created.
Link default -> default.VPS is created.
Link init.d -> init.d.VPS is created.
Link rc0.d -> rc0.d.VPS is created.
Link rc1.d -> rc1.d.VPS is created.
Link rc2.d -> rc2.d.VPS is created.
Link rc3.d -> rc3.d.VPS is created.
Link rc4.d -> rc4.d.VPS is created.
Link rc5.d -> rc5.d.VPS is created.
Link rc6.d -> rc6.d.VPS is created.
Link rcS.d -> rcS.d.VPS is created.
Starting system message bus: dbus-1.
Starting MTA: exim4.
Starting printer spooler: lpd.
Starting network benchmark server: netserver.
Starting OpenBSD Secure Shell server: sshd.
sadc not enabled in /etc/default/sysstat, not starting.
Setting up X font server socket directory /tmp/.font-unix...done.
Starting X font server: xfs.
Starting internet superserver: xinetd.
Starting file alteration monitor: FAM.
Starting NTP server: ntpd.
Starting anac(h)ronistic cron: anacron.
Starting deferred execution scheduler: atd.
Starting periodic command scheduler: cron.
Starting GNOME Display Manager: gdm.


          _sudZUZ#Z#XZo=_         DDDD   EEEEEE BBBB   IIIIII  AAAA   NN   NN
       _jmZZ2!!~---~!!X##wa       DD DD  EE     BB BB    II   AA  AA  NNN  NN
    .<wdP~~            -!YZL,     DD  DD EEEEE  BBBBB    II   AAAAAA  NNNN NN
   .mX2'       _%aaa__     XZ[.   DD DD  EE     BB  BB   II   AA  AA  NN NNNN
   oZ[      _jdXY!~?S#wa   ]Xb;   DDDD   EEEEEE BBBBB  IIIIII AA  AA  NN   NN
  _#e'     .]X2(     ~Xw|  )XXc
.2Z`      ]X[.       xY|  ]oZ(   Linux Version 2.6.14.4-vs2.1.0-pa0-c110
.2#;      )3k;     _s!~   jXf`   Compiled #3 Fri Dec 23 18:31:07 CET 2005
  1Z>      -]Xb/    ~    __#2(    One 120MHz PA-RISC Raven 120 T' Processor, 512M RAM
  -Zo;       +!4ZwaaaauZZXY'      119.60 Bogomips Total
   *#[,        ~-?!!!!!!-~        hplvsrvr
    XUb;.
     )YXL,,
       +3#bc,
         -)SSL,,
            ~~~~~
Updating the operating system logo: linuxlogo.

Cool ;-)

7.2/ Some check

# vserver-stat
CTX   PROC    VSZ    RSS  userTIME   sysTIME    UPTIME NAME
0       69 175.4M  58.5M  24m56s43  22m25s10  10h52m53 root server
49156    8  45.2M  10.9M   0m01s60   0m02s64   0m23s34 DebSid

More ... enter the guest

# vserver DebSid enter
root@hplvsrvr:/#

root@hplvsrvr:/# hostname
hplvsrvr

(should be the hostname given while the verser build and which could be different of the original chroot/boot disk:
root@hplvsrvr:/# cat /etc/hostname
hpalin
  ;-) )

root@hplvsrvr:/# df -k
Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/sdc5              1692220   1022512    583748  64% /
/dev/sdc3               123767      8728    108649   8% /boot
/dev/sdc6               247511    113405    121327  49% /var
/dev/sdc7               123735      4155    113191   4% /tmp
/dev/sdc8               123735      4163    113183   4% /home
/dev/sdc9              1513656   1343508    154772  90% /Develop

root@hplvsrvr:/# top -n1 -b
top - 20:54:42 up 2 min,  0 users,  load average: 0.13, 0.14, 0.06
Tasks:  10 total,   1 running,   9 sleeping,   0 stopped,   0 zombie
Cpu(s):  3.0% us,  3.5% sy,  1.0% ni, 90.8% id,  1.7% wa,  0.0% hi,  0.1% si
Mem:    512248k total,   488728k used,    23520k free,    50052k buffers
Swap:   131832k total,        4k used,   131828k free,   345232k cached

   PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  COMMAND
16939 root      15   0  2952 1160  904 R  1.8  0.2   0:00.11 top
     1 root      16   0  2292  708  572 S  0.0  0.1   0:31.77 init
16638 messageb  21   0  2780  808  624 S  0.0  0.2   0:00.04 dbus-daemon-1
16763 root      16   0  8340 1096  620 S  0.0  0.2   0:00.01 exim4
16787 root      18   0  5936 3336  712 S  0.0  0.7   0:02.60 xfs
16799 root      19   0  4516 1388 1112 S  0.0  0.3   0:00.17 xinetd
16850 daemon    21   0  2416  476  312 S  0.0  0.1   0:00.01 atd
16853 root      16   0  2588  952  736 S  0.0  0.2   0:00.10 cron
16868 root      15   0 13488 1932 1184 S  0.0  0.4   0:00.06 gdm
16921 root      15   0  3520 1836 1396 S  0.0  0.4   0:01.26 bash

(Excepted init here are the only process launch and known by thw guest, not seen by the host's top)

(next would require iproute dpkg installed: just usual apt-get install in the guest server made the drill)

root@hplvsrvr:/# ip addr show
2: eth0: <BROADCAST,MULTICAST,UP> mtu 1500 qdisc pfifo_fast qlen 1000
     link/ether 00:60:b0:07:1e:ea brd ff:ff:ff:ff:ff:ff
     inet 192.168.248.145/24 brd 192.168.248.255 scope global secondary eth0


 From a remote sever you would also be able to login the guest
$ ssh 192.168.248.145
The authenticity of host '192.168.248.145 (192.168.248.145)' can't be established.
RSA key fingerprint is 10:b7:90:32:fa:46:4e:48:be:bd:26:61:9c:e8:b0:a0.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '192.168.248.145' (RSA) to the list of known hosts.
Password:


The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
jso@hplvsrvr:~$ top -n1 -b
top - 21:02:57 up 11 min,  1 user,  load average: 0.02, 0.04, 0.03
Tasks:  13 total,   1 running,  12 sleeping,   0 stopped,   0 zombie
Cpu(s):  3.0% us,  3.4% sy,  0.9% ni, 90.9% id,  1.6% wa,  0.0% hi,  0.1% si
Mem:    512248k total,   492372k used,    19876k free,    50412k buffers
Swap:   131832k total,        4k used,   131828k free,   347120k cached

   PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  COMMAND
16973 jso       15   0  2952 1164  904 R  1.8  0.2   0:00.13 top
     1 root      16   0  2292  708  572 S  0.0  0.1   0:31.77 init
16638 messageb  21   0  2780  808  624 S  0.0  0.2   0:00.04 dbus-daemon-1
16787 root      16   0  5936 3340  716 S  0.0  0.7   0:02.60 xfs
16799 root      19   0  4516 1388 1112 S  0.0  0.3   0:00.17 xinetd
16850 daemon    21   0  2416  476  312 S  0.0  0.1   0:00.01 atd
16853 root      16   0  2588  952  736 S  0.0  0.2   0:00.11 cron
16868 root      15   0 13488 1932 1184 S  0.0  0.4   0:00.06 gdm
16921 root      16   0  3528 1880 1432 S  0.0  0.4   0:01.34 bash
16963 root      16   0  6244 1280  848 S  0.0  0.2   0:00.02 sshd
16966 root      16   0 10700 3196 2564 S  0.0  0.6   0:00.63 sshd
16969 jso       15   0 10700 1808 1172 S  0.0  0.4   0:00.07 sshd
16970 jso       15   0  3956 2016 1392 S  0.0  0.4   0:00.13 sh

jso@hplvsrvr:~$ ip addr show
2: eth0: <BROADCAST,MULTICAST,UP> mtu 1500 qdisc pfifo_fast qlen 1000
     link/ether 00:60:b0:07:1e:ea brd ff:ff:ff:ff:ff:ff
     inet 192.168.248.145/24 brd 192.168.248.255 scope global secondary eth0


7.3/ Stop

Just to be sure that all would work fine:

# vserver DebSid stop
Stopping GNOME Display Manager: gdm.
Stopping periodic command scheduler: cron.
Stopping system message bus: dbus-1.
Stopping MTA: exim4.
Stopping printer spooler: lpd not running.
Stopping network benchmark server: netserver.
Stopping rsync daemon: rsync.
Stopping OpenBSD Secure Shell server: sshd.
Stopping X font server: xfs.
Stopping internet superserver: xinetd.
Stopping file alteration monitor: FAM.
Stopping deferred execution scheduler: atd.
Sending all processes the TERM signal...done.
Sending all processes the KILL signal...done.
Saving random seed...done.
/etc/vservers/DebSid/scripts/postpost-stop fixes sysvinit script's dir.
Link dev -> dev.Orig is created.
Link default -> default.Orig is created.
Link init.d -> init.d.Orig is created.
Link rc0.d -> rc0.d.Orig is created.
Link rc1.d -> rc1.d.Orig is created.
Link rc2.d -> rc2.d.Orig is created.
Link rc3.d -> rc3.d.Orig is created.
Link rc4.d -> rc4.d.Orig is created.
Link rc5.d -> rc5.d.Orig is created.
Link rc6.d -> rc6.d.Orig is created.
Link rcS.d -> rcS.d.Orig is created.


8/ start/stop at the host reboot?

# echo "default" > /etc/vservers/DebSid/apps/init/mark

reboot would confirm that

That's all folk.

Hth,
	Joel

PS: 7.4/ independent 'apt-get dist-upgrade' of guest:

I can use now apt-get to ugrade independently my guest system because:
	o this guest is mainly a test bed for very unstable stuff like libc6
	o my host is a testing debian and my guest is an unstable, though.

Because /etc/default, /etc/init.d are actualy /etc/default.VPS and /etc/init.d.VPS, I have to take care to sync *.Orig.
As well as I have to check that rc?.d (i.e. actualy rc?.d.VPS) are not updated by links that I removed here above (5.4.3/).
(still need to check the best way to do it?)

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
