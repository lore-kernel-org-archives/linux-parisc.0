Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: "M. Grabert" <xam@cs.ucc.ie>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] some bugs 
In-Reply-To: Message from "M. Grabert" <xam@cs.ucc.ie>
   of "Wed, 10 Apr 2002 15:35:06 BST." <Pine.LNX.4.44.0204101509020.1717-100000@sal.ucc.ie>
References: <Pine.LNX.4.44.0204101509020.1717-100000@sal.ucc.ie> 
Date: Wed, 10 Apr 2002 09:58:40 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020410155841.19DE2482A@dsl2.external.hp.com>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

"M. Grabert" wrote:
> But perhaps it's only a h/w issue (incompatibility with switch and
> network card?).

Possibly. Perhaps just unplugging the cable, wait 5 seconds (or so)
and plug it back in should force a re-negotiation. Not a great work
around but perhaps a start.

...
> Well, yes, maybe, because it's 'mount' specific. But why is it working
> with the 32bit kernel? I thought this kind of things should be
> platform-independent ...

I agree - I doubt this is a mount command problem.
It might be an issue with our 32-bit syscall wrappers in the 64-bit kernels.

> - crashme is effective (example settings, after a few minutes kernel
> crashed, even MagicSysRq didn't work. It didn't seem to 'work' on
> 2.4.18-pa5-32bit, I didn't try with the 2.4.18-pa14-32bit kernel)

crashme support requires someone with good CPU knowledge to chase
down the holes in the kernel trap handler. It's just not a priority
for anyone I know unfortunately. I'd rather see said person work
on improving fork/exec performance and other lmbench results
where parisc-linux lags horribly. However, if someone wants to
learn more about the space where PARISC implementations diverge
from the architecture, making crashme "run" is a challenging
place to start.

> BTW, one question:
> 
> I always wondered if sid (unstable) is the preferred dist for
> debian/hppa (very likely a debian-mailing-list question, but what
> do you kernel hackers and developers use and prefer?)

I use both depending on the role of the machine.
At home, I'm running sid so I can play frozen-bubble (just kidding,
it's not ported to hppa yet). At work, machines I've setup are
running woody since I want to "test" how well the release is doing
that we will be recommending to non-developers.

Occasionally, sid has "hickups", nothing I haven't been able
to recovery from though it entirely possible trash the machine
(eg bad libc deb). Save those older .debs in /var/cache/apt/archives.

grant
