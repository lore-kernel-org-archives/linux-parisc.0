Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA08561
	for <parisc-linux@puffin.external.hp.com>; Tue, 22 Aug 2000 09:52:12 -0600
Received: from user32-46.jakinternet.co.uk (HELO rhirst.linuxcare.com) (@212.41.32.46)
  by mailserv2.iuinc.com with SMTP; 22 Aug 2000 15:52:03 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id AF1EFB005; Tue, 22 Aug 2000 16:50:47 +0100 (BST)
Date: Tue, 22 Aug 2000 16:50:47 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 2.4.0-test6 lack of speed
Message-ID: <20000822165047.X4060@linuxcare.com>
References: <20000822153803.U4060@linuxcare.com> <20000822155221.W4060@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20000822155221.W4060@linuxcare.com>; from rhirst@linuxcare.com on Tue, Aug 22, 2000 at 03:52:21PM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Aug 22, 2000 at 03:52:21PM +0100, Richard Hirst wrote:
> > __flush_dcache_range: addr 0x00001000, size 770048
> > __flush_icache_range: addr 0x00001000, size 770048
> > __flush_dcache_range: addr 0x000bd000, size 24576
> > __flush_icache_range: addr 0x000bd000, size 24576
> > __flush_dcache_range: addr 0x000c3000, size 102400
> > __flush_icache_range: addr 0x000c3000, size 102400
> > __flush_dcache_range: addr 0x2001f000, size 268308480
> > __flush_icache_range: addr 0x2001f000, size 268308480

Those ones are caused by a call to flush_page_range() being added to
mm/mmap.c:exit_mmap().

We just blindly assume addresses passed to flush_page_range() are
kernel virtual addresses, but in this case I guess they are user
process virtual addresses.  Even so, the last one below looks
like a rather large area to have mmapped.

exit_mmap: calling flush_cache_range(0x00001000, 0x00083000)
exit_mmap: calling flush_cache_range(0x00083000, 0x00085000)
exit_mmap: calling flush_cache_range(0x00085000, 0x00088000)
exit_mmap: calling flush_cache_range(0x2001f000, 0x30000000)

(the exit_mmap debug is from a different kernel build, so don't
try and match the numbers with those quoted above)

Richard
