Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA31113
	for <parisc-linux@puffin.external.hp.com>; Fri, 3 Nov 2000 13:29:26 -0700
To: Kailashnath V Rampure <kailasr@webcash.com>
Cc: Grant Grundler <grundler@cup.hp.com>,
        Matt Taggart <taggart@carmen.fc.hp.com>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Boot command 
In-Reply-To: Your message of "Fri, 03 Nov 2000 11:46:39 PST."
             <5.0.0.25.0.20001103114401.00a46150@mail.webcash.com>
References: <Your message of "Fri, 03 Nov 2000 11:03:23 PST." <5.0.0.25.0.20001102174648.02a4fb20@mail.webcash.com>  <5.0.0.25.0.20001103114401.00a46150@mail.webcash.com> 
Date: Fri, 03 Nov 2000 13:30:16 -0700
From: Paul Bame <bame@noam.fc.hp.com>
Message-Id: <E13rnTc-0007jH-00@noam.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

= ext2_open(/boot/vmlinux)=3
= Couldn't gork your kernel executabel format failed to load kernel
= Failed to load Kernel.

That should be "grok" :-)  Apparently you're not using cut/paste for
these error messages.

This is PALO saying that /boot/vmlinux is neither elf32, elf64, nor SOM
format.  I'm guessing, based on some earlier advice I gave when you
were net-booting, that you may have a lifimage there by mistake -- you
need a kernel instead, for example from
ftp://puffin.external.hp.com/pub/parisc/binaries/kernels

To tell for sure, run 'file vmlinux' on that file.  If you get
    vmlinux: 8086 relocatable (Microsoft)
that's probably a lifimage.  You should get this instead:
    vmlinux: ELF 32-bit MSB executable, PA-RISC, version 1, statically linked, not stripped


	-P
