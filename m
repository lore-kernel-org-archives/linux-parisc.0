Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA05493
	for <parisc-linux@puffin.external.hp.com>; Wed, 22 Nov 2000 17:18:26 -0700
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 23 Nov 2000 00:20:37 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id LAA24591;
	Thu, 23 Nov 2000 11:18:20 +1100
Date: Thu, 23 Nov 2000 11:18:20 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Matt Taggart <taggart@carmen.fc.hp.com>
cc: doneill@linuxcare.com, parisc-linux@thepuffingroup.com
Subject: Re: glibc
In-Reply-To: <20001122213444.3E1B037CA7@carmen.fc.hp.com>
Message-ID: <Pine.LNX.4.21.0011231041530.22889-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Wed, 22 Nov 2000, Matt Taggart wrote:

> Hi Alan,
> 
> First a timezone question... your mail headers have you in +11 and Ft. Collins 
> is -7 so you're 6 hours behind + 1 day relative to us? So as I send this it's 
> 14:05 here and 8:05 there?

Hi Matt,
  I'm actually on +10:30 in Adelaide, but posting from a Linuxcare machine
in Canberra which is on +11.

>[snip segfaults]
> I am building native using dhd's binutils/gcc/glibc debs, using source checked 
> out just after the glibc 2.2 merge. Do you think the merge / ld.so changes you 
> just made would help this problem at all?

Quite likely.  This fix

	* sysdeps/hppa/dl-machine.h (ELF_MACHINE_START_ADDRESS): Define.

is fairly crucial, as without it %dp will not be set correctly.  I should
have mentioned this when posting to the list about the binutils change.
Oh, and as of this email, I haven't actually run anything linked to the
new glibc.  A little remiss, I know, but I've been deep in the gdb port,
and if I spend time tinkering with glibc, binutils and gcc (which I like),
gdb (which I don't like) will never be finished. ;-)

Alan
-- 
Linuxcare.  Support for the Revolution.
