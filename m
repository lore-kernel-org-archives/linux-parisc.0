Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA04435
	for <parisc-linux@puffin.external.hp.com>; Mon, 10 Jul 2000 08:00:22 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 10 Jul 2000 14:01:43 -0000
To: Alan Modra <alan@linuxcare.com.au>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] problems with gcc 2.96
References: <20000709150024.A16294@vodka.thepuffingroup.com> <Pine.LNX.4.21.0007100959080.684-100000@front.linuxcare.com.au> <20000710082844.C16294@vodka.thepuffingroup.com>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 10 Jul 2000 10:00:32 -0400
In-Reply-To: willy@thepuffingroup.com's message of "Mon, 10 Jul 2000 08:28:44 -0400"
Message-ID: <87snticcfz.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

willy@thepuffingroup.com writes:

> On Mon, Jul 10, 2000 at 10:06:06AM +1000, Alan Modra wrote:
> > On Sun, 9 Jul 2000 willy@thepuffingroup.com wrote:
> > 
> > > /home/willy/parisc/hppa1.1-linux/include/bits/stdio-lock.h:29:2: #error libio needs recursive mutexes for _IO_MTSAFE_IO
> > > make[1]: *** [iogetline.o] Error 1
> > > 
> > > dhd, you must have solved this already?
> > 
> > Errm, unless your glibc versions differ.  I did a merge on June 10.  Ducks
> > for cover.
> 
> I spoke to dhd last night and apparently the solution is to
> --disable-multilib for gcc.  i'm just trying it now and it appears to
> get a lot further.  time to update the recipe, i guess.

I've already told willy this, but this is due to the C++ support.
Configure with --enable-languages=c for the time being until it's sorted.

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
