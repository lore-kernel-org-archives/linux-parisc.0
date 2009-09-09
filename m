From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: Segfault in __c_f_f_c during strace of nptl application.
Date: Wed, 9 Sep 2009 10:39:30 -0400
Message-ID: <119aab440909090739s1f7af068s65bb4d389b626a4d@mail.gmail.com>
References: <119aab440906202327x7093bd81q93f3914fcf6c2c70@mail.gmail.com>
	 <20090621152031.04E4B4F19@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090621152031.04E4B4F19@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Jun 21, 2009 at 11:20 AM, John David
Anglin<dave@hiauly1.hia.nrc.ca> wrote:
> Looking at my email archive, I see the real cause involves kernel mem=
ory
> maps:
>
> =A0> > > On Wed, May 06, 2009 at 01:39:49PM -0400, John David Anglin =
wrote:
> =A0> > > > > The tombstone is:
> =A0> > > > >
> =A0> > > > > do_page_fault() pid=3D10205 command=3D'strace' type=3D15=
 address=3D0x407d2f18
> =A0> > > > > vm_start =3D 0x4068d000, vm_end =3D 0x4068f000
> =A0> > > >
> =A0> > > > So, the pointer passed to __canonicalize_funcptr_for_compa=
re is outside
> =A0> > > > the vm range.

The strace problem is a compiler flaw.

This is the problem:
* Strace examines the applications syscall.
* Strace extracts, via PTRACE, application addresses, addresses that
don't exist in the strace address space (and should not exist).
* Strace compares extracted address to a constant SIG_ERR.
* Compiler generates a call to __c_f_f_c, which dereference the
extracted address and strace faults.

Strace and the application have completely different address spaces,
and __c_f_f_c can't assume that an address is in the current address
space.

The solution is to detect that a comparison between two pointers is a
comparison between pointer and small constant, and avoid calling
__c_f_f_c for both.

The workaround is to cast both long. I tested this and it works. I'll
submit this to debian as the fix.

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
