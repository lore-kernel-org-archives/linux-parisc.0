From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] Linux-Vserver: finaly seems to work basicaly ;-)
Date: Tue, 13 Dec 2005 17:40:03 +0100
Message-ID: <IRG3MR$81CB7F45F8AC7660A8DC2B387303F836@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: parisc-linux <parisc-linux@parisc-linux.org>
To: "soete.joel" <soete.joel@tiscali.be>
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

> Hello all,
> 
> Just a small update, till now:
> 
> 	o latest patch-2.6.14.3-vs2.1.0-rc10.diff against our latest 2.6.14
> 	  (cvs dated 20051111) merged with upstream patch-2.6.14.3.bz2 boot
> 	  fine on c110, d380 (32bit up).
> 	o and preliminary testme.sh-0.14 finaly passed with success on the c11=
0
> 	  (just need a small patch of util-vserver_0.30.209)
> # ./testme.sh-0.14
> Linux-VServer Test [V0.14] Copyright (C) 2003-2005 H.Poetzl
> chcontext is working.
> chbind is working.
> Linux 2.6.14.3-vs2.1.0-rc10-pa0-c110 parisc/0.30.209/0.30.209 [Ea] (0)
> VCI:  0002:0001 263 03000116
> ---
> [000]# succeeded.
> [001]# succeeded.
> [011]# succeeded.
> [031]# succeeded.
> [101]# succeeded.
> [102]# succeeded.
> [201]# succeeded.
> [202]# succeeded.
> 
> ;-)
> 
> Hope now to be able to go further next week.
> 
I named my vserver DebSid (;-) ) with sever name debvs007 (just because t=
hat'
actualy my 7th linux system ;-) and very dream to enlarge this famer lol)=
:
# vserver-stat 
CTX   PROC    VSZ    RSS  userTIME   sysTIME    UPTIME NAME
0       68 134.3M  49.3M   7m32s62  28m01s19   4h14m54 root server
49153   15  76.8M  22.5M   0m05s31   0m14s53   2h47m02 DebSid

enter this vserver show me:
root@debvs007:~# ps -ef      
UID        PID  PPID  C STIME TTY          TIME CMD
root         1     0  0 14:05 ?        00:00:52 init [2]  
root      5294     1  0 14:05 ?        00:00:00 /sbin/syslogd
103       5318     1  0 14:05 ?        00:00:00 /usr/bin/dbus-daemon-1 --=
system
root      5340     1  0 14:05 ?        00:00:00 /usr/bin/netserver
root      5355     1  0 14:05 ?        00:00:02 /usr/bin/X11/xfs -daemon
root      5367     1  0 14:05 ?        00:00:00 /usr/sbin/xinetd -pidfile=

/var/run/xinetd.pid -stayalive
daemon    5408     1  0 14:05 ?        00:00:00 /usr/sbin/atd
root      5411     1  0 14:05 ?        00:00:00 /usr/sbin/cron
root      5426     1  0 14:05 ?        00:00:00 /usr/sbin/gdm
root      5704  5693  0 14:37 pts/1    00:00:01 /bin/bash -login
root      6418     1  0 15:51 ?        00:00:00 /usr/sbin/sshd
root      6421  6418  0 15:52 ?        00:00:00 sshd: jso [priv] 
jso       6423  6421  0 15:52 ?        00:00:00 sshd: jso@pts/6  
jso       6424  6423  0 15:52 pts/6    00:00:00 -bash
root      6434  6424  0 15:52 pts/6    00:00:00 su -
root      6435  6434  0 15:52 pts/6    00:00:00 -su
root      7573  5704  0 17:02 pts/1    00:00:00 ps -ef

And having stolen a ip address, I can also ssh :-)
> ssh 10.xx.xx.111
Linux patst007 2.6.15-rc1-pa3-d32up #8 Mon Nov 14 13:01:04 CET 2005 paris=
c
GNU/Linux

The programs included with the Debian GNU/Linux system are free software;=

the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
You have new mail.
Last login: Tue Dec 13 15:50:52 2005 from wsjso.internal.mce.org
debvs007:~ $ su -
Password: 
root@debvs007:~# ls -lrt 
total 24
drwx------ 2 root root 4096 Nov 23  2003 Mail
-rw-r--r-- 1 root root   26 Apr 20  2005 Vjso
drwxr-xr-x 2 root root 4096 Oct  5 15:26 tmp
drwxr-xr-x 2 root root 4096 Oct  5 15:51 var
drwxr-xr-x 2 root root 4096 Nov  3 19:09 bin
drwxr-xr-x 2 root root 4096 Dec 13 14:19 Man
[...]

I just have to gather some info from place to place to reach to re-used m=
y
existing chroot disk without loosing time and energy to deboostrap and
re-custumised it.

Now, just have to finalise startup scripts ;-) and obviously many much mo=
re
test but basicaly seems to already realise a dream.

Hth,
    Joel

 =0A=0A-------------------------------------------------------=0ANOTE! My=
 email address is changing to ... @scarlet.be=0APlease make the necessary=
 changes in your address book. =0A=0A

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
