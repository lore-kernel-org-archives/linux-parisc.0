Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id CAA17247
	for <parisc-linux@puffin.external.hp.com>; Sat, 15 Jul 2000 02:32:00 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 15 Jul 2000 08:33:36 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id SAA31318;
	Sat, 15 Jul 2000 18:33:28 +1000
Date: Sat, 15 Jul 2000 18:33:28 +1000 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: David Huggins-Daines <dhd@linuxcare.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: GAS fix for reloc problems (was Re: [parisc-linux] Non-bootable
 kernel problems)
In-Reply-To: <87zonkxsug.fsf_-_@linuxcare.com>
Message-ID: <Pine.LNX.4.21.0007151813150.23959-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On 14 Jul 2000, David Huggins-Daines wrote:

> Done.  PA-RISC porters, update your binutils-2.10 and GCC. (again :-)

Just a note on the patch.  This particular bug existed in the elf hppa
assembler long before anyone tried porting linux to parisc - it's not
specific to the kernel.  David's fix may just happen to cure some userland
problems too.

-- 
Linuxcare.  Support for the Revolution.
