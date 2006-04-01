From: Miklos Szeredi <miklos@szeredi.hu>
Subject: [parisc-linux] Re: [fuse-devel] [PATCH] Fixs to work on ARM and
	PARIC platforms.
Date: Sat, 01 Apr 2006 18:35:38 +0200
Message-ID: <E1FPj4c-0001ay-00__35941.4216284224$1416624038$gmane$org@dorka.pomaz.szeredi.hu>
References: <e739902b0604010122tefc6ab5radf8121eea8a3015@mail.gmail.com>
Cc: fuse-devel@lists.sourceforge.net,
 parisc-linux@lists.parisc-linux.org
To: rbradetich@gmail.com
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-reply-to: <e739902b0604010122tefc6ab5radf8121eea8a3015@mail.gmail.com>
	(rbradetich@gmail.com)
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> 1.  The rwlock tree_lock  in struct fuse was not properly initialized using
> pthread_rwlock_init().    This normally works on other archs (besides
> PARISC) since the lock can be initialized to 0 values, this is not true on
> the PARISC platform ... these locks must be initialized properly to work on
> PARISC.

Good find, thanks.

The initialization should actually look like this:

  pthread_rwlock_init(&f->tree_lock, NULL);

I can't imagine how your version managed to work...

> 2. I had to add an additional cache flush in the fuse_copy_do function.  On
> both ARM and PARISC, the data was corrupted unless cache is flushed first.
> Unfortunately I hit it with a very big hammer (flush_cache_all) ... I am
> hoping someone more familiar with the caches will suggest a better flush
> function to use.  I tried to use the flush_kernel_dcache_page and
> flush_dcache_page functions without any luck :(

You should try using the parisc patchset from:

   http://cvs.parisc-linux.org/download/linux-2.6/

and replace flush_dcache_page() with flush_kernel_dcache_page() in
FUSE source.

Thanks,
Miklos
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
