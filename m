Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.familie-weerts.de (dialin-80069.ewetel.net [212.6.80.69])
	by dsl2.external.hp.com (Postfix) with ESMTP id 815CC482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 14 Aug 2001 06:12:22 -0600 (MDT)
Date: Tue, 14 Aug 2001 14:07:17 +0000
From: Christian Weerts <christian@familie-weerts.de>
To: grundler@puffin.external.hp.com
Cc: parisc-ml <parisc-linux@lists.parisc-linux.org>
Subject: [christian@familie-weerts.de: Re: [parisc-linux] LAN booting]
Message-ID: <20010814140717.A279@familie-weerts.de>
Reply-To: Christian Weerts <christian@familie-weerts.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="a8Wt8u1KmwUX3Y2C"
List-ID: <linux-parisc.vger.kernel.org>

--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,
*plong*

Sorry, i forget the attchements ;)

----- Forwarded message from Christian Weerts <christian@familie-weerts.de> -----

Date: Tue, 14 Aug 2001 13:53:37 +0000
From: Christian Weerts <christian@familie-weerts.de>
To: Grant Grundler <grundler@puffin.external.hp.com>
Cc: parisc-ml <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] LAN booting
Reply-To: Christian Weerts <christian@familie-weerts.de>
User-Agent: Mutt/1.2.5i
In-Reply-To: <200108132355.RAA14012@puffin.external.hp.com>; from grundler@puffin.external.hp.com on Mon, Aug 13, 2001 at 05:55:23PM -0600
Organization: private

* Grant Grundler <grundler@puffin.external.hp.com> [010813 23:55]:
> Christian Weerts wrote:
> > Hi,
> > 
> > is there anyone who has a running 715/80? I want to build a kernel for this
> > machine discribed in the nfsroot howto from Martin Petersen, but i don't
> > have HP-UX anywhere.
> 
> You don't need to have HPUX - note the date of Martin's HOW-TO.
> It was posted when we were still using SOM binaries and the linker only
> ran under HPUX. You should be able to install from the 0.92 ISO
> and build kernels natively.
I will try, but first i had to boot the machine over LAN, that's my problem
at the moment.
The RISC-Machine tells something like "Error: cannot load IPL, error
detected. Bootprocess failed..."
Perhaps you could help me, so i attach the bootptab and the dhcp-conf. Also
attached are the daemon.log and output from tcpdump. Btw., gorilla is the
server and mirage the client.
I don't know what's wrong. 
On the risc-machine i told him to boot from the lan.<hw-addr-server>.

> 
> Or build kernels on x86-linux using the XC toolchain built by Matt Taggart
> and posted to the puffin.external.hp.com ftp site. Search parisc-linux
> mail archives since May 2001 if you want the full URL.
Ack.

> 
> > If i had a kernel perhaps i could boot the machine over LAN.
> 
> Could you mount the 0.92 ISO on an x86-linux box and steal that kernel?
> (there are probably several but just try the 32-bit ones.)
I'll try. So, you mean i don't need the nfsroot-package named in Martin's
HOWTO?

Greets from northern germany

	Christian

-- 
http://oldenburg.linux.de

----- End forwarded message -----

-- 
Gruss,
	Christian

-- 
http://oldenburg.linux.de

--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=bootptab

# /etc/bootptab: database for bootp server (/usr/sbin/bootpd)

# Blank lines and lines beginning with '#' are ignored.
#
# Legend:	(see bootptab.5)
#	first field -- hostname (not indented)
#	bf -- bootfile
#	bs -- bootfile size in 512-octet blocks
#	cs -- cookie servers
#	df -- dump file name
#	dn -- domain name
#	ds -- domain name servers
#	ef -- extension file
#	gw -- gateways
#	ha -- hardware address
#	hd -- home directory for bootfiles
#	hn -- host name set for client
#	ht -- hardware type
#	im -- impress servers
#	ip -- host IP address
#	lg -- log servers
#	lp -- LPR servers
#	ns -- IEN-116 name servers
#	ra -- reply address
#	rl -- resource location protocol servers
#	rp -- root path
#	sa -- boot server address
#	sm -- subnet mask
#	sw -- swap server
#	tc -- template host (points to similar host entry)
#	td -- TFTP directory
#	to -- time offset (seconds)
#	ts -- time servers
#	vm -- vendor magic number
#	Tn -- generic option tag n
#
# Be careful about including backslashes where they're needed.  Weird (bad)
# things can happen when a backslash is omitted where one is intended.
# Also, note that generic option data must be either a string or a
# sequence of bytes where each byte is a two-digit hex value.
mirage:\
	:hd=/tftpboot:\
	:bf=vmlinux:\
	:ht=ether:\
	:ha=0800095fd588:\
	:sm=255.255.255.0:\
	:ip=192.168.14.1:\
	:vm=rfc1048:


