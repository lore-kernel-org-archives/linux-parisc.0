Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 742FD4844
	for <parisc-linux@parisc-linux.org>; Mon, 15 Jul 2002 11:43:26 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17U9sW-0005G5-00; Mon, 15 Jul 2002 18:43:20 +0100
Date: Mon, 15 Jul 2002 18:43:20 +0100
From: Matthew Wilcox <willy@debian.org>
To: Randolph Chung <randolph@tausq.org>
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	joel.soete@freebel.net, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] compiling kernels with gcc-3.1
Message-ID: <20020715184320.R27706@parcelfarce.linux.theplanet.co.uk>
References: <200207151721.g6FHL72e024968@hiauly1.hia.nrc.ca> <20020715173233.GK8724@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020715173233.GK8724@tausq.org>; from randolph@tausq.org on Mon, Jul 15, 2002 at 10:32:33AM -0700
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

On Mon, Jul 15, 2002 at 10:32:33AM -0700, Randolph Chung wrote:
> In reference to a message from John David Anglin, dated Jul 15:
> > > Is --disable-indexing used in kernel builds?  This should stop gcc
> > > from generating the above.
> > 
> > Oops, that should be "-mdisable-indexing".
> 
> right now we use:
> -Wall -Wstrict-prototypes -Wno-trigraphs -O2 -fomit-frame-pointer
> -fno-strict-aliasing -fno-common -D__linux__ -pipe -fno-strength-reduce
> -mno-space-regs -mfast-indirect-calls -mdisable-fpregs
> -ffunction-sections -march=2.0 -mschedule=8000
> 
> (the last two are only for pa8x00 builds...)
> 
> i'll try the disable-indexing stuff...

while we're on the subject of gcc flags ...

right now, we have an interesting patch in the kernel to get around a
fun feature of the PA ABI that no other ABI seems to have:

-asmlinkage ssize_t sys_pread(unsigned int fd, char * buf,
-                            size_t count, loff_t pos)
+static inline
+ssize_t do_pread(unsigned int fd, char * buf, size_t count, loff_t pos)
[...]
+#if BITS_PER_LONG == 32
+#ifdef __BIG_ENDIAN
+#define LOFF_T(high, low) unsigned int high, unsigned int low
+#else
+#define LOFF_T(high, low) unsigned int low, unsigned int high
+#endif
+
+asmlinkage
+ssize_t sys_pread(unsigned int fd, char *buf, size_t count, LOFF_T(high, low))
+{
+       return do_pread(fd, buf, count, (loff_t)high << 32 | low);
+}
+
+ssize_t sys_pwrite(unsigned int fd, char *buf, size_t count, LOFF_T(high, low))
+{
+       return do_pwrite(fd, buf, count, (loff_t)high << 32 | low);
+}

the problem is that the PA ABI specifies that quantities shall be
`naturally' aligned, even 64-bit quantities on 32-bit machines.  so the
kernel is expecting to see:

	fd (32 bits)
	buf (32 bits)
	count (32 bits)
	(empty)
	pos (64 bits)

what it _actually_ gets (because glibc is hideously broken, IMO):

	fd
	buf
	count
	(pos >> 32)
	pos & 0xffffffff

is there any chance of having a flag (or maybe an __attribute__ that
we could #define asmlinkage to?) which would change the ABI to be more
compressed like all the other architectures?

-- 
Revolutions do not require corporate support.
