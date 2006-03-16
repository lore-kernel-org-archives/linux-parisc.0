From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Re: [fuse-devel] Example filesystem fail to init
	on parisc
Date: Thu, 16 Mar 2006 09:13:36 -0700
Message-ID: <20060316161336.GA16771__31336.3045956523$1416624586$gmane$org@colo.lackof.org>
References: <20060308071445.GA28275@pooh.bubble.frostnet.net>
	<E1FGwXn-0005Dh-00@dorka.pomaz.szeredi.hu>
	<20060309055002.GJ26474@pooh.bubble.frostnet.net>
	<E1FHKQR-0007JU-00@dorka.pomaz.szeredi.hu>
	<20060309223622.GP26474@pooh.bubble.frostnet.net>
	<E1FHfby-00052b-00@dorka.pomaz.szeredi.hu>
	<20060310230000.GX26474@pooh.bubble.frostnet.net>
	<E1FIlC6-0005ts-00@dorka.pomaz.szeredi.hu>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: fuse-devel@lists.sourceforge.net,
 chris@frostnet.net,
 parisc-linux@parisc-linux.org
To: Miklos Szeredi <miklos@szeredi.hu>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <E1FIlC6-0005ts-00@dorka.pomaz.szeredi.hu>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Mar 13, 2006 at 12:26:34PM +0100, Miklos Szeredi wrote:
> OK.  I'm out of ideas, CC-ing parisc-linux, maybe they can help shed
> some light on this.

Miklos,
I took a quick look last week but didn't see anything obvious.
I was suspicious of the memcopy() calls to copy stuff to
user space. But willy me told those are fine if using the
result of kmap() (and then kunmap'ing when done).

In a private conversation someone else said they would
look at it on the weekend.

thanks,
grant

> 
> A short summary of the problem:
> 
> (for the full thread see:
> http://thread.gmane.org/gmane.comp.file-systems.fuse.devel/2833)
> 
> FUSE doesn't seem to work on PA-RISC (2.6.15 + pa4 patchset)
> 
> The reason appears to be that when the userspace filesystem reads from
> the FUSE device, the kernel doesn't copy any data to the userspace
> read buffer, though the correct size is returned by read().
> 
> FUSE uses a combination of get_user_pages(), kmap_atomic() and
> memcpy().  After kunmap_atomic(), flush_dcache_page() is called to
> avoid virtual aliasing.  The data in the read buffer is totally
> untouched.
> 
> Can anyone confirm the above behavior of FUSE on PA-RISC?
> 
> Any ideas why this would behave differently on PA-RISC as on other
> archs?
> 
> Thanks,
> Miklos
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
