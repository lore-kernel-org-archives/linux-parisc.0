Return-Path: <willy@www.linux.org.uk>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk
	[195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5CA8A48B2
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 27 Jan 2004 10:37:44 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1AlX9i-0005GH-Tq; Tue, 27 Jan 2004 17:37:42 +0000
Date: Tue, 27 Jan 2004 17:37:42 +0000
From: Matthew Wilcox <willy@debian.org>
To: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] error?
Message-ID: <20040127173742.GB11844@parcelfarce.linux.theplanet.co.uk>
References: <40163368.74DACC64@india.hp.com>
	<20040127172256.GB28476@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040127172256.GB28476@colo.lackof.org>
Sender: <willy@www.linux.org.uk>
Cc: parisc-linux@lists.parisc-linux.org, Naresh Kumar <knaresh@india.hp.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Tue, Jan 27, 2004 at 10:22:56AM -0700, Grant Grundler wrote:
> On Tue, Jan 27, 2004 at 03:16:16PM +0530, Naresh Kumar wrote:
> >    r->end    = p->end;
> >    r->flags  = IORESOURCE_MEM;
> >    r->parent = r->sibling = r->child = NULL;
> >    break;
> >    lba_dev->gmmio_base = p->start;
> >    break;
> > 
> >   case PAT_NPIOP:
> >     printk(KERN_WARNING MODULE_NAME
> >     " range[%d] : ignoring NPIOP (0x%lx)\n",
> >     i, p->start);
> >    break;
> > -------------------------------------------------------------------
> > 
> > Please note the extra lines after the 'break;'. The version of
> > 'lba_pci.c' is 1.7. Seems to have happened due to oversight.
> 
> Those are "extra"?
> The version of code in linux-2.4 CVS has:
>                 case PAT_GMMIO:
>                         printk(KERN_WARNING MODULE_NAME
>                                 " range[%d] : ignoring GMMIO (0x%lx)\n",
>                                 i, p->start);
>                         lba_dev->gmmio_base = p->start;
>                         break;
> 
> The code you quoted is missing the "case PAT_GMMIO" and printk.

The bit he's referring to is:

>    break;
>    lba_dev->gmmio_base = p->start;
>    break;

which is clearly bogus.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
