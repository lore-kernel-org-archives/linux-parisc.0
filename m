Return-Path: <hppa-linux@puffingroup.com>
To: hppa-linux@puffingroup.com
Subject: Re: [hppa-linux] Cross compile setup
References: <199902070426.WAA03584@tomahawk.rsn.hp.com>
From: pcj@primenet.com (Paul C. Janzen)
Date: 07 Feb 1999 00:16:00 -0800
In-Reply-To: Bjorn Helgaas's message of "Sat, 06 Feb 1999 22:26:11 -0600"
Message-ID: <oq1zk2bpdr.fsf@merlin.pcj.primenet.com>
Resent-Message-ID: <"XxQ8p3.0.uA.4OMls"@burrow.puffingroup.com>
Reply-To: hppa-linux@puffingroup.com
List-Id: linux-parisc.vger.kernel.org


Bjorn Helgaas <helgaas@rsn.hp.com> writes:

> I don't know how much of the boot process you want to replace, but if
> you're willing to use the HP-UX ISL and HPUX, at least to get started,
> you can fairly easily get things set up to boot your kernel over the net.
> 710's and 715's use a proprietary protocol called RMP (see rbootd(1m)),
> while 712's and newer boxes use BOOTP (see bootpd(1m)).

RMP may be proprietary, but it's hardly a secret.  It's essentially
the same boot protocol that the HP 300's used, which was apparently
reverse-engineered by the NetBSD camp and subsequently ported to Linux
for the HP300 port.  It's also used on some 735's (it apparently
depends more on PDC revision than model number).

These patches to the rbootd at 
    http://www.tazenda.demon.co.uk/phil/linux-hp/files/rbootd-linux.tar.gz
allowed me to boot the HPUX kernel from the network on an 735/99 using
Linux/x86 as the server (well at least to the point where it looked
for a root filesystem).

diff -ur rbootd_orig/pcap.c rbootd/pcap.c
--- rbootd_orig/pcap.c	Sat Nov  9 12:54:45 1996
+++ rbootd/pcap.c	Mon Nov  2 20:38:22 1998
@@ -29,8 +29,11 @@
 #include "defs.h"
 
 #include <sys/socket.h>
-#include <linux/if.h>
-#include <linux/if_ether.h>
+#include <ioctls.h>
+#include <net/if.h>
+#define ETH_ALEN        6               /* Octets in one ethernet addr   */
+#define ETH_P_ALL       0x0003          /* Every packet (be careful!!!) */
+
 
 static pcap_t *pdesc = NULL;  /* packet capture descriptor */
 static char errbuf[PCAP_ERRBUF_SIZE]; /* buffer we use to get error msgs */
@@ -131,7 +134,7 @@
    caplen = h->caplen; /* max. captured bytes */
 
    /* First we ensure we got a complete packet of the right size! */
-   if (caplen <= datlen)
+   if (caplen < datlen)
       syslog(LOG_ERR, "bpf: truncated packet dropped (%d of %d bytes)",
              caplen, datlen);
    else if (datlen > sizeof(struct rmp_packet))
diff -ur rbootd_orig/rmpproto.c rbootd/rmpproto.c
--- rbootd_orig/rmpproto.c	Sat Nov  9 12:15:55 1996
+++ rbootd/rmpproto.c	Mon Nov  2 21:30:23 1998
@@ -353,6 +353,12 @@
 		if (STREQN(filename, filelist[i]))
 			goto match;
 
+	if (strlen(filename)==0) 
+	  { 
+	    strcpy(filename, filelist[0]); 
+	    goto match;
+	  }
+	
 	/*
 	 *  Invalid boot file name, set error and send reply packet.
 	 */

--
Paul C. Janzen
pcj@primenet.com

----------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@puffingroup.com with
`unsubscribe' as the subject.
