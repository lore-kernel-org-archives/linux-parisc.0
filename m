Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id CAA02066
	for <parisc-linux@puffin.external.hp.com>; Mon, 21 Jun 1999 02:41:54 -0600
Date: Mon, 21 Jun 1999 10:41:48 +0200
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Matthew Wilcox <Matthew.Wilcox@genedata.com>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] HPUX binary compatibility
Message-ID: <19990621104148.M30362@mencheca.ch.genedata.com>
References: <19990620194015.J30362@mencheca.ch.genedata.com> <E10vomE-0004vh-00@the-village.bc.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <E10vomE-0004vh-00@the-village.bc.nu>; from Alan Cox on Sun, Jun 20, 1999 at 10:05:16PM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Sun, Jun 20, 1999 at 10:05:16PM +0100, Alan Cox wrote:
> > any negative effect on anything.  Where it gets a little more thorny is
> > in signal.h -- HPUX uses more than 32 signals.  Is it going to negatively
> > impact Linux at all to use more than 32?  I see there is space reserved
> > for them, but I'd like someone to reassure me.
> 
> How many non RT signals has HP/UX got. If its more than 32 we should allow
> for it, otherwise whoever does HP/UX compatibility will hate you 

1-36 are non-RT, 37-44 are RT.  The header file contains the ominous
comment:

/* New signals: assign numbers before _SIGRTMIN, and increase _SIGRTMIN
   and _SIGRTMAX to keep at end. */

The signal.h I committed last night gives Linux/PARISC ordinary signals
from 1-36 and RT signals from 37-64.  I reused _SIGGFAULT (Graphics
framebuffer fault) to be SIGSTKFLT for which HPUX has no equivalent.  My
question was, will having more than 32 signals annoy any Linux people?

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson
