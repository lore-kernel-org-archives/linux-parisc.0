Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id QAA21579
	for <parisc-linux@puffin.external.hp.com>; Mon, 15 Nov 1999 16:02:16 -0700
Sender: frowand@cup.hp.com
Message-ID: <38309117.3707D5FB@hp.com>
Date: Mon, 15 Nov 1999 15:02:47 -0800
From: Frank Rowand <frank_rowand@hp.com>
Reply-To: frowand@cup.hp.com
MIME-Version: 1.0
To: Ryan Bradetich <rbradetich@uswest.net>
Cc: frowand@cup.hp.com, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] arch/parisc/kernel/realmode_setup.c Question
References: <382F3C94.BFF3EB9D@uswest.net>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Ryan Bradetich wrote:
> 
> Paul,
> 
> I have started working on getting the kernel to boot on the PA2.0
> architecture again, and I see the you and others have been doing
> lots of work with the initialization code.  (Nice job to everyone btw,
> the code is a lot easier to figure out for a newbie like me! :)
> 
> I was looking at the following section of code and I have a
> discrepancy that I wanted to make you aware of.  I don't know how
> to fix it yet, but I will continue to look.
> 
> I am working on a C200+ which has the PA2.0 processor, so in the
> the following section of code it should give me an error during the
> BTLB initialization, but during the PDC_BTLB_INSERT pret is set
> to 0, so the check for non-PA1.1 architecture's fail.
> 
> I will continue to look through the documentation that has been
> previously pointed out, and the devresource page  pointed out by
> Frank Rowand to see if I can find a solution to the problem.
> 
> Thanks,
> 
> Ryan Bradetich
> 
> [Taken from arch/parisc/kernel/realmode_setup.c]
> 
>  /* This whole VM setup stuff may be removed ultimately.  It seems
>    * to me that once the TLB miss handlers are ready, we just switch
>    * to VM and let them handle TLB population -PB
>    */
> 
>   pret = (*PAGE0->mem_pdc)(
>   PDC_BLOCK_TLB,
>   PDC_BTLB_INSERT,
>   0x00000000,  /* MS bits, virt page number */
>   0xc0000,  /* LS bits, virt page number */
>   0x00000000,  /* Physical page number */
>   4096,   /* # pages to map */
>   0x03000000,  /* access rights, etc... */
>   0);   /* slot number */
> 
>   if (pret != 0)
>  {
>        mprintf("PDC_BTLB_INSERT returned %d\n", pret);
>       if (pret == -1)
>      {
>         mprintf("Looks like there's no BTLB on this box, so it's
> probably\n"
>                        "either PA1.0 or PA2.0.  In any case we're
> screwed for now\n");
>         led_flash();
>      }
> }


Ryan,


This might not solve your problem, but it's worth checking out.  The
procedure calling convention for PA 2.0 PDC is different than for 1.0.
See http://thepuffingroup.com/parisc/documentation.html, pdc.pdf,
p 2-8 defines the return status as a 64-bit, not 32 bit.  You might
also want to look at the neighboring pages of the document for other
changes (eg, arg4 through arg7 are passed in registers).

I don't know if your system has wide or narrow PDC - you have to call
PDC_MODEL(Return Capabilities), and check bit 63 of caps (the field
called OS64).

-Frank
