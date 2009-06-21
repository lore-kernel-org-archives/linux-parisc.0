From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Segfault in __c_f_f_c during strace of nptl application.
Date: Sun, 21 Jun 2009 13:16:59 -0400 (EDT)
Message-ID: <20090621171701.3040B4EE8@hiauly1.hia.nrc.ca>
References: <119aab440906210918v7ff1420cvb1c45fcf518419f8@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440906210918v7ff1420cvb1c45fcf518419f8@mail.gmail.com> from "Carlos O'Donell" at Jun 21, 2009 12:18:16 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On Sun, Jun 21, 2009 at 11:20 AM, John David
> Anglin<dave@hiauly1.hia.nrc.ca> wrote:
> > We never figured out why the fault actually occurred (Kyle got busy).
> > It seems like there is a problem with the address mapping during signals.
> > However, there was some rebuilds in the above and I'm not sure the
> > analysis is correct. =A0However, I'm sure the problem isn't with
> > __canonicalize_funcptr_for_compare.
> 
> Hoccam's razor. It's a gcc bug.
> 
> The arg0 to __c_f_f_c is being clobbered by the previous call.
> Rearrangeing the if-the-else cases into a set if cases fixes the
> clobbering of arg0 and fixes strace.
> 
> The move of the fptr into r26 is moved before the call to umove, then
> umove clobbers r26, then __c_f_f_c is called and crashes.

This needs a GCC bug report.  It an important defect.  As usually,
preprocessed source is needed and compiler version.  The version of
strace in lenny/testing doesn't have any calls to __c_f_f_c.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
