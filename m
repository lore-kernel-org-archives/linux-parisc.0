Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7064A4840
	for <parisc-linux@lists.parisc-linux.org>; Tue, 18 Nov 2003 22:59:38 -0700 (MST)
Date: Tue, 18 Nov 2003 22:59:36 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Steve Bromwich <lists@fop.ns.ca>
Cc: JjDunnjr@aol.com, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Boot-up challenges on a 715/75
Message-ID: <20031119055936.GA17873@colo.lackof.org>
References: <1e2.13b31f0d.2cebe9ab@aol.com> <Pine.LNX.4.58.0311182035020.17277@brain.fop.ns.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.58.0311182035020.17277@brain.fop.ns.ca>
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

On Tue, Nov 18, 2003 at 08:38:00PM -0400, Steve Bromwich wrote:
> I believe HP machines use a 512 byte sector CD drives (with the standard
> being 2048 byte). I'm not sure off-hand if the TEAC supports 512 byte
> sectors. Your best bet may be to borrow a CD off a Sun machine, if you
> have access to one.

I'm only aware of HP using 2k sectors for CD-RO.

I've never heard of 512 byte sectors in a CD Drive.
Is that a feature unique to CD-RW?

Even if that's true, the PARISC firmware expects (or will read) 2k blocks.
I suggest double checking that the CD is burned properly.

> Alternatively, you might have better luck doing a netboot, which I've used
> with success before on a 715/75.

that's a good idea too. "lifimage" files are also available that one
can directly boot from. Follow the "Net Install ISO" link from the
www.parisc-linux.org website.

hth,
grant
