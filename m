Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA05062
	for <parisc-linux@puffin.external.hp.com>; Tue, 8 Feb 2000 19:04:02 -0700
Date: Tue, 8 Feb 2000 19:59:52 -0500 (EST)
From: Michael Ang <mang@subcarrier.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc: parisc-linux@thepuffingroup.com
In-Reply-To: <20000209014127.C2377@alpha.franken.de>
Message-ID: <Pine.BSF.4.10.10002081956030.11091-100000@cuzea.pair.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Merge status
List-ID: <linux-parisc.vger.kernel.org>

Merging has been painful, as is often the case.  Thanks to everyone for
helping out and being patient.

We still need to manually merge drivers/block/rd.c and fix some problems
with unresolved symbols.  Hopefully we can finish up merging tommorrow.

	- Mike.

On Wed, 9 Feb 2000, Thomas Bogendoerfer wrote:
> > `drivers/block/rd.c'
> 
> so far that's the only one in my tree, which is left. To get a kernel
> compiled, I've just used the 2.3.42 version of that file (haven't commited
> it yet). I can't say whether it works, because I'm now at the point, where 
> I get unresolved symbols:
> 
> ld: Unsatisfied symbols:
>    init_ext2_fs (code)
>    up_read (code)
>    uts_sem (data)
>    get_task_struct (code)
>    up_write (code)
>    pcibios_enable_device (code)
>    down_write (code)
>    down_read (code)
