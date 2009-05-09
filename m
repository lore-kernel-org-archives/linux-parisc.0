From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Fixed strace [ was Re: ls -l is broken ]
Date: Sat, 9 May 2009 17:40:34 -0400 (EDT)
Message-ID: <20090509214045.A7F3F4FB1@hiauly1.hia.nrc.ca>
References: <119aab440905091411gbb3b1bu7f6aa37e6fb35802@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: kyle@mcmartin.ca, matthew@wil.cx, linux-parisc@vger.kernel.org,
	debian-hppa@lists.debian.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-path: <bounce-debian-hppa=debian-hppa=m.gmane.org@lists.debian.org>
In-Reply-To: <119aab440905091411gbb3b1bu7f6aa37e6fb35802@mail.gmail.com> from "Carlos O'Donell" at May 9, 2009 05:11:22 pm
Resent-Message-ID: <86qLOnSgSlE.A.m_E.4wfBKB@liszt>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

> 
> On Sat, May 9, 2009 at 1:18 PM, John David Anglin
> <dave@hiauly1.hia.nrc.ca> wrote:
> > 0x402759ac <_dl_relocate_object+772>:   ldh,s r22(r17),r31
> > 0x402759b0 <_dl_relocate_object+776>:   ldw 170(r11),ret1
> > 0x402759b4 <_dl_relocate_object+780>:   cmpib,= 0,ret0,0x40275a64 <_dl_relocate_object+956>
> > 0x402759b8 <_dl_relocate_object+784>:   copy r11,r5
> > End of assembler dump.
> > (gdb) p/x $r11
> 
> Shouldn't you be using $r17 here?

Sorry, for the confusion.  I tried to demonstrate how $r17 was loaded
from memory starting from $r11.  You can see the load earlier in the
disassembly.  The values in $r22 and $r17 were consistent with the fault
address.  The value loaded from memory into $r17 was also consistent
with what was recorded in memory in the core dump.  It appeared to me
that only a single word was corrupted.

Unfortunately, gdb dropped core on the core file, so there's nothing
more that can be looked at.  This was caused by a malloc double free
error.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
