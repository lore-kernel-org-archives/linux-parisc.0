Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from tyke.pjc.net (public1-leed3-6-cust141.leed.broadband.ntl.com [80.0.5.141])
	by dsl2.external.hp.com (Postfix) with ESMTP id A5AF1483F
	for <parisc-linux@lists.parisc-linux.org>; Fri,  7 Jun 2002 12:24:34 -0600 (MDT)
Received: from patrick by tyke.pjc.net with local (Exim 3.35 #1 (Debian))
	id 17GOPZ-0001sw-00
	for <parisc-linux@lists.parisc-linux.org>; Fri, 07 Jun 2002 19:24:33 +0100
Date: Fri, 7 Jun 2002 19:24:33 +0100
From: Patrick Caulfield <patrick@tykepenguin.com>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Probleme while compiling last CVS kernel.
Message-ID: <20020607182433.GA7230@tykepenguin.com>
References: <1023463889.3d00d1d18be3e@webmail.tiscalinet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
In-Reply-To: <1023463889.3d00d1d18be3e@webmail.tiscalinet.be>
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

On Fri, Jun 07, 2002 at 05:31:29PM +0200, joel.soete@freebel.net wrote:
> Hi all,
> 
> Here is attached the patch to uptdate lvm structures in ioctl32.c
> (arch/parisc/kernel).
> 
> Can somebody check in for me.
> 
> I check it (Ok) for 32bit kernel on my b180l.
> 
> Patrick,
> 
> Don't you see anything else to verify?
> 

Looks good to me. I patched it in and then diffed it against the sparc64 one and
there were no LVM differences.

patrick
