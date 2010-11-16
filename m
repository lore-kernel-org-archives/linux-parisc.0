From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: HPMC in lba_pat_out8 on rp3440
Date: Tue, 16 Nov 2010 17:51:21 -0500
Message-ID: <20101116225120.GA25133@hiauly1.hia.nrc.ca>
References: <20101104153507.GA7198@lackof.org> <20101107193156.F14EF4E1C@hiauly1.hia.nrc.ca> <20101110033527.GA24762@hiauly1.hia.nrc.ca> <20101114234212.GA20422@hiauly1.hia.nrc.ca>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20101114234212.GA20422@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 14 Nov 2010, John David Anglin wrote:

> I've pretty much narrowed down where the unaligned load is.  It coming from
> init_page_buffers.  I had to disable inlining of this function to simplify 
> the code.
> 
> 00000000401f9698 <init_page_buffers>:
>     401f9698:   08 03 02 41     copy r3,r1
>     401f969c:   08 1e 02 43     copy sp,r3
>     401f96a0:   73 c1 00 88     std,ma r1,40(sp)
>     401f96a4:   0f 40 10 dc     ldd 0(r26),ret0
>     401f96a8:   c6 9c c0 e8     bb,>= ret0,14,401f9724 <init_page_buffers+0x8c>
>     401f96ac:   db 5c 0b fd     extrd,u r26,63,3,ret0
>     401f96b0:   bf 80 20 e8     cmpb,*<> r0,ret0,401f972c <init_page_buffers+0x94>
>     401f96b4:   53 54 00 20     ldd 10(r26),r20
>     401f96b8:   0f 40 10 dc     ldd 0(r26),ret0
>     401f96bc:   db 9a 0b 9f     extrd,u ret0,60,1,r26
>     401f96c0:   0b 40 28 a0     cmpclr,*= r0,r26,r0
>     401f96c4:   08 14 02 53     copy r20,r19
> ->  401f96c8:   0e 60 10 dc     ldd 0(r19),ret0

This hpmc seems to be a gcc miscompilation:
ii  gcc-4.3-hppa64 4.3.5-4        The GNU C compiler (cross compiler for hppa6

The hpmc is avoided by not inlining init_page_buffers().

Trying 4.4.5.  I believe 4.3.5-4 was from the initial lenny install.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

diff --git a/fs/buffer.c b/fs/buffer.c
index 3e7dca2..654128e 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -963,7 +963,7 @@ link_dev_buffers(struct page *page, struct buffer_head *head)
 /*
  * Initialise the state of a blockdev page's buffers.
  */ 
-static void
+static __attribute__((__noinline__)) void
 init_page_buffers(struct page *page, struct block_device *bdev,
 			sector_t block, int size)
 {
