Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id CCFC2482B
	for <parisc-linux@lists.parisc-linux.org>; Fri, 26 Oct 2001 12:41:44 -0600 (MDT)
Message-Id: <200110261838.MAA13212@puffin.external.hp.com>
To: Daniel Williams <dan@bigw.org>
Cc: parisc-linux@lists.parisc-linux.org,
	grundler@puffin.external.hp.com
Subject: Re: [parisc-linux] How to Boot CD on C110 
In-Reply-To: Message from Daniel Williams <dan@bigw.org>
   of "Fri, 26 Oct 2001 00:32:56 CDT." <E8D73E09-C9D2-11D5-8938-0030657D1C94@bigw.org>
Date: Fri, 26 Oct 2001 12:38:01 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
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

Daniel Williams wrote:
> OK, so SEArch should see the CD drive regardless.  Should it also see 
> the FWSCSI internal HDs?

Yes.

>  They don't have anything on them...  But the 
> Firmware doesn't show anything after its done searching, not the 2 HDs, 
> the CD, or the DDS tape drive.

hmm...PDC is pretty brain dead. Were those SCSI devices shipped with the
C110 or installed later?

> Whats that about CD option jumpers set wrong?
> What should the correct configuration be?  The pins that it has 
> on the back (its a HP branded toshiba XM-5401B 50pin narrow) are ID1, 
> ID2, ID4, PRTY, PRV/ALW, TEST, and TERM.  ID2 and PRTY have jumpers 
> connected, the rest are not shorted.

I don't know what they should be - I don't have the product manual.
ID2/PRTY sound like they are correct. I don't konw what PRV/ALW means.
(Prevent/Allow what?). TERM should probably be left disconnected.

BTW, just because the drive is from HP doesn't mean it's setup
to work w/ an HP workstation. Firmware on the drive could do things
that confuse PDC/IODC.

> nor does SEA see it.

You need to figure this output first...try a different drive perhaps.
The FWD drives not being seen concerns me just as much.

grant
