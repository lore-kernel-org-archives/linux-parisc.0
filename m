Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA20898
	for <parisc-linux@puffin.external.hp.com>; Sat, 12 Aug 2000 18:13:46 -0600
Received: from upchuck.cygnus.com (cse.cygnus.com [205.180.230.236])
	by runyon.cygnus.com (8.8.7-cygnus/8.8.7) with ESMTP id LAA21886
	for <parisc-linux@thepuffingroup.com>; Sat, 12 Aug 2000 11:13:58 -0700 (PDT)
To: David Huggins-Daines <dhd@linuxcare.com>
cc: Alan Modra <alan@linuxcare.com.au>, parisc-linux@thepuffingroup.com,
        parisc@lists.linuxcare.com
Subject: Re: Millicode calls, GP register, ld -r 
Reply-To: law@cygnus.com
In-reply-to: Your message of 12 Aug 2000 11:23:35 EDT.
             <87punemrk8.fsf@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sat, 12 Aug 2000 12:13:00 -0600
Message-ID: <6983.966103980@upchuck>
From: Jeffrey A Law <law@cygnus.com>
List-ID: <linux-parisc.vger.kernel.org>

  In message <87punemrk8.fsf@linuxcare.com>you write:
  > Alan Modra <alan@linuxcare.com.au> writes:
  > 
  > > I'll install a slightly modified version of your patch.  The other PLABEL
  > > relocs should be handled as for PLABEL32, not that it matters for gcc
  > > output as I've never caught gcc generating code that used PLABEL14R and
  > > PLABEL21L.  A pity, because current gcc PIC code for handling function
  > > pointers is rather inefficient.  Typically, you get something like:
  > > 
  > > .LC1:
  > >         .word P'bar
  > > .
  > > .
  > >         addil LT'.LC1,%r19
  > >         ldw RT'.LC1(%r1),%r22
  > >         ldw 0(%r22),%r22
  > > 
  > > which could all be replaced with
  > > 
  > > 	ldil LP'bar,%r22
  > > 	ldo RP'bar(%r22),%r22
  > > 
  > > saving on code size, memory accesses, and relocs.
  > 
  > Interesting.  It would be trivial to hack that into GCC, I just wonder
  > if there's some good reason it hasn't been done before.
"inline plabels" used to be in GCC, but were removed a few years ago; they
were abolished roughly 4 years ago.

My recollection was that the inline plabel sequence needed for MPE was 
actually less efficient than getting the value out of memory.   And
HP didn't believe the benefit from having an inline sequence for the HPUX
calling conventions was worth the extra maintenance burden in their
compiler.  GCC (of course) followed HP's recommendations and abolished
inline plabels.

jeff
