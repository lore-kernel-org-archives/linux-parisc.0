Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id BAA11416
	for <parisc-linux@puffin.external.hp.com>; Tue, 12 Dec 2000 01:59:45 -0700
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 12 Dec 2000 09:01:39 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id UAA12556;
	Tue, 12 Dec 2000 20:01:16 +1100
Date: Tue, 12 Dec 2000 20:01:16 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Matt Taggart <taggart@carmen.fc.hp.com>
cc: Grant Grundler <grundler@cup.hp.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 32-bit xc-20001206.tar.gz is foobar 
In-Reply-To: <20001212084449.EB32737CA1@carmen.fc.hp.com>
Message-ID: <Pine.LNX.4.21.0012121945440.27939-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Tue, 12 Dec 2000, Matt Taggart wrote:

> $ hppa-linux-objdump -h fs.o
>[snip]
>  10 .text         00000008  00000000  00000000  00013420  2**2
>                   CONTENTS, ALLOC, LOAD, READONLY, CODE
>  11 .init.text    00001b3c  00000000  00000000  00013428  2**2
>                   CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
>  12 .text.1       00005f48  00000000  00000000  00014f64  2**2
>                   CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
>  13 .text.2       00003078  00000000  00000000  0001aeac  2**2
>[snip]

Looks good to me, what I'd expect to see with the new binutils and a
compile without -ffunction-sections.  I'll see if I can reproduce it -
it's probably a bug in the latest binutils .

-- 
Linuxcare.  Support for the Revolution.
