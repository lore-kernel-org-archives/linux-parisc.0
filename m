Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id EAA26669
	for <parisc-linux@puffin.external.hp.com>; Wed, 30 Aug 2000 04:15:22 -0600
Received: from user48-177.jakinternet.co.uk (HELO rhirst.linuxcare.com) (@212.41.48.177)
  by mailserv2.iuinc.com with SMTP; 30 Aug 2000 10:15:25 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 6E607B005; Wed, 30 Aug 2000 11:15:23 +0100 (BST)
Date: Wed, 30 Aug 2000 11:15:23 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Matthew Wilcox <matthew@wil.cx>
Cc: David Huggins-Daines <dhd@linuxcare.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 2.4.0-test6 lack of speed
Message-ID: <20000830111523.F877@linuxcare.com>
References: <20000822153803.U4060@linuxcare.com> <20000822155221.W4060@linuxcare.com> <20000822165047.X4060@linuxcare.com> <87n1i5wabx.fsf@linuxcare.com> <20000823172320.E4060@linuxcare.com> <20000829172308.A1032@vodka.thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20000829172308.A1032@vodka.thepuffingroup.com>; from matthew@wil.cx on Tue, Aug 29, 2000 at 05:23:08PM -0400
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Aug 29, 2000 at 05:23:08PM -0400, Matthew Wilcox wrote:
> My attempt at fixing this in a sane manner led me to create:
> 
> #define user_fdc(addr) asm volatile("fdc 0(%%sr3,%0)" : : "r" (addr))
> (...)
> 
> and
> 
> #define kernel_fdc(addr) asm volatile("fdc 0(%%sr0,%0)" : : "r" (addr))
> (...)
> 
> however, the resulting kernel wouldn't boot.  So let's take this a

I tried something similar, with the same result.

What do you make of arch/parisc/lib/usercopy.c

unsigned long
__generic_copy_to_user(void *to, const void *from, unsigned long n)
{
        if (access_ok(VERIFY_WRITE, to, n)) {
                __flush_dcache_range((unsigned long)from, n);
                lcopy_to_user(to,from,n);
                __flush_dcache_range((unsigned long)to, n);
        }
        return 0;
}


Typically 'from' would be a kernel virtual address, and 'to' would
be a user virtual address, yes?  So, that is expecting __flush_dcache_range()
to know which space register to use.  But then sometimes these functions
for accessing user space are redirected at kernel space by set_fs().
In that case both addresses are kernel virtual addresses.

lcopy_to_user() claims to modify %sr1 to get the right space in %sr1,
based on a flag in the task struct.

See copy_strings_kernel() in fs/exec.c for an example of where
copy_from_user( is used to copy from kernel space.

Richard
