Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id HAA16512
	for <parisc-linux@puffin.external.hp.com>; Mon, 15 Jan 2001 07:48:36 -0700
Received: from athena.louisville.edu (athena.louisville.edu [136.165.1.37])
	by erouter1.it-datacntr.louisville.edu (Postfix) with ESMTP id DFE3D2328F
	for <parisc-linux@thepuffingroup.com>; Mon, 15 Jan 2001 09:52:14 -0500 (EST)
Date: Mon, 15 Jan 2001 09:51:43 -0500
From: "Phillip D. Beal" <pdbeal@louisville.edu>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 715/80 problem
Message-ID: <20010115095143.A137730@athena.louisville.edu>
References: <20010111213734.D134330@athena.louisville.edu> <3A5E8AA6.6D825A61@linuxcare.com> <20010112182012.H13351@neep.com.au> <20010113223513.A63406@athena.louisville.edu> <3A614153.68903841@linuxcare.com> <20010114130220.A92364@athena.louisville.edu> <3A61F329.5E315E9F@linuxcare.com> <20010114201356.A32402@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="LQksG6bCIzRHxTLp"
In-Reply-To: <20010114201356.A32402@parcelfarce.linux.theplanet.co.uk>; from matthew@wil.cx on Sun, Jan 14, 2001 at 08:13:56PM +0000
List-ID: <linux-parisc.vger.kernel.org>


--LQksG6bCIzRHxTLp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jan 14, 2001 at 08:13:56PM +0000, Matthew Wilcox wrote:
> On Sun, Jan 14, 2001 at 01:42:49PM -0500, Alex deVries wrote:
> > Wait!  I said that 715/new uses bootp, but 715/old uses rbootd.
> > 
> > And I don't believe you when you say that your 735 and 755 netboot
> > properly. I'd be convinced if you showed me both a) the output of
> > 'rbootd -d' and b) console output.
> 
> why's it so hard to believe he might have rbootd configured correctly,
> but have made a typo in his tftpd / bootpd configuration?
> 
> Phillip, have you tried using tftp to fetch the image, for example?

Well, Tftp works because the same build system also boots four HP
Xterminals through tftp, and the Xterminals work and boot fine, and yes
I can get the vmlinux through tftp.  I have attached a copy of my config
files and I'll send the console output on tuesday, its the only time
I'll have a chance to get to reboot the machines and watch the console
output again.  The one thing I'm wondering though, the 715/25 seems to
think it has two mac addresses.  This is why you'll see two configs for
parisc in the bootp config.

