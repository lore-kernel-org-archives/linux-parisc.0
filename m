Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA28627
	for <parisc-linux@puffin.external.hp.com>; Wed, 19 Apr 2000 14:10:32 -0600
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel1.hp.com (Postfix) with ESMTP id EE6B11372
	for <parisc-linux@thepuffingroup.com>; Wed, 19 Apr 2000 13:10:25 -0700 (PDT)
Received: from localhost (grundler@localhost [127.0.0.1]) by milano.cup.hp.com with SMTP (8.8.6 (PHNE_17190)/8.7.3 TIS 5.0.1) id NAA25590 for <parisc-linux@thepuffingroup.com>; Wed, 19 Apr 2000 13:10:39 -0700 (PDT)
Message-Id: <200004192010.NAA25590@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] code 28 in msdos_partition() 
In-reply-to: Your message of "Wed, 19 Apr 2000 13:22:32 PDT."
             <E12i03U-000281-00@endor.fc.hp.com>
Date: Wed, 19 Apr 2000 13:10:38 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Paul Bame wrote:
> I'm interested in looking at this problem and seeing disks work in
> general.  But I can't help since I don't have a box which seems to be
> able to find SCSI drives (tried 712, b180, c360, and c3k).  Can you
> give me a clue how to reproduce what you're seeing?

I've posted my .config on puffin.external.hp.com:~grundler/config.SCSI.
This works on the c3000. Folks who want to see that file but
don't have access should please e-mail me privately.

> With my limited experience with Linux disks and software, the
> partition table access is usually aligned right anyway, so I think
> alignment traps here should be rare.

Agreed. but not in this case.


> = The problem which distracted me was the use of generic
> = swap macros by get_unaligned. parisc-linux defines architecture
> = specific macros and I couldn't figure out why those
> = were NOT being used. Any takers for this too?
> 
> Are you asking about le32_to_cpu() versus __le32_to_cpu()?  (Not that
> I have an answer -- I'm just wondering if that's the question)

I'm seeing use of
#define ___swab32(x) \
        ((__u32)( \
                (((__u32)(x) & (__u32)0x000000ffUL) << 24) | \
                (((__u32)(x) & (__u32)0x0000ff00UL) <<  8) | \
                (((__u32)(x) & (__u32)0x00ff0000UL) >>  8) | \
                (((__u32)(x) & (__u32)0xff000000UL) >> 24) ))

(from include/linux/byteorder/swab.h)

Instead of
static __inline__ __const__ __u32 ___arch__swab32(__u32 x)
{
        unsigned int temp;
        __asm__("shd %0, %0, 16, %1\n\t"        /* shift abcdabcd -> cdab */
                "dep %1, 15, 8, %1\n\t"         /* deposit cdab -> cbab */
                "shd %0, %1, 8, %0"             /* shift abcdcbab -> dcba */
                : "=r" (x), "=&r" (temp)
                : "0" (x));
        return x;
}

(from include/asm-parisc/byteorder.h)

grant

Grant Grundler
Unix Development Lab
+1.408.447.7253
