Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id RAA19726
	for <parisc-linux@puffin.external.hp.com>; Wed, 17 Nov 1999 17:41:44 -0700
Sender: frowand@cup.hp.com
Message-ID: <38334BA5.BAA898D@hp.com>
Date: Wed, 17 Nov 1999 16:43:17 -0800
From: Frank Rowand <frank_rowand@hp.com>
Reply-To: frowand@cup.hp.com
MIME-Version: 1.0
To: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
Cc: Stan Sieler <sieler@allegro.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] depi?
References: <19991117235220.E10209@mathe.stud.uni-erlangen.de> <199911172337.PAA14420@opus.allegro.com> <19991118010930.G10209@mathe.stud.uni-erlangen.de>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Philipp Rumpf wrote:
> 
> > I must be missing something...the above should branch
> > to: sr7.0xc008dbc0, not to "0xc008dbc0".  I.e., you specified SR7
> > in the BE instruction, so it gets used.
> 
> No, we didn't.  We set the space register selection field to '00' which
> according to the documentation means you select SR7 but in reality means
> you don't want to have anything to do with space registers.  Just think
> of it as flat address 0xc008dbc0 and of SR[123]:0xc008dbc0 as "real"
> segmented addresses.


When address translation is enabled, a space register is *always* used.
You cannot turn that off.  Specifying '00' in the space register
select bits really does mean that you use space register 7 to calculate
the 64 bit virtual address.  (Humor me, and pretend that all
implementations of space registers are 32 bits, even though they aren't.)

If you "don't want to have anything to do with space registers", you
can put the same value (such as zero) in all of the space registers.


> > So, SR7 indeed needs to be set correctly...but since I haven't
> > looked at the surrounding code...
> 
> SR0, SR4, SR5, SR6, SR7 shouldn't ever need to be set to different values
> for flat 4 gig code.  SR1, SR2, SR3 you use only for "real" segmented code.
> 
> (This is based on what the C compiler does, and what changed with PA2.0)
> 
>         Philipp Rumpf

I don't understand.  Are you saying that there is a single 4gByte virtual
address range that is shared by the kernel and all user processes?  Or
do you plan to provide a separate 4gByte virtual address range to each
process/task/thread/whatever?

-Frank
