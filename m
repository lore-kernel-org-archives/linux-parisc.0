From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] fix typo in arch/parisc/hpux/fs.c
Date: Tue, 2 Sep 2008 03:43:27 +1000
Message-ID: <20080902034327.2c66cda5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: LKML <linux-kernel@vger.kernel.org>,
	Kyle McMartin <kyle@mcmartin.ca>,
	<linux-parisc@vger.kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>,
	Linus <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

A parisc allmodconfig build produces this:

arch/parisc/hpux/fs.c:107: error: 'buffer' undeclared (first use in this function)

Introduced by commit da574983de9f9283ba35662c8723627096e160de ("[PATCH]
fix hpux_getdents()").

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

diff --git a/arch/parisc/hpux/fs.c b/arch/parisc/hpux/fs.c
index 69ff671..12c04c5 100644
--- a/arch/parisc/hpux/fs.c
+++ b/arch/parisc/hpux/fs.c
@@ -104,7 +104,7 @@ static int filldir(void * __buf, const char * name, int namlen, loff_t offset,
 	buf->count -= reclen;
 	return 0;
 Efault:
-	buffer->error = -EFAULT;
+	buf->error = -EFAULT;
 	return -EFAULT;
 }
 

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
