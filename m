From: Matthew Wilcox <willy@debian.org>
Subject: Re: [parisc-linux] second sr0 patch
Date: Sun, 23 Feb 2003 22:27:48 +0000
Message-ID: <20030223222748.F2938__28635.5158816606$1416622234$gmane$org@parcelfarce.linux.theplanet.co.uk>
References: <20030223204842.E2938@parcelfarce.linux.theplanet.co.uk> <20030223222035.26E3812133@security.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Matthew Wilcox <willy@debian.org>, binutils@sources.redhat.com,
	parisc-linux@lists.parisc-linux.org
To: LaMont Jones <lamont@hp.com>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <20030223222035.26E3812133@security.hp.com>; from lamont@hp.com on Sun, Feb 23, 2003 at 03:20:35PM -0700
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Sun, Feb 23, 2003 at 03:20:35PM -0700, LaMont Jones wrote:
> In article <20030223204842.E2938@parcelfarce.linux.theplanet.co.uk> you wrote:
> > +++ gas/config/tc-hppa.c	23 Feb 2003 19:21:09 -0000
> > @@ -1794,7 +1794,7 @@ pa_ip (str)
> >  	      if (!pa_parse_number (&s, 0))
> >  		break;
> >  	      num = pa_number;
> > -	      CHECK_FIELD (num, 3, 0, 1);
> > +	      CHECK_FIELD (num, 3, 1, 1);

> I don't think this is a good plan.  Emit a warning, sure, but there is
> a large collection of legacy PARISC assembly code out there that has
> this perfectly legal, and hp-ux assembler-accepted-from-day-0 construct.

OK, patch withdrawn.  It's misleading to use this construct, but if people
have been doing it for fifteen years then it's just not reasonable to
not support it now.

The other patch still stands; we're not using sr0 so it's misleading to
pretend that we are.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
