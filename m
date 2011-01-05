From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: NFS broken in latest 2.6.37-rcX
Date: Wed, 05 Jan 2011 12:47:26 -0600
Message-ID: <1294253246.16957.7.camel@mulgrave.site>
References: <20101222223410.3a5f44c3@zombie>
	 <AANLkTinp3LaW_h91E+44=_-anambaJwja3BFCfG60fUz@mail.gmail.com>
	 <1294248961.15356.30.camel@mulgrave.site>
	 <20110105193105.0e3b0fec@borg.bxl.tuxicoman.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: Carlos O'Donell <carlos@systemhalted.org>,
	linux-parisc@vger.kernel.org
To: Guy Martin <gmsoft@tuxicoman.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110105193105.0e3b0fec@borg.bxl.tuxicoman.be>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, 2011-01-05 at 19:31 +0100, Guy Martin wrote:
> James,
> 
> Thanks for pointing me to the thread.
> 
> I reached similar conclusion as well. After adding lots of printk, I
> could see that the page where the skb buff is copied is not or
> partially updated when being read by xdr_page_filler.

So does this fix it?

James

---

diff --git a/fs/nfs/dir.c b/fs/nfs/dir.c
index 996dd89..37d7347 100644
--- a/fs/nfs/dir.c
+++ b/fs/nfs/dir.c
@@ -1783,6 +1783,7 @@ static int nfs_symlink(struct inode *dir, struct dentry *dentry, const char *sym
 	memcpy(kaddr, symname, pathlen);
 	if (pathlen < PAGE_SIZE)
 		memset(kaddr + pathlen, 0, PAGE_SIZE - pathlen);
+	flush_kernel_dcache_page(page);
 	kunmap_atomic(kaddr, KM_USER0);
 
 	error = NFS_PROTO(dir)->symlink(dir, dentry, page, pathlen, &attr);
diff --git a/fs/nfs/nfs4proc.c b/fs/nfs/nfs4proc.c
index 4435e5e..9a6bfea 100644
--- a/fs/nfs/nfs4proc.c
+++ b/fs/nfs/nfs4proc.c
@@ -205,6 +205,7 @@ static void nfs4_setup_readdir(u64 cookie, __be32 *verifier, struct dentry *dent
 
 	readdir->pgbase = (char *)p - (char *)start;
 	readdir->count -= readdir->pgbase;
+	flush_kernel_dcache_page(*readdir->pages);
 	kunmap_atomic(start, KM_USER0);
 }
 


