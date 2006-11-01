From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [parisc-linux] [RFC] vdso for parisc-linux
Date: Wed, 1 Nov 2006 10:04:39 -0500
Message-ID: <119aab440611010704h2746644bu64d742424a89e030@mail.gmail.com>
References: <4544A34A.6080700@tausq.org>
	<119aab440610300825l4cfd056fi21738f63f3d99d72@mail.gmail.com>
	<4546E861.9050909@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "Randolph Chung" <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4546E861.9050909@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 10/31/06, Randolph Chung <randolph@tausq.org> wrote:
> > atomic ops are *not* prime candidates for vDSO's, I was wrong about
> > this. There are special requirements for the atomic operations which
> > require access to kernel locks, no scheduling, and no signals.  All of
> > these are impossible to do if gdb can write to code, thus we put the
> > atomic ops on the gateway page (which has the aforementioned special
> > properties).
>
> i can't quite see how lws disables scheduling... maybe you can enlighten
> me :)


> Well, there are two parts:
> 1) Finding "sigreturn"
> 2) Finding the system state on the stack
>
> Right now this is all done on parisc-linux by poking in memory using
> magic constants.
>
> On HPUX, #1 is available symbolically, but #2 still requires poking in
> memory using magic constants. It is particularly nasty on HPUX because
> the kernel can store state in either narrow or wide mode and the offsets
> are not fixed.

On parisc-linux there is *always* a 32-bit system state on the stack.
If you have a 64-bit kernel there is an auxiliary section which
contains the register top-halves. I think we can conjure up some magic
to determine which structure is on the stack.

> > What testing do we need to do before you check this into git?
>
> What I have is just infrastructure, we need to add some functionality
> into it :)

Yes, but if it gets checked into git it makes it easier to keep it
from bitrotting.
With your HK timezone it makes coordinating more difficult.

Cheers,
Carlos.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
