Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA09049
	for <parisc-linux@puffin.external.hp.com>; Tue, 22 Aug 2000 10:06:00 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 22 Aug 2000 16:05:52 -0000
To: Richard Hirst <rhirst@linuxcare.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 2.4.0-test6 lack of speed
References: <20000822153803.U4060@linuxcare.com> <20000822155221.W4060@linuxcare.com> <20000822165047.X4060@linuxcare.com>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 22 Aug 2000 12:05:06 -0400
In-Reply-To: Richard Hirst's message of "Tue, 22 Aug 2000 16:50:47 +0100"
Message-ID: <87n1i5wabx.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Richard Hirst <rhirst@linuxcare.com> writes:

> We just blindly assume addresses passed to flush_page_range() are
> kernel virtual addresses, but in this case I guess they are user
> process virtual addresses.

Right.  I noticed that the FIC/FICE/FDC/FDCE instructions have a space
register field.  I wonder if we should be explicitly specifying %sr3,
since that's what we use (ahem, what we *WOULD* use if <asm/uaccess.h>
were actually implemented) to access user space.

Are PA-RISC caches indexed with the space ID as well as the offset?
Do we need to flush kernel virtual addresses at all?

> exit_mmap: calling flush_cache_range(0x00001000, 0x00083000)

text

> exit_mmap: calling flush_cache_range(0x00083000, 0x00085000)

data and bss

> exit_mmap: calling flush_cache_range(0x00085000, 0x00088000)

heap

> exit_mmap: calling flush_cache_range(0x2001f000, 0x30000000)

stack

>  Even so, the last one below looks like a rather large area to have
> mmapped.

Yes, it's arbitrarily huge, and this is a VM problem that needs to be
fixed.  It should grow upwards as needed via the page fault handler.
Paging John Marvin... (pun intended ;-)

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
