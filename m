Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from brain.fop.ns.ca (u135n18.eastlink.ca [24.224.135.18])
	by dsl2.external.hp.com (Postfix) with ESMTP id AE9644840
	for <parisc-linux@lists.parisc-linux.org>; Wed, 19 Nov 2003 06:32:29 -0700 (MST)
Date: Wed, 19 Nov 2003 09:32:29 -0400 (AST)
From: Steve Bromwich <lists@fop.ns.ca>
To: Grant Grundler <grundler@parisc-linux.org>
Cc: JjDunnjr@aol.com, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Boot-up challenges on a 715/75
In-Reply-To: <20031119055936.GA17873@colo.lackof.org>
Message-ID: <Pine.LNX.4.58.0311190922370.1125@brain.fop.ns.ca>
References: <1e2.13b31f0d.2cebe9ab@aol.com> <Pine.LNX.4.58.0311182035020.17277@brain.fop.ns.ca>
 <20031119055936.GA17873@colo.lackof.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Tue, 18 Nov 2003, Grant Grundler wrote:

> On Tue, Nov 18, 2003 at 08:38:00PM -0400, Steve Bromwich wrote:
> > I believe HP machines use a 512 byte sector CD drives (with the standard
> > being 2048 byte). I'm not sure off-hand if the TEAC supports 512 byte
> > sectors. Your best bet may be to borrow a CD off a Sun machine, if you
> > have access to one.
>
> I'm only aware of HP using 2k sectors for CD-RO.

Well, this is just from my own personal experience on a 715/75 (which has
now sadly bitten the dust). A google around would tend to support this
theory, for example:

http://lists.parisc-linux.org/pipermail/parisc-linux/2000-September/009345.html
"Last posting to the list was about my SCSI CD-ROM not booting the
HP-UX INSTALL CD.  Well, it turns out that NECs are in 2048 byte sector
mode whereas HP requires 512 byte mode.  SUNs and SGIs also require 512
byte sector mode.  So I just borrowed a SUN external CD-ROM..."

> I've never heard of 512 byte sectors in a CD Drive.
> Is that a feature unique to CD-RW?

It's the standard for Sun boxes (at least, on all my Sparcstations). This
of course means I don't have any SCSI 2048 byte CD drives to verify my
statement! If anyone else would like to verify it I'd be interested, and I
suppose it might not be a bad idea to add it to the FAQ if true as I'm
sure it'll bite someone else down the road.

> Even if that's true, the PARISC firmware expects (or will read) 2k blocks.
> I suggest double checking that the CD is burned properly.

It reads 2K blocks (at least, as written by my burner in 2048 byte mode)
but reads 512 bytes at a time, as I understand it.

Cheers, Steve
