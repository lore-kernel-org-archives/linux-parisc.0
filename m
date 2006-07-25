From: Jeff Bailey <jbailey@raspberryginger.com>
Subject: [parisc-linux] Re: Duplicate ustat structure
Date: Mon, 24 Jul 2006 20:47:52 -0400
Message-ID: <1153788472.7679.2.camel@localhost.localdomain>
References: <20060716160300.GA27091@titanium.v3.ca>
	<jeodvpbj2k.fsf@sykes.suse.de> <20060716170725.GA29459@titanium.v3.ca>
	<119aab440607161313h4c196882gab171b4614957b7c@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  CHARSET=US-ASCII
Cc: Andreas Schwab <schwab@suse.de>,
 libc-ports@sources.redhat.com,
 parisc-linux@lists.parisc-linux.org
To: Carlos O'Donell <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-reply-to: <119aab440607161313h4c196882gab171b4614957b7c@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On dim, 2006-07-16 at 16:13 -0400, Carlos O'Donell wrote:
> On 7/16/06, Jeff Bailey <jbailey@raspberryginger.com> wrote:
> > On Sun, Jul 16, 2006 at 06:39:15PM +0200, Andreas Schwab wrote:
> >
> > > > The problem is that bits/ustat.h includes the definition of struct
> > > > ustat.  However, sys/types.h eventually winds up pulling in
> > > > linux/types.h which also defines struct ustat.
> > >
> > > <sys/types.h> should not include <linux/types.h> in the first place.
> >
> > It seems like it ought to now that the kernel is exporting a set of
> > headers that are intended to be used by userspace.  struct ustat is
> > defined in linux/types.h.
> 
> In which case this patch should go upstream to libc-alpha, where the
> generic version of ustat.h should be changed.

Certainly, but could you apply the second patch in the meantime?  That's
what all the other arch's do right now, and it will at least make
current glibc buildable with current kernel headers.  I'll try and pitch
the concept of using kernel headers instead of copying values into glibc
when I have enough time and energy to fight that battle.

Tks,
Jeff Bailey

-- 
Although when you're in the situation that RMS is telling you that
you're being too ideological about freedom, maybe, just maybe, it's
true.
- Matthew Wilcox

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