--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="daemon.log"

Aug 14 10:53:31 gorilla dhcpd-2.2.x: Internet Software Consortium DHCP Server 2.0
Aug 14 10:53:31 gorilla dhcpd-2.2.x: Copyright 1995, 1996, 1997, 1998, 1999 The Internet Software Consortium.
Aug 14 10:53:31 gorilla dhcpd-2.2.x: All rights reserved.
Aug 14 10:53:31 gorilla dhcpd-2.2.x: 
Aug 14 10:53:31 gorilla dhcpd-2.2.x: Please contribute if you find this software useful.
Aug 14 10:53:31 gorilla dhcpd-2.2.x: For info, please visit http://www.isc.org/dhcp-contrib.html
Aug 14 10:53:31 gorilla dhcpd-2.2.x: 
Aug 14 10:53:33 gorilla dhcpd-2.2.x: Listening on LPF/eth0/00:80:ad:c6:6c:cc/192.168.14.0
Aug 14 10:53:33 gorilla dhcpd-2.2.x: Sending on   LPF/eth0/00:80:ad:c6:6c:cc/192.168.14.0
Aug 14 10:53:33 gorilla dhcpd-2.2.x: Sending on   Socket/fallback/fallback-net
Aug 14 10:53:39 gorilla proftpd[224]: gorilla - ProFTPD 1.2.0pre10 standalone mode STARTUP 
Aug 14 10:58:22 gorilla dhcpd-2.2.x: Internet Software Consortium DHCP Server 2.0
Aug 14 10:58:22 gorilla dhcpd-2.2.x: Copyright 1995, 1996, 1997, 1998, 1999 The Internet Software Consortium.
Aug 14 10:58:22 gorilla dhcpd-2.2.x: All rights reserved.
Aug 14 10:58:22 gorilla dhcpd-2.2.x: 
Aug 14 10:58:22 gorilla dhcpd-2.2.x: Please contribute if you find this software useful.
Aug 14 10:58:22 gorilla dhcpd-2.2.x: For info, please visit http://www.isc.org/dhcp-contrib.html
Aug 14 10:58:22 gorilla dhcpd-2.2.x: 
Aug 14 10:58:22 gorilla dhcpd-2.2.x: Listening on LPF/eth0/00:80:ad:c6:6c:cc/192.168.14.0
Aug 14 10:58:22 gorilla dhcpd-2.2.x: Sending on   LPF/eth0/00:80:ad:c6:6c:cc/192.168.14.0
Aug 14 10:58:22 gorilla dhcpd-2.2.x: Sending on   Socket/fallback/fallback-net
Aug 14 10:59:30 gorilla dhcpd-2.2.x: BOOTREQUEST from 08:00:09:5f:d5:88 via eth0
Aug 14 10:59:30 gorilla dhcpd-2.2.x: BOOTREPLY for 192.168.14.1 to mirage (08:00:09:5f:d5:88) via eth0
Aug 14 10:59:30 gorilla bootpd[308]: version 2.4.3
Aug 14 10:59:30 gorilla in.tftpd[309]: connect from mirage
Aug 14 10:59:30 gorilla tftpd[310]: tftpd: trying to get file: vmlinux-20010629-parisc 
Aug 14 10:59:30 gorilla tftpd[310]: tftpd: serving file from /boot 
Aug 14 10:59:31 gorilla in.tftpd[311]: connect from mirage
Aug 14 10:59:31 gorilla tftpd[312]: tftpd: trying to get file: vmlinux-20010629-parisc 
Aug 14 10:59:31 gorilla tftpd[312]: tftpd: serving file from /boot 
Aug 14 10:59:31 gorilla in.tftpd[313]: connect from mirage
Aug 14 10:59:31 gorilla tftpd[314]: tftpd: trying to get file: vmlinux-20010629-parisc 
Aug 14 10:59:31 gorilla tftpd[314]: tftpd: serving file from /boot 
Aug 14 10:59:31 gorilla in.tftpd[315]: connect from mirage
Aug 14 10:59:31 gorilla tftpd[316]: tftpd: trying to get file: vmlinux-20010629-parisc 
Aug 14 10:59:31 gorilla tftpd[316]: tftpd: serving file from /boot 
Aug 14 11:01:17 gorilla dhcpd-2.2.x: BOOTREQUEST from 08:00:09:5f:d5:88 via eth0
Aug 14 11:01:17 gorilla dhcpd-2.2.x: BOOTREPLY for 192.168.14.1 to mirage (08:00:09:5f:d5:88) via eth0
Aug 14 11:01:18 gorilla in.tftpd[418]: connect from mirage
Aug 14 11:01:18 gorilla tftpd[419]: tftpd: trying to get file: /tftpboot/vmlinux 
Aug 14 11:01:18 gorilla in.tftpd[420]: connect from mirage
Aug 14 11:01:18 gorilla tftpd[421]: tftpd: trying to get file: /tftpboot/vmlinux 
Aug 14 11:01:18 gorilla in.tftpd[422]: connect from mirage
Aug 14 11:01:18 gorilla tftpd[423]: tftpd: trying to get file: /tftpboot/vmlinux 
Aug 14 11:01:18 gorilla in.tftpd[424]: connect from mirage
Aug 14 11:01:18 gorilla tftpd[425]: tftpd: trying to get file: /tftpboot/vmlinux 
Aug 14 11:02:11 gorilla dhcpd-2.2.x: BOOTREQUEST from 08:00:09:5f:d5:88 via eth0
Aug 14 11:02:11 gorilla dhcpd-2.2.x: BOOTREPLY for 192.168.14.1 to mirage (08:00:09:5f:d5:88) via eth0
Aug 14 11:02:12 gorilla in.tftpd[510]: connect from mirage
Aug 14 11:02:12 gorilla tftpd[511]: tftpd: trying to get file: /tftpboot/vmlinux 
Aug 14 11:02:12 gorilla in.tftpd[512]: connect from mirage
Aug 14 11:02:12 gorilla tftpd[513]: tftpd: trying to get file: /tftpboot/vmlinux 
Aug 14 11:02:12 gorilla in.tftpd[514]: connect from mirage
Aug 14 11:02:12 gorilla tftpd[515]: tftpd: trying to get file: /tftpboot/vmlinux 
Aug 14 11:02:12 gorilla in.tftpd[516]: connect from mirage
Aug 14 11:02:12 gorilla tftpd[517]: tftpd: trying to get file: /tftpboot/vmlinux 
Aug 14 11:04:28 gorilla dhcpd-2.2.x: BOOTREQUEST from 08:00:09:5f:d5:88 via eth0
Aug 14 11:04:28 gorilla dhcpd-2.2.x: BOOTREPLY for 192.168.14.1 to mirage (08:00:09:5f:d5:88) via eth0
Aug 14 11:04:29 gorilla in.tftpd[547]: connect from mirage
Aug 14 11:04:29 gorilla tftpd[548]: tftpd: trying to get file: /tftpboot/vmlinux 
Aug 14 11:04:29 gorilla in.tftpd[549]: connect from mirage
Aug 14 11:04:29 gorilla tftpd[550]: tftpd: trying to get file: /tftpboot/vmlinux 
Aug 14 11:04:29 gorilla in.tftpd[551]: connect from mirage
Aug 14 11:04:29 gorilla tftpd[552]: tftpd: trying to get file: /tftpboot/vmlinux 
Aug 14 11:04:29 gorilla in.tftpd[553]: connect from mirage
Aug 14 11:04:29 gorilla tftpd[554]: tftpd: trying to get file: /tftpboot/vmlinux 

