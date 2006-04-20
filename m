From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Does it lakes some cloberred r1 in
Date: Thu, 20 Apr 2006 15:32:42 -0400 (EDT)
Message-ID: <200604201932.k3KJWgKJ023738@hiauly1.hia.nrc.ca>
References: <200604201236.37925.mszick@morethan.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: mszick@morethan.org (Michael S. Zick)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200604201236.37925.mszick@morethan.org> from "Michael S. Zick"
	at Apr 20, 2006 12:36:37 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > > > (here) insn, an interruption occures which in turn launch the
> > > > fixup_put_user_skip_1()
> > > 
> > > A couple more questions for research :)
> > > 
> > > Q: Does the process of interruption clobber registers?
> > 
> Joel,
> 
> The machine should switch a small sub-set of the general
> registers to an alternate set, called the 'shadow registers'
> for the interruption routine to use.

fixup_put_user_skip_1() runs after the interruption, so the
shadow registers don't matter.  Look at the registers used
by fixup_put_user_skip_1() and where it returns.  Note that
GCC is only concerned about registers used in the current
function (i.e., if an asm changes sections and generates code
using registers in that section, this is all black magic to
GCC and it doesn't need to know about it).

It's clear that the __get* and __put* macros need brief comments
about the register use of the fixup routines.  Also, the fixup
routines need corresponding comments.

> I do not know if r1 is shadowed or not.

Yes.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