-- 
Phillip Beal                           ___           _               _   
Electrical and Computer Engineering   | _ ) ___ __ _| |___  _ _  ___| |_ 
pdbeal@louisville.edu                 | _ \/ -_) _` | |_ /_| ' \/ -_)  _|
http://www.bealz.net/                 |___/\___\__,_|_/__(_)_||_\___|\__|

--LQksG6bCIzRHxTLp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=bootptab

# bootptab
#
# Created on 10/29/2000 by SYSPDB
# Used for ramdisk boot for "goat"
goat:\
   :hd=/tftpboot:\
   :bf=vmlinux:\
   :ht=ether:\
   :ha=080009323a5b:\
   :sm=255.255.255.0:\
   :hn:\
   :ip=192.168.1.187:\
   :vm=rfc1048:

monkey:\
   :hd=/tftpboot:\
   :bf=vmlinux:\
   :ht=ether:\
   :ha=080009832dd6:\
   :sm=255.255.255.0:\
   :hn:\
   :ip=192.168.1.188:\
   :vm=rfc1048:

parisc:\
   :hd=/tftpboot:\
   :bf=iplboot:\
   :ht=ether:\
   :ha=0800097b98b2:\
   :sm=255.255.255.0:\
   :hn:\
   :ip=192.168.1.180:\
   :vm=rfc1048:

parisc:\
   :hd=/tftpboot:\
   :bf=iplboot:\
   :ht=ether:\
   :ha=0800097b98b3:\
   :sm=255.255.255.0:\
   :hn:\
   :ip=192.168.1.180:\
   :vm=rfc1048:

horse:\
   :hd=/tftpboot:\
   :bf=vmlinux:\
   :ht=ether:\
   :ha=080009c4d28c:\
   :sm=255.255.255.0:\
   :hn:\
   :ip=192.168.1.189:\
   :vm=rfc1048:

lab03:\
   :ht=ether:\
   :ha=00104B8FA495:\ 
   :sm=255.255.255.0:\
   :hn:\
   :ip=192.168.1.203:\
   :vm=rfc1048:




--LQksG6bCIzRHxTLp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="inetd.conf"

# See "man 8 inetd" for more information.
#
# If you make changes to this file, either reboot your machine or send the
# inetd a HUP signal with "/sbin/init.d/inetd reload" or by hand:
# Do a "ps x" as root and look up the pid of inetd. Then do a
# "kill -HUP <pid of inetd>".
# The inetd will re-read this file whenever it gets that signal.
#
# <service_name> <sock_type> <proto> <flags> <user> <server_path> <args>
#
# echo	stream	tcp	nowait	root	internal
# echo	dgram	udp	wait	root	internal
# discard	stream	tcp	nowait	root	internal
# discard	dgram	udp	wait	root	internal
# daytime	stream	tcp	nowait	root	internal
# daytime	dgram	udp	wait	root	internal
# chargen	stream	tcp	nowait	root	internal
# chargen	dgram	udp	wait	root	internal
time	stream	tcp	nowait	root	internal
time	dgram	udp	wait	root	internal
#
# These are standard services.
#
# ftp	stream	tcp	nowait	root	/usr/sbin/tcpd	wu.ftpd -a
# ftp	stream	tcp	nowait	root	/usr/sbin/tcpd	proftpd
ftp	stream	tcp	nowait	root	/usr/sbin/tcpd	in.ftpd
#
# If you want telnetd not to "keep-alives" (e.g. if it runs over a ISDN
# uplink), add "-n".  See 'man telnetd' for more details.
telnet	stream  tcp     nowait  root    /usr/sbin/tcpd	in.telnetd
# nntp	stream	tcp	nowait	news	/usr/sbin/tcpd	/usr/sbin/leafnode
# smtp	stream  tcp     nowait  root    /usr/sbin/sendmail    sendmail -bs
# printer	stream	tcp	nowait	root	/usr/sbin/tcpd	/usr/bin/lpd -i
#
# Shell, login, exec and talk are BSD protocols.
#  The option "-h" permits ``.rhosts'' files for the superuser. Please look at
#  man-page of rlogind and rshd to see more configuration possibilities about
#  .rhosts files.
shell	stream	tcp	nowait	root	/usr/sbin/tcpd	in.rshd -L
# shell	stream	tcp	nowait	root	/usr/sbin/tcpd	in.rshd -aL
#
# If you want rlogind not to "keep-alives" (e.g. if it runs over a ISDN
# uplink), add "-n".  See 'man rlogind' for more details.
login	stream	tcp	nowait	root	/usr/sbin/tcpd	in.rlogind
# login	stream	tcp	nowait	root	/usr/sbin/tcpd	in.rlogind -a
# exec	stream	tcp	nowait	root	/usr/sbin/tcpd	in.rexecd
talk	dgram	udp	wait	root	/usr/sbin/tcpd	in.talkd
ntalk	dgram	udp	wait	root	/usr/sbin/tcpd	in.talkd
#
#
# Pop et al
#
# pop2	stream	tcp	nowait	root	/usr/sbin/tcpd	in.pop2d
pop3	stream	tcp	nowait	root	/usr/sbin/tcpd	/usr/sbin/popper -s
#
# Imapd - Interactive Mail Access Protocol server
# Attention:  This service is very insecure
# imap	stream	tcp	nowait	root	/usr/sbin/tcpd	imapd
#
# Comsat - has to do with mail.
#
# comsat	dgram	udp	wait	root	/usr/sbin/tcpd	in.comsat
#
# The Internet UUCP service.
#
# uucp	stream	tcp	nowait	uucp	/usr/sbin/tcpd	/usr/lib/uucp/uucico	-l
#
# Tftp service is provided primarily for booting.  Most sites
# run this only on machines acting as "boot servers." 
#
tftp          dgram   udp     wait    root	/usr/sbin/tcpd  in.tftpd -s /tftpboot
#bootps	dgram	udp	wait	root	/usr/sbin/bootpd	bootpd -c /tftpboot
bootps	dgram	udp	wait	root	/usr/sbin/bootpd	bootpd -i -t 120
#
# Finger, systat and netstat give out user information which may be
# valuable to potential "system crackers."  Many sites choose to disable 
# some or all of these services to improve security.
# Try "telnet localhost systat" and "telnet localhost netstat" to see that
# information yourself!
#
finger	stream	tcp	nowait	nobody	/usr/sbin/tcpd	in.fingerd -w
# systat	stream	tcp	nowait	nobody	/usr/sbin/tcpd	/bin/ps	-auwwx
# netstat	stream	tcp	nowait	root	/usr/sbin/tcpd	/bin/netstat	-a
#
# For man on the fly and ht://dig (full text search)
#
http-rman	stream	tcp	nowait.10000	nobody	/usr/sbin/tcpd	/usr/sbin/http-rman
#
# For XCept4
#
# btx	stream	tcp	nowait	root	/usr/sbin/tcpd	/usr/lib/xcept4/bin/ceptd -i/usr/lib/xcept4/etc/init.ceptd -u/usr/lib/xcept4/etc/users.ceptd -l/var/log/log.ceptd
#
# For rplay daemon
#
# Old versions of rplay:
# rplay	dgram	udp	wait	root	/usr/sbin/tcpd	rplayd -b 8192 -c 60 -s 8192
# New Versions of rplay (>=3.3.0)
# rplay	dgram	udp	wait	root	/usr/sbin/tcpd	rplayd -t 30 -c 60 -s 16384 -F0 --inetd
#
# vbox (Voice Box)
# vboxd	stream	tcp	nowait	root	/usr/sbin/tcpd	/usr/sbin/vboxd
#
# For midinetd
# midinet	stream	tcp	nowait	root	/usr/sbin/tcpd	in.midinetd
#
# swat is the Samba Web Administration Tool
swat	stream	tcp	nowait.400	root	/usr/sbin/swat	swat
#
#
# amanda backup server with indexing capabilities
# amandaidx	stream	tcp	nowait	root	/usr/lib/amanda/amindexd amindexd
# amidxtape	stream	tcp	nowait	root	/usr/lib/amanda/amidxtaped amidxtaped
#
# amanda backup client
# amanda	dgram	udp	wait	amanda	/usr/lib/amanda/amandad amandad
#
# the rsync daemon
# rsync	stream	tcp	nowait	root	/usr/sbin/tcpd	/usr/sbin/rsyncd --daemon
#
#
# Mimer database
# mimer	stream	tcp	nowait	root	/opt/mimer/bin/mimtcp mimtcp -l
#
# CVS pserver (remote acces to your CVS repositories)
# Please read the section on security and passwords in the CVS manual,
# before you enable this.
# cvspserver stream tcp	nowait	root	/usr/sbin/tcpd	/usr/bin/cvs --allow-root=/home/cvsroot pserver
#
# procstatd deamon (cluster software)
# procstatd stream tcp	nowait	nobody	/usr/sbin/tcpd	/usr/sbin/procstatd -i 7885
#
# End.

--LQksG6bCIzRHxTLp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="rbootd.conf"

#
# ethernet addr     boot file(s)        comments
#
08:00:09:32:3a:5b      vmlinux             # Linux
08:00:09:83:2d:d6      vmlinux             # Linux
08:00:09:c4:d2:8c      vmlinux             # Linux
08:00:09:7b:98:b2      iplboot             # Linux
08:00:09:7b:98:b3      iplboot             # Linux

--LQksG6bCIzRHxTLp--
