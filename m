Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA32136
	for <parisc-linux@puffin.external.hp.com>; Fri, 3 Nov 2000 16:05:23 -0700
Message-Id: <5.0.0.25.0.20001103145524.00a49a50@mail.webcash.com>
Date: Fri, 03 Nov 2000 14:59:29 -0800
To: Paul Bame <bame@noam.fc.hp.com>
From: Kailashnath V Rampure <kailasr@webcash.com>
Subject: Re: [parisc-linux] Boot command 
Cc: Grant Grundler <grundler@cup.hp.com>,
        Matt Taggart <taggart@carmen.fc.hp.com>,
        parisc-linux@thepuffingroup.com
In-Reply-To: <E13rnTc-0007jH-00@noam.fc.hp.com>
References: <Your message of "Fri, 03 Nov 2000 11:46:39 PST." <5.0.0.25.0.20001103114401.00a46150@mail.webcash.com>
 <Your message of "Fri, 03 Nov 2000 11:03:23 PST." <5.0.0.25.0.20001102174648.02a4fb20@mail.webcash.com>
 <5.0.0.25.0.20001103114401.00a46150@mail.webcash.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
List-ID: <linux-parisc.vger.kernel.org>

Thanks!  Paul.
Yes I had copied the lifImage there. Now I have downloaded the kernel from 
the link you mentioned.

I am still unable to use vi as it says "linux:unknown terminal type"
Can you help me.

To add features can I add deb packages. I am not that familiar with debian.
Actually I want to build an apache + mod_ssl+mod_perl on A180c.
Regards
Kailas

At 01:30 PM 11/3/00 -0700, Paul Bame wrote:
>= ext2_open(/boot/vmlinux)=3
>= Couldn't gork your kernel executabel format failed to load kernel
>= Failed to load Kernel.
>
>That should be "grok" :-)  Apparently you're not using cut/paste for
>these error messages.
>
>This is PALO saying that /boot/vmlinux is neither elf32, elf64, nor SOM
>format.  I'm guessing, based on some earlier advice I gave when you
>were net-booting, that you may have a lifimage there by mistake -- you
>need a kernel instead, for example from
>ftp://puffin.external.hp.com/pub/parisc/binaries/kernels
>
>To tell for sure, run 'file vmlinux' on that file.  If you get
>     vmlinux: 8086 relocatable (Microsoft)
>that's probably a lifimage.  You should get this instead:
>     vmlinux: ELF 32-bit MSB executable, PA-RISC, version 1, statically 
> linked, not stripped
>
>
>         -P
