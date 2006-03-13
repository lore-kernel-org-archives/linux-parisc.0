From: Miklos Szeredi <miklos@szeredi.hu>
Subject: [parisc-linux] Re: [fuse-devel] Example filesystem fail to init on
	parisc
Date: Mon, 13 Mar 2006 12:26:34 +0100
Message-ID: <E1FIlC6-0005ts-00__18940.203873399$1416624585$gmane$org@dorka.pomaz.szeredi.hu>
References: <20060308071445.GA28275@pooh.bubble.frostnet.net>
	<E1FGwXn-0005Dh-00@dorka.pomaz.szeredi.hu>
	<20060309055002.GJ26474@pooh.bubble.frostnet.net>
	<E1FHKQR-0007JU-00@dorka.pomaz.szeredi.hu>
	<20060309223622.GP26474@pooh.bubble.frostnet.net>
	<E1FHfby-00052b-00@dorka.pomaz.szeredi.hu>
	<20060310230000.GX26474@pooh.bubble.frostnet.net>
Cc: fuse-devel@lists.sourceforge.net,
 parisc-linux@parisc-linux.org
To: chris@frostnet.net
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-reply-to: <20060310230000.GX26474@pooh.bubble.frostnet.net> (message from
	Chris Frost on Fri, 10 Mar 2006 15:00:00 -0800)
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> On Fri, Mar 10, 2006 at 12:16:46PM +0100, Miklos Szeredi wrote:
> > Can you try the following patch to the library?
> > 
> > It initializes the memory to some random value (0x28) before the
> > read(), to check if the kernel sets the memory to zero or it doesn't
> > touch the buffer at all.
> 
> Interesting, the kernel is not setting the memory.

OK.  I'm out of ideas, CC-ing parisc-linux, maybe they can help shed
some light on this.

A short summary of the problem:

(for the full thread see:
http://thread.gmane.org/gmane.comp.file-systems.fuse.devel/2833)

FUSE doesn't seem to work on PA-RISC (2.6.15 + pa4 patchset)

The reason appears to be that when the userspace filesystem reads from
the FUSE device, the kernel doesn't copy any data to the userspace
read buffer, though the correct size is returned by read().

FUSE uses a combination of get_user_pages(), kmap_atomic() and
memcpy().  After kunmap_atomic(), flush_dcache_page() is called to
avoid virtual aliasing.  The data in the read buffer is totally
untouched.

Can anyone confirm the above behavior of FUSE on PA-RISC?

Any ideas why this would behave differently on PA-RISC as on other
archs?

Thanks,
Miklos
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
