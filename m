Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id QAA13074
	for <parisc-linux@puffin.external.hp.com>; Tue, 24 Aug 1999 16:53:51 -0600
Message-Id: <199908242255.PAA09913@milano.cup.hp.com>
To: Matthew Wilcox <Matthew.Wilcox@genedata.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Booting 715/100 
In-reply-to: Your message of "Tue, 24 Aug 1999 23:44:40 PDT."
             <19990824234440.H31994@mencheca.ch.genedata.com>
Date: Tue, 24 Aug 1999 15:55:40 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
> On Tue, Aug 24, 1999 at 02:21:35PM -0700, Grant Grundler wrote:
> > I finally managed to build a kernel from the 08/07/99 tar file.
> 
> I assume you mean 07/Aug/99 rather than 08/Jul/99?  :-)

Yes - sorry about the convoluted american date notation.
The linux-2.2.3-19990808.tar.gz is only 291 bytes.
19990807 was the last "full" tarball.

> > Now I can't boot it!
> > 
> > I might need to update the source tree again but need
> > to figure out how CVS can operate through HP's firewall.
> 
> Can you ssh out?  CVS_RSH=ssh should do the trick if so.

Didn't have ssh...but "socksify" command seems to work
rather nicely. Found it in /opt/socks/bin and cvs can now
talk to the puffin.external.hp.com.


> > I also wasn't sure about the difference between
> > CONFIG_PA7100 and CONFIG_PA7300 in the .config file.
> > I thought the 715/100 is an older machine before 7300LC
> > was available and thus is PA7100. Is this right?
> 
> Well, according to /usr/sam/lib/mo/sched.models (a very useful file!)
> 
> 715     1.1c    PA7100LC

Forgot about this table...good thinking.

> 
> It doesn't mention the submodels explicitly.  However,
> 
> http://www.thepuffingroup.com/parisc/hp9000_models.html
> 
> says the 715/100 (both variants!) have PCXL CPUs which is the same as that
> on the 712 models, which we know to be the 7100LC.
> 
> Sorry I can't be of any help on the actual problem though...

This already helped...I'll assume CONFIG_PA7100 means PA7100LC.

BTW, I went through the linux/.config file and found conflicting
options enabled (eg. 712 was enabled). So, I'm rebuilding...and
we'll see what happens.

thanks,
grant