--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="dhcpd.conf"

# dhcpd.conf
#
subnet 192.168.14.0 netmask 255.255.255.0 {}
 host mirage {
    hardware ethernet 08:00:09:5f:d5:88;
    fixed-address 192.168.14.1;
    option host-name "mirage";
    option domain-name-servers 192.168.14.101;
    option routers 192.14.168.101;
    option root-path "/tftpboot";
    filename "vmlinux-20010629-parisc";
 }

--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=risc-tcpdump

10:59:30.203655 0.0.0.0.bootpc > 255.255.255.255.bootps: xid:0xfcc5d534 [|bootp]
10:59:30.291983 gorilla.bootps > 255.255.255.255.bootpc: xid:0xfcc5d534 Y:mirage S:gorilla [|bootp] [tos 0x10]
10:59:30.550151 mirage.28920 > gorilla.tftp: 516 RRQ "vmlinux-20010629-parisc" [tos 0x10]
10:59:30.737484 gorilla.bootps > mirage.bootpc: xid:0xfcc5d534 Y:mirage S:gorilla [|bootp]
10:59:30.738265 mirage.bootpc > gorilla.bootps: bootp-#0 htype-#5 hlen:0 xid:0x7e7e7e secs:32382 C:126.126.126.126 [|bootp] [tos 0x10]
10:59:30.987459 gorilla.1026 > mirage.28920: udp 19
10:59:30.988251 mirage.28920 > gorilla.1026: udp 5 [tos 0x10]
10:59:30.988370 gorilla > mirage: icmp: gorilla udp port 1026 unreachable [tos 0xd0]
10:59:30.989018 mirage.46975 > gorilla.tftp: 516 RRQ "vmlinux-20010629-parisc" [tos 0x10]
10:59:31.003815 arp who-has mail tell gorilla
10:59:31.017558 gorilla.1027 > mirage.46975: udp 19
10:59:31.018345 mirage.46975 > gorilla.1027: udp 5 [tos 0x10]
10:59:31.018440 gorilla > mirage: icmp: gorilla udp port 1027 unreachable [tos 0xd0]
10:59:31.019117 mirage.4884 > gorilla.tftp: 516 RRQ "vmlinux-20010629-parisc" [tos 0x10]
10:59:31.044535 gorilla.1027 > mirage.4884: udp 19
10:59:31.045323 mirage.4884 > gorilla.1027: udp 5 [tos 0x10]
10:59:31.045420 gorilla > mirage: icmp: gorilla udp port 1027 unreachable [tos 0xd0]
10:59:31.046103 mirage.36632 > gorilla.tftp: 516 RRQ "vmlinux-20010629-parisc" [tos 0x10]
10:59:31.070682 gorilla.1027 > mirage.36632: udp 19
10:59:31.994754 arp who-has mail tell gorilla
10:59:32.994113 arp who-has mail tell gorilla
10:59:35.734110 arp who-has mirage tell gorilla
10:59:36.004477 arp who-has mail tell gorilla
10:59:36.734107 arp who-has mirage tell gorilla
10:59:37.004111 arp who-has mail tell gorilla
10:59:37.734097 arp who-has mirage tell gorilla
10:59:38.004108 arp who-has mail tell gorilla
10:59:38.734116 arp who-has mirage tell gorilla
10:59:39.734107 arp who-has mirage tell gorilla
10:59:40.734125 arp who-has mirage tell gorilla
10:59:41.014470 arp who-has mail tell gorilla
10:59:42.014111 arp who-has mail tell gorilla
10:59:43.014112 arp who-has mail tell gorilla
11:01:17.943250 0.0.0.0.bootpc > 255.255.255.255.bootps: xid:0xfe9a16d2 [|bootp]
11:01:17.943801 gorilla.bootps > mirage.bootpc: xid:0xfe9a16d2 Y:mirage S:gorilla [|bootp]
11:01:17.945226 gorilla.bootps > 255.255.255.255.bootpc: xid:0xfe9a16d2 Y:mirage S:gorilla [|bootp] [tos 0x10]
11:01:18.202014 mirage.61744 > gorilla.tftp: 516 RRQ "/tftpboot/vmlinux" [tos 0x10]
11:01:18.665590 gorilla.1028 > mirage.61744: udp 21
11:01:18.666406 mirage.61744 > gorilla.1028: udp 5 [tos 0x10]
11:01:18.666509 gorilla > mirage: icmp: gorilla udp port 1028 unreachable [tos 0xd0]
11:01:18.667176 mirage.21207 > gorilla.tftp: 516 RRQ "/tftpboot/vmlinux" [tos 0x10]
11:01:18.691709 gorilla.1028 > mirage.21207: udp 21
11:01:18.692501 mirage.21207 > gorilla.1028: udp 5 [tos 0x10]
11:01:18.692600 gorilla > mirage: icmp: gorilla udp port 1028 unreachable [tos 0xd0]
11:01:18.693267 mirage.16473 > gorilla.tftp: 516 RRQ "/tftpboot/vmlinux" [tos 0x10]
11:01:18.717603 gorilla.1028 > mirage.16473: udp 21
11:01:18.718393 mirage.16473 > gorilla.1028: udp 5 [tos 0x10]
11:01:18.718494 gorilla > mirage: icmp: gorilla udp port 1028 unreachable [tos 0xd0]
11:01:18.719163 mirage.3815 > gorilla.tftp: 516 RRQ "/tftpboot/vmlinux" [tos 0x10]
11:01:18.743408 gorilla.1028 > mirage.3815: udp 21
11:01:22.934151 arp who-has mirage tell gorilla
11:01:23.934110 arp who-has mirage tell gorilla
11:01:24.934114 arp who-has mirage tell gorilla
11:01:25.934152 arp who-has mirage tell gorilla
11:01:26.934112 arp who-has mirage tell gorilla
11:01:27.934111 arp who-has mirage tell gorilla
11:02:11.742023 0.0.0.0.bootpc > 255.255.255.255.bootps: xid:0xff2d883a [|bootp]
11:02:11.742534 gorilla.bootps > mirage.bootpc: xid:0xff2d883a Y:mirage S:gorilla [|bootp]
11:02:11.743916 gorilla.bootps > 255.255.255.255.bootpc: xid:0xff2d883a Y:mirage S:gorilla [|bootp] [tos 0x10]
11:02:12.000727 mirage.47698 > gorilla.tftp: 516 RRQ "/tftpboot/vmlinux" [tos 0x10]
11:02:12.272910 gorilla.1028 > mirage.47698: udp 21
11:02:12.273723 mirage.47698 > gorilla.1028: udp 5 [tos 0x10]
11:02:12.274492 mirage.9305 > gorilla.tftp: 516 RRQ "/tftpboot/vmlinux" [tos 0x10]
11:02:12.299014 gorilla.1028 > mirage.9305: udp 21
11:02:12.299803 mirage.9305 > gorilla.1028: udp 5 [tos 0x10]
11:02:12.299903 gorilla > mirage: icmp: gorilla udp port 1028 unreachable [tos 0xd0]
11:02:12.300572 mirage.4209 > gorilla.tftp: 516 RRQ "/tftpboot/vmlinux" [tos 0x10]
11:02:12.324935 gorilla.1028 > mirage.4209: udp 21
11:02:12.325727 mirage.4209 > gorilla.1028: udp 5 [tos 0x10]
11:02:12.325826 gorilla > mirage: icmp: gorilla udp port 1028 unreachable [tos 0xd0]
11:02:12.326495 mirage.59306 > gorilla.tftp: 516 RRQ "/tftpboot/vmlinux" [tos 0x10]
11:02:12.350826 gorilla.1028 > mirage.59306: udp 21
11:02:16.734099 arp who-has mirage tell gorilla
11:02:17.734092 arp who-has mirage tell gorilla
11:02:18.734087 arp who-has mirage tell gorilla
11:02:19.734085 arp who-has mirage tell gorilla
11:02:20.734085 arp who-has mirage tell gorilla
11:02:21.734086 arp who-has mirage tell gorilla
11:04:28.903665 0.0.0.0.bootpc > 255.255.255.255.bootps: xid:0x8d535e1e [|bootp]
11:04:28.904022 gorilla.bootps > mirage.bootpc: xid:0x8d535e1e Y:mirage S:gorilla [|bootp]
11:04:28.905453 gorilla.bootps > 255.255.255.255.bootpc: xid:0x8d535e1e Y:mirage S:gorilla [|bootp] [tos 0x10]
11:04:29.162226 mirage.25361 > gorilla.tftp: 516 RRQ "/tftpboot/vmlinux" [tos 0x10]
11:04:29.187446 gorilla.1028 > mirage.25361: udp 21
11:04:29.188254 mirage.25361 > gorilla.1028: udp 5 [tos 0x10]
11:04:29.188354 gorilla > mirage: icmp: gorilla udp port 1028 unreachable [tos 0xd0]
11:04:29.189029 mirage.13572 > gorilla.tftp: 516 RRQ "/tftpboot/vmlinux" [tos 0x10]
11:04:29.213331 gorilla.1028 > mirage.13572: udp 21
11:04:29.214137 mirage.13572 > gorilla.1028: udp 5 [tos 0x10]
11:04:29.214237 gorilla > mirage: icmp: gorilla udp port 1028 unreachable [tos 0xd0]
11:04:29.214890 mirage.842 > gorilla.tftp: 516 RRQ "/tftpboot/vmlinux" [tos 0x10]
11:04:29.239187 gorilla.1028 > mirage.842: udp 21
11:04:29.239975 mirage.842 > gorilla.1028: udp 5 [tos 0x10]
11:04:29.240069 gorilla > mirage: icmp: gorilla udp port 1028 unreachable [tos 0xd0]
11:04:29.240745 mirage.52098 > gorilla.tftp: 516 RRQ "/tftpboot/vmlinux" [tos 0x10]
11:04:29.265085 gorilla.1028 > mirage.52098: udp 21

--a8Wt8u1KmwUX3Y2C--
