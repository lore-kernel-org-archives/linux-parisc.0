Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id SAA15431
	for <parisc-linux@puffin.external.hp.com>; Thu, 21 Oct 1999 18:57:07 -0600
Received: from xsvr4.cup.hp.com (xsvr4.cup.hp.com [15.0.68.169])
	by palrel3.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id RAA13398
	for <parisc-linux@thepuffingroup.com>; Thu, 21 Oct 1999 17:57:54 -0700 (PDT)
Sender: frowand@cup.hp.com
Message-ID: <380FB68D.A8F28E62@hp.com>
Date: Thu, 21 Oct 1999 17:57:49 -0700
From: Frank Rowand <frank_rowand@hp.com>
Reply-To: frowand@cup.hp.com
MIME-Version: 1.0
To: Paul Bame <bame@debian.fc.hp.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Boot messages from C3000 console
References: <199910212057.OAA19923@debian.fc.hp.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Paul Bame wrote:
> 
> This is long.  Thanks to Alex Williamson for this -
> 
> The short answer is once control is apparently transferred to the
> kernel, the system dies hard.  Someone who can read PIM dumps
> might deduce more from this log.
> 
>         -Paul Bame

< detailed HPMC info deleted>


We found it...

I'm cutting this from another discussion, don't feel like re-typing it.
The file we are talking about (giving line number references) is head.S.
We calculated the the offending offset was at label "blargh" plus a bit.

The following discussion talks about how we get to the code section
where the HPMC occurs.  Earlier, we talked about hard-coding magic
addresses, which are machine specific (that's in the macro "debug",
which is what actually caused the HPMC -- line 162).


<ggg> I was looking at how we get to blargh and don't get it. Only one
  location branches there.
> yes, it compares r28 to zero
> ah, r28 is the return value from the procedure called from line 265 (duhhhh)
> r1 is loaded at line 251 (the value of MEM_PDC, from page zero)
> That should be the entry point to PDC.
> So there's an error returned by the pdc call at line 265.
> calling PDC_BLOCK_TLB().  [arg0 = 18].  PDC_BLOCK_TLB doesn't exist on a
  PA2.0 server (and I assume the same for workstations), because block TLB
  entries don't exist, we have variable size pages instead.


Then I get a little incensed at the coding style here.... (editing out other
people's responses to my tirade)


> This is a **bogus** way to write code.  Comments should be required!!!!!! 
  Is there any way to encourage that?
> But I'm *extremely* serious about that.  This code is unmaintainable in it's
  current form.  It's going to be miserable adding 2.0 support to something
  like that.
> it's important to anyone who would like to pick up head.S and be able to
  read it.  To decode the procedure call I had to know where to find
  documentation for page zero, know what PDCE_PROC is, figure out what PDC
  procedure was being called.
> For me, it was about 45 seconds instead of the two seconds it would take to
  read a comment.
> For someone who doesn't have my background, it could be hours.


Ok, tirade mode off.  This is where my newbie status becomes apparent.  Please
excuse any foot in mouth here.  I looked at the Puffin web page and didn't
notice anything about the process of making sure that code that is submitted
has some minimal level of quality.  Is it just a matter of the community
applying peer pressure?

-Frank Rowand
