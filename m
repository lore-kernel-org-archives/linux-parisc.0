Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 49003482A
	for <parisc-linux@parisc-linux.org>; Fri,  4 May 2001 19:48:08 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14vrAm-0003td-00; Sat, 05 May 2001 02:47:52 +0100
Date: Sat, 5 May 2001 02:47:52 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: Alan Modra <alan@SPRI.Levels.UniSA.Edu.Au>
Cc: Matthew Wilcox <matthew@wil.cx>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] glibc 2.2.3: setjmp/longjmp
Message-ID: <20010505024752.P32445@parcelfarce.linux.theplanet.co.uk>
References: <20010505020157.O32445@parcelfarce.linux.theplanet.co.uk> <Pine.LNX.4.30.0105051041090.7143-100000@mullet.itr.unisa.edu.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.30.0105051041090.7143-100000@mullet.itr.unisa.edu.au>; from alan@SPRI.Levels.UniSA.Edu.Au on Sat, May 05, 2001 at 10:48:14AM +0930
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Sat, May 05, 2001 at 10:48:14AM +0930, Alan Modra wrote:
> On Sat, 5 May 2001, Matthew Wilcox wrote:
> 
> > was found.  would anyone care to remember anything else that they thought
> > `might be a problem at some point'?
> 
> lock alignment => malloc alignment.  (Possibly already fixed with new
> glibc. I haven't checked.)

Yup, that got taken care of by Ulrich.

> [re: FUNCTION_OK_FOR_SYSCALL == 0]
> > I vaguely remember that.  Searching the list archive finds:
> > http://lists.parisc-linux.org/pipermail/parisc-linux/2000-July/009002.html
> 
> That patch seems to be a merge, so we don't have the real reason for
> the change.

Sure, but I'm not sure we had it before that.  Wait!  We have cvs history!
http://puffin.external.hp.com/cvs/gcc/gcc/config/pa/pa-linux.h?r1=1.1&r2=1.2
Oh.  The comment isn't helpful.  I guess you'll have to ask dhd...
dhd@debian.org is one of his valid addresses.

-- 
Revolutions do not require corporate support.
