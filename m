Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id EAA16394
	for <parisc-linux@puffin.external.hp.com>; Thu, 18 May 2000 04:51:49 -0600
Message-ID: <20000518045138.C14031@puffin.external.hp.com>
Date: Thu, 18 May 2000 04:51:38 -0600
From: Philipp Rumpf <prumpf@puffin.external.hp.com>
To: Alan Modra <alan@linuxcare.com.au>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] New binutils available from cvs
References: <20000518034536.A14031@puffin.external.hp.com> <Pine.LNX.4.21.0005181952080.6449-100000@front.linuxcare.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0005181952080.6449-100000@front.linuxcare.com.au>; from Alan Modra on Thu, May 18, 2000 at 08:37:20PM +1000
List-ID: <linux-parisc.vger.kernel.org>

On Thu, May 18, 2000 at 08:37:20PM +1000, Alan Modra wrote:
> On Thu, 18 May 2000, Philipp Rumpf wrote:
> 
> > On Thu, May 18, 2000 at 12:41:13PM +1000, Alan Modra wrote:
> > > Hello everyone,
> > >    I have just uploaded a new binutils to puffin.external.hp.com cvs.  The
> > > new binutils, which you can get with "cvs co binutils-2.10", is a merge of
> > 
> > Any reason for renaming cvs modules all the time instead of staying with
> > one name and perhaps not pissing off people with slow, expensive
> > connections ?
> 
> Mainly so people can still easily use the old binutils.  .diff.gz came to
> 1.8M anyway.  I can put the diff somewhere you can get it, if you like.
> 
> > > ***BIG WARNING**
> > >   This binutils goes back to using the standard hppa comment char and line
> > > separator char.  Existing puffin parisc code needs to be modified to suit,
> > 
> > This
> >  a) makes certain glbic code harder to work (which already does work, at
> >     that)
> 
> Can you explain this?
> 
> >  b) is inconsistent with every single other architecture that does run
> >     Linux
> >  c) is inconsistent with my tree, and basically forces me to distribute
> >     binutils and gcc patches in addition to the gcc one-liner I already
> >     have.
> > 
> > All in all this strikes me as not too smart.
> 
> Using `!' for comments
> a) breaks fp condition codes.

No, it doesn't.  The condition code for fp "not equal" is "<>", not "!=".

> b) is inconsistent with existing hp assembler.

Your point ?

We broke existing assembly language / used the smarter of two possibilities
on almost all architectures.

> All in all .... :-)

All in all even _if_ you have a reason to change it back it could have used
some discussion.  So far you haven't.

> Item a) is the killer.  It might be possible to work around this problem
> and make `!' start a comment only when the preceding non-whitespace
> character is not a comma, but this sort of horrible hack hasn't much hope
> of ever being accepted back into FSF binutils.

Any idea which illegal drug the person who decided "!=" was the fp not
equal condition code was on ;) ?

> > BTW, did you fix gcc to work with -mdisable-fpregs and actually make the
> > kernel use that in the CVS tree ?  It caused a lot of oopses here before
> > I worked around it (patch is at
> > ftp://linux-parisc.sourceforge.net/pub/linux-parisc/) (why we got oopses
> > and what is wrong should be quite obvious if you know RTL - I don't and
> > it seems reasonably obvious to me, I just can't fix it).
> 
> No, I haven't done anything with gcc

Anyone else ?  I think you (plural) should at least have a look causing
random data corruption.

> Linuxcare.  Support for the Revolution.

And it's just in historical spirit that those actually supporting the
revolution lose their jobs ... (yes, I think the signature is quite 
inconsiderate.)


	Philipp Rumpf
