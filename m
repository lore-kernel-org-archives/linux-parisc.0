Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cuprel1.hp.com (cuprel1.hp.com [156.153.254.40])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0C330482D
	for <parisc-linux@parisc-linux.org>; Thu, 18 Jul 2002 08:57:11 -0600 (MDT)
Received: from webmail.tiscalinet.be (webmail2.tiscali.be [212.35.2.201])
	by cuprel1.hp.com (Postfix) with ESMTP id 382031671
	for <parisc-linux@parisc-linux.org>; Thu, 18 Jul 2002 06:59:10 -0700 (PDT)
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [parisc-linux] Merge -rc1 -rc2 (was 2.4.19-rc1-ac6 Merge pa55: #error ...?)
Message-ID: <1027000702.3d36c97e55996@webmail.tiscalinet.be>
Date: Thu, 18 Jul 2002 15:58:22 +0200 (CEST)
From: joel.soete@freebel.net
Cc: joel.soete@freebel.net, Randolph Chung <randolph@tausq.org>,
	HPPA List <parisc-linux@parisc-linux.org>
References: <1026832288.1687.57.camel@irongate.swansea.linux.org.uk> <1026913104.3d357350a4057@webmail.tiscalinet.be> <20020717144543.A13352@parcelfarce.linux.theplanet.co.uk> <1026914852.3d357a24c4a4a@webmail.tiscalinet.be> <20020717142915.GG641@tausq.org> <1026922060.5709.148.camel@irongate.swansea.linux.org.uk>  <20020717150349.GN8724@tausq.org> <1026925311.5709.153.camel@irongate.swansea.linux.org.uk>  <1026927440.3d35ab5042756@webmail.tiscalinet.be> <1026936549.1688.157.camel@irongate.swansea.linux.org.uk>
In-Reply-To: <1026936549.1688.157.camel@irongate.swansea.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
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

Quoting Alan Cox <alan@lxorguk.ukuu.org.uk>:

> On Wed, 2002-07-17 at 18:37, joel.soete@freebel.net wrote:
> > Hi,
> > 
> > I merge my 19-rc1 stuff with 19-rc2 and just enounter a conflict in
> > include/linux/personality.h:
> > 
> > enum{
> > ...
> > +        PER_OSF4= 0x000f,
> > 
> > unfortunaltely the same as our:
> >          PER_HPUX= 0x000f,
> > 
> > What should I do?
> 
> I've asked Marcelo to use 0x0010 for OSF4 (its just added and not an
> established constant)
> 

And all my stuf compiles and run well at least on my b2k and 712.
Compile with gcc-3.0.4 and for gcc-3.2 I do have to apply following small patch:

--- aic7xxx_osm.c.orig	Thu Jul 18 15:22:10 2002
+++ aic7xxx_osm.c	Thu Jul 18 14:08:02 2002
@@ -417,25 +417,25 @@
 MODULE_LICENSE("Dual BSD/GPL");
 #endif
 MODULE_PARM(aic7xxx, "s");
-MODULE_PARM_DESC(aic7xxx, "period delimited, options string.
-
verbose
		Enable verbose/diagnostic logging
-
no_probe
	Disable EISA/VLB controller probing
-
no_reset
	Supress initial bus resets
-
extended
	Enable extended geometry on all controllers
-
periodic_otag
	Send an ordered tagged transaction periodically
-
			to prevent tag starvation.  This may be
-
			required by some older disk drives/RAID arrays. 
-
reverse_scan
	Sort PCI devices highest Bus/Slot to lowest
-
tag_info:<tag_str>
Set per-target tag depth
-
seltime:<int>
	Selection Timeout(0/256ms,1/128ms,2/64ms,3/32ms)
-
-
Sample /etc/modules.conf line:
-
	Enable verbose logging
-
	Disable EISA/VLB probing
-
	Set tag depth on Controller 2/Target 2 to 10 tags
-
	Shorten the selection timeout to 128ms from its default of 256
-
-
options aic7xxx='\"verbose.no_probe.tag_info:{{}.{}.{..10}}.seltime:1\"'
+MODULE_PARM_DESC(aic7xxx, "period delimited, options string.\n\
+
verbose
		Enable verbose/diagnostic logging\n\
+
no_probe
	Disable EISA/VLB controller probing\n\
+
no_reset
	Supress initial bus resets\n\
+
extended
	Enable extended geometry on all controllers\n\
+
periodic_otag
	Send an ordered tagged transaction periodically\n\
+
			to prevent tag starvation.  This may be\n\
+
			required by some older disk drives/RAID arrays. \n\
+
reverse_scan
	Sort PCI devices highest Bus/Slot to lowest\n\
+
tag_info:<tag_str>
Set per-target tag depth\n\
+
seltime:<int>
	Selection Timeout(0/256ms,1/128ms,2/64ms,3/32ms)\n\
+\n\
+
Sample /etc/modules.conf line:\n\
+
	Enable verbose logging\n\
+
	Disable EISA/VLB probing\n\
+
	Set tag depth on Controller 2/Target 2 to 10 tags\n\
+
	Shorten the selection timeout to 128ms from its default of 256\n\
+\n\
+
options aic7xxx='\"verbose.no_probe.tag_info:{{}.{}.{..10}}.seltime:1\"'\n\
 ");
 #endif
 
Many thanks again,
    Joel


-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
