Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6336F482B
	for <parisc-linux@lists.parisc-linux.org>; Fri,  6 Jul 2001 11:09:13 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 4C974B00C; Fri,  6 Jul 2001 18:08:25 +0100 (BST)
Date: Fri, 6 Jul 2001 18:08:25 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: rpengelly <rpengelly@ati.stlawrencec.on.ca>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] opening initial console
Message-ID: <20010706180825.A23509@linuxcare.com>
References: <000d01c10626$ac7139f0$0f809b8e@ati.stlawrencec.on.ca> <20010706153937.Z23509@linuxcare.com> <001901c1062d$a08091c0$0f809b8e@ati.stlawrencec.on.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <001901c1062d$a08091c0$0f809b8e@ati.stlawrencec.on.ca>; from rpengelly@ati.stlawrencec.on.ca on Fri, Jul 06, 2001 at 11:09:17AM -0400
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Jul 06, 2001 at 11:09:17AM -0400, rpengelly wrote:
> I'm confused about booting from a lifimage. How do we go about this. Note:
> we are unbale to install via CDROM because of harware issues so we are
> relying on a network install.

palo can take a kernel image and wrap stuff round it to make a bootable
image.  That is called a lifimage.  You managed to boot from the
network, so you must have booted a lifimage format file.  You must
have put that lifimage somewhere that bootp/rbootd could find it
when asked by your parisc box.  On the CD is a file called lifimage,
in dists/sid/main/disks-hppa/current/lifimage (or similar).  Simply
copy that file to your bootp server, placing it and naming it as
you did for whatever you booted last time.  Then tell your parisc
box to boot from the network.  Don't interact with the IPL to modify
any kernel boot parameters - it should all "just work".

You should get the installer release notes page displayed, hit return
and you are in to the main installer menu.

Once you have the system installed and using palo to boot from disk,
palo uses plain kernel image files, not lifimages.  Those live in
/boot/vmlinuz or similar, and should be set up for you during the
install.

Hope that helps, ask again if not.

Richard
