Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id HAA27844
	for <parisc-linux@puffin.external.hp.com>; Wed, 30 Aug 2000 07:18:26 -0600
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (root@195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 30 Aug 2000 13:18:30 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 13U7l3-0006ZU-00; Wed, 30 Aug 2000 14:18:25 +0100
Date: Wed, 30 Aug 2000 14:18:25 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: Matthew Wilcox <matthew@wil.cx>, David Huggins-Daines <dhd@linuxcare.com>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 2.4.0-test6 lack of speed
Message-ID: <20000830141825.A3463@parcelfarce.linux.theplanet.co.uk>
References: <20000822153803.U4060@linuxcare.com> <20000822155221.W4060@linuxcare.com> <20000822165047.X4060@linuxcare.com> <87n1i5wabx.fsf@linuxcare.com> <20000823172320.E4060@linuxcare.com> <20000829172308.A1032@vodka.thepuffingroup.com> <20000830111523.F877@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20000830111523.F877@linuxcare.com>; from rhirst@linuxcare.com on Wed, Aug 30, 2000 at 11:15:23AM +0100
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Aug 30, 2000 at 11:15:23AM +0100, Richard Hirst wrote:
> What do you make of arch/parisc/lib/usercopy.c
> 
> unsigned long
> __generic_copy_to_user(void *to, const void *from, unsigned long n)
> {
>         if (access_ok(VERIFY_WRITE, to, n)) {
>                 __flush_dcache_range((unsigned long)from, n);
>                 lcopy_to_user(to,from,n);
>                 __flush_dcache_range((unsigned long)to, n);
>         }
>         return 0;
> }
> 
> Typically 'from' would be a kernel virtual address, and 'to' would
> be a user virtual address, yes?  So, that is expecting __flush_dcache_range()
> to know which space register to use.  But then sometimes these functions
> for accessing user space are redirected at kernel space by set_fs().
> In that case both addresses are kernel virtual addresses.

Right.  But I don't see why we need to flush any caches at all here.
We're not changing any mappings, we're accessing through a fixed space
register, there's no other device involved, if there were another CPU
involved then it would be cache-coherent _anyway_ -- what's the problem?
