Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id CAA04227
	for <parisc-linux@puffin.external.hp.com>; Mon, 25 Sep 2000 02:40:19 -0600
Sender: rbrad@mailserv2.iuinc.com
Message-ID: <39CEBB30.74EA4C81@uswest.net>
Date: Sun, 24 Sep 2000 20:40:48 -0600
From: Ryan Bradetich <rbradetich@uswest.net>
MIME-Version: 1.0
To: Erik Paulson <epaulson@upl.cs.wisc.edu>, grundler@cup.hp.com,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] C100 and ccio-dma
References: <20000921201241.C28365@data.upl.cs.wisc.edu> <39CC4001.50E72330@uswest.net>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Erik & Grant,

I isolated the problem, and have checked in an updated ccio-dma driver
that should take care of this problem for you Erik.  The problem was with
the way the ccio-dma handled the scatter/gather lists.

The sym53c8xx driver asked the ccio-dma driver to map 2 maps of
64 - 1024k dma entries.  The ccio-dma driver would map an entire
block (8 pages) for each of the 128 1024k dma entries.  I have checked
in a new ccio-dma driver that handles the scatter/gather lists much
more intelligently.  With these changes I map the entire 128 - 1024k
dma entries into 3 blocks (32 pages).

Erik:  When you get a chance, would you try out the new ccio-dma
driver and see if that fixed your problem.  (I'm betting it will).

Grant: Would you mind reviewing the changes I made to make sure
I didn't do anything stupid :)  I also made several bug fixes that
should/could be ported to the sba driver as well.

There are still some problems with this driver I'm working on tracking
down...  If the pdir is really small (32 MB main memory) ... I get a
HPMC.  But it seems to work when memory is larger (ie 128 MB main
memory).

Thanks and good luck!

- Ryan


Ryan Bradetich wrote:

> Erik & Grant,
>
> I think I have finally tracked this problem down... I don't think it is a bug
> in either the ccio-dma or the sym53c8xx driver.... I believe it is a sizing
> issue with the IO PDIR in the ccio-dma.  I spent some time last week
> increasing the density of the IO PDIR by 4x ... it looks like I still have some
> work to do :)
>
> I increased the the IO PDIR ratio to main memory by 4x and I can
> successfully format a 4G partition in my C200+.  (When I bumped
> the IO PDIR ratio by 2x, is still had problems...)
>
> Erik ... I've attached a small patch for you to try and see if it works for
> you.
>
> Thanks,
>
> - Ryan
