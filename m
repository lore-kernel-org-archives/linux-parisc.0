From: Helge Deller <deller@gmx.de>
Subject: Re: parisc crash on boot with 4.8+git
Date: Tue, 11 Oct 2016 20:40:02 +0200
Message-ID: <20161011184002.GA1363@p100.box>
References: <alpine.LRH.2.20.1610090042580.12761@math.ut.ee>
 <57F96010.1040309@gmx.de>
 <alpine.LRH.2.20.1610091032210.12761@math.ut.ee>
 <57FA089F.1020301@gmx.de>
 <alpine.LRH.2.20.1610092356270.32571@math.ut.ee>
 <57FAA079.5010502@gmx.de>
 <alpine.LRH.2.20.1610100857110.32571@math.ut.ee>
 <57FBA9F1.6000009@gmx.de>
 <alpine.LRH.2.20.1610101925320.14896@math.ut.ee>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Linux Kernel list <linux-kernel@vger.kernel.org>
To: Meelis Roos <mroos@linux.ee>, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.LRH.2.20.1610101925320.14896@math.ut.ee>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

* Meelis Roos <mroos@linux.ee>:
> > > Memory Ranges:
> > >  0) Start 0x0000000000000000 End 0x000000003fffffff Size   1024 MB
> > >  1) Start 0x0000004040000000 End 0x000000407fdfffff Size   1022 MB
> > > Total Memory: 2046 MB

Meelis and myself debugged the crash off-list.
It turns out, that I missed to zero-initialize the new memblocks.
Patch below fixes this.

Helge

------------
parisc: Zero-initialize newly alloced memblock

Commit 4fe9e1d957e4 ("parisc: Drop bootmem and switch to memblock")
switched to the memblock allocator, but missed to zero-initialize the
newly allocated memblocks. This lead to crashes on some machines like
the rp3410.

Fixes: 4fe9e1d957e4 ("parisc: Drop bootmem and switch to memblock")
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
index 356f384..62ac801 100644
--- a/arch/parisc/mm/init.c
+++ b/arch/parisc/mm/init.c
@@ -105,6 +105,8 @@ static void * __init get_memblock(unsigned long size)
 	else
 		panic("get_memblock() failed.\n");
 
+	memset(__va(phys), 0, size);
+
 	return __va(phys);
 }
 
