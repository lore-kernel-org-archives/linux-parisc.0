Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hptux.heylan (pD955D0F8.dip.t-dialin.net [217.85.208.248])
	by dsl2.external.hp.com (Postfix) with ESMTP id 03ECD4829
	for <parisc-linux@lists.parisc-linux.org>; Sat, 17 Aug 2002 16:37:27 -0600 (MDT)
Date: Sun, 18 Aug 2002 00:37:15 +0200
From: Andreas Seltenreich <s_selten@informatik.uni-karlsruhe.de>
To: "B. Douglas Hilton" <bdhilton@charter.net>
Cc: parisc-linux@lists.parisc-linux.org, saw@saw.sw.com.sg
Subject: Re: [parisc-linux] PCI Intel EtherExpressPro100 strangeness on C200 machine.
Message-ID: <20020817223713.GA25852@gate450.dyndns.org>
References: <3D5EB2D6.9090403@charter.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="AqsLC8rIMeq19msA"
In-Reply-To: <3D5EB2D6.9090403@charter.net>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

--AqsLC8rIMeq19msA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

just append " || defined(__hppa__)" to line 47 of drivers/net/eepro100.c
I got mine working that way.

Regards,
andreas

* B. Douglas Hilton <bdhilton@charter.net> [2002-08-17 22:32]:
> Hello list. For some reason my onboard LAN devices
> all mysteriously died and disappeared from the
> firmware, so I purchased an eepro100 card to try
> and get some networking connectivity back.
> 
> When I modprobe eepro100 it seems to be ok. I can
> do an 'ifup -a' and then ifconfig lists my eth0
> and it appears to be configured properly. I can
> ping other servers in my LAN, and I can do an
> ftp login, but as soon a I type "ls" it goes out
> to lunch and locks up.
> 
> Likewise I can ping numeric ip's on the internet,
> but name resolution is not working.
> 
> Could this be an endianness problem? Any ideas?
> 
> Any tips on how to reactivate the onboard ether
> devices would be greatly appreciated too.

--AqsLC8rIMeq19msA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=diff

--- linux/drivers/net/eepro100.c	Mon Aug  5 02:12:20 2002
+++ linux/drivers/net/eepro100.c	Sun Aug 18 00:15:55 2002
@@ -44,7 +44,7 @@
 /* Set the copy breakpoint for the copy-only-tiny-buffer Rx method.
    Lower values use more memory, but are faster. */
 #if defined(__alpha__) || defined(__sparc__) || defined(__mips__) || \
-    defined(__arm__)
+    defined(__arm__) || defined(__hppa__)
 static int rx_copybreak = 1518;
 #else
 static int rx_copybreak = 200;

--AqsLC8rIMeq19msA--
