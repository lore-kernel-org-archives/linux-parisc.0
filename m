Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id PAA02567
	for <parisc-linux@puffin.external.hp.com>; Wed, 15 Sep 1999 15:54:18 -0600
Date: Wed, 15 Sep 1999 23:56:23 +0200
From: Philipp Rumpf <prumpf@suse.de>
To: Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 715/100 bootpd fails
Message-ID: <19990915235623.D8112@suse.de>
References: <199909151508.IAA19696@milano.cup.hp.com> <199909152122.OAA20249@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199909152122.OAA20249@milano.cup.hp.com>; from Grant Grundler on Wed, Sep 15, 1999 at 02:21:50PM -0700
List-ID: <linux-parisc.vger.kernel.org>

> Building "Image" but can't boot it via bootpd.
> Here's what I've worked through so far...ideas?
> 
> My 715/100 (firmware 1.6, 64MB RAM, no disk) complains
> 	"ERROR: Cannot load IPL, error detected"

> from either a 11.00 or 10.20 bootpd host.
> "sea lan" at the target "BCH" (aka BOOT_ADMIN) shows both hosts.	
> I think bootpd is configured "close enough" and the target
> box is finding both bootpd servers and "Image" on each. I did
> have a problem with public read permission on one host but
> fixed that.

My guess is your bootpd / tftpd does not work properly.  Just as it might
help, here is my configuration:

/etc/bootptab:
puffin:ha=0010830329ee:ip=10.10.0.95:sm=255.255.0.0:bf=/tftpboot/kernel-puffin:td=/tftpboot/
herring:ha=08000987F208:ip=10.10.0.96:sm=255.255.0.0:bf=/tftpboot/kernel-herring:td=/tftpboot/

tftpd is started from inetd, inetd.conf line is:
tftp    dgram   udp     wait    nobody  /usr/sbin/tcpd  in.tftpd /tftpboot

$ tftp localhost
tftp> get kernel-puffin
Received 1039957 bytes in 1.2 seconds
tftp> get kernel-herring
Received 1039957 bytes in 1.1 seconds
tftp> 

# bootpd -d9
bootpd: info(6):   bootptab mtime: Thu Jul  8 16:27:42 1999
bootpd: info(6):   reading "/etc/bootptab"
bootpd: info(6):   read 2 entries (2 hosts) from "/etc/bootptab"
bootpd: info(6):   recvd pkt from IP addr 0.0.0.0
bootpd: info(6):   bootptab mtime: Thu Jul  8 16:27:42 1999
bootpd: info(6):   request from Ethernet address 00:10:83:03:29:EE
bootpd: info(6):   found 10.10.0.95 (puffin)
bootpd: info(6):   bootfile="/tftpboot/kernel-puffin"
bootpd: info(6):   vendor magic field is 99.130.83.99
bootpd: info(6):   sending reply (with RFC1048 options)
bootpd: info(6):   setarp 10.10.0.95 - 00:10:83:03:29:EE

I have no idea how to translate all that to HP/UX.

> grundler <421>tail /etc/bootptab
> lego02b:\
>         hd=/linux/linux/arch/parisc/boot:\
>         bf=Image:\

appropriate permissions on this ? is tftpd started with / as root (not
/tftpboot as usual) ?

	Philipp Rumpf
