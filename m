Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id VAA18603
	for <parisc-linux@puffin.external.hp.com>; Sat, 16 Dec 2000 21:30:53 -0700
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 17 Dec 2000 04:33:47 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id PAA16883;
	Sun, 17 Dec 2000 15:31:19 +1100
Date: Sun, 17 Dec 2000 15:31:19 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Jes Sorensen <jes@linuxcare.com>
cc: Matthew Wilcox <matthew@wil.cx>, John Marvin <jsm@udlkern.fc.hp.com>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] ldcw in __pthread_acquire
In-Reply-To: <d38zpgdo4f.fsf@lxplus015.cern.ch>
Message-ID: <Pine.LNX.4.21.0012171457580.14217-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On 16 Dec 2000, Jes Sorensen wrote:

> >>>>> "Matthew" == Matthew Wilcox <matthew@wil.cx> writes:
> 
> Matthew> On Fri, Dec 15, 2000 at 06:32:12PM +0100, Jes Sorensen wrote:
> >>  We probably cannot, we can however create our own version of the
> >> header file for the parisc port.
> 
> Matthew> That was what I meant.  the question is, would it _work_?  Or
> Matthew> is this struct embedded in other structs at
> Matthew> non-16byte-aligned positions?
> 
> That can be solved by adding an aligned attribute to the struct definition.

Doesn't a struct automatically inherit the maximum alignment of its
fields?

-- 
Linuxcare.  Support for the Revolution.
