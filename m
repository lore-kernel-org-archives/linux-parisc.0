Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.tiscali.be (mail.tiscali.be [62.235.14.106])
	by dsl2.external.hp.com (Postfix) with ESMTP id 48DB04829
	for <parisc-linux@lists.parisc-linux.org>; Wed,  9 Oct 2002 11:07:28 -0600 (MDT)
Date: Wed, 9 Oct 2002 19:00:12 +0200
Message-ID: <3DA3C54C000001C9@ocpmta5.be.tiscali.com>
From: jsoe0708@tiscali.be
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Subject: [parisc-linux] uaccess.h BUG (non-feature?)
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

Hi all,

In the tools evms-1.2 I finaly found the solution in itself :-?

Here is the code:
...
#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,4,18)
                rc = evms_cs_kernel_ioctl(new_disk, BLKGETSIZE64,
                                          (ulong) & new_disk->total_vsectors);
                if (!rc) {
                        /* convert bytes to 512 byte sectors */  
                        new_disk->total_vsectors >>= EVMS_VSECTOR_SIZE_SHIFT;
                } else
#endif
...

which seems to be kind to verify that kernel support this feature, isn't
it?

But hppa kernel put_kernel(x,ptr) did not send error return code in that
case of test (just printk bug message).

I do not know if it is the best patch but here is the simple solution I test:
...
#if BITS_PER_LONG == 32
#define LDD_KERNEL(ptr)         BUG(); __gu_err=-1;
#define LDD_USER(ptr)           BUG(); __gu_err=-1;
#define STD_KERNEL(x, ptr)      BUG(); __pu_err=-1;
#define STD_USER(x, ptr)        BUG(); __pu_err=-1;
#else
...

Seems to work even with annoying bug messages.

Thanks in advance for advise,
    Joel
