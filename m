From: m.delahaye@esiee.fr (Matthieu Delahaye)
Subject: Re: [parisc-linux] Re: [Linux-ia64] Linux, Itanium and PA/RISC
Date: Wed, 26 Mar 2003 13:09:19 +0100
Message-ID: <20030326120919.GA22782__25161.0748623081$1416622332$gmane$org@charrue.esiee.fr>
References: <001f01c2f1f1$e772d4b0$6620a4d5@tsatec.int> <20030324121037.GI31008@parcelfarce.linux.theplanet.co.uk> <15999.23084.647629.868320@napali.hpl.hp.com> <20030326100746.GA21703@charrue.esiee.fr> <20030326125140.6f2b7f7c.markus.schaber@student.uni-ulm.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Matthieu Delahaye <m.delahaye@esiee.fr>, davidm@hpl.hp.com,
	willy@debian.org, adriano@satec.es, linux-ia64@linuxia64.org,
	parisc-linux@parisc-linux.org
To: Markus Schaber <markus.schaber@student.uni-ulm.de>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <20030326125140.6f2b7f7c.markus.schaber@student.uni-ulm.de>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> You definitely need IA64 Linux to make real use of an Itanium2 Machine.
> (I was able to "play" on an HP 4-Way machine for some weeks.)

I wasn't speaking about real use. Just dirty things. I was also reacting
with David's previous mail.

> [...] 
> As far as I know, the PA-Risc instruction mapping is done with lots of
> software help. The concept is a bit like JIT-Compilers in Java. (It is
> easier to do this when having a RISC code with equal instruction length
> compared to ugly X86 code.) As long as my knowledge is correct, you
> therefore cannot run any PA-RISC OS directly on the Hardware, but you
> can run PA-RISC Software in any OS that supports the instruction
> mapping, maybe one can even run a PA-RISC OS inside a virtual PA-RISC
> Machine on Itaniums. (However I don't know any such VM.)

AFAIK, your knowledge correspond to what I know. Never test hppa
applications, but the intel compiler I had was using 32bits libraries. I
had to extract some of them for my PC to move them on the Itanium. 


So as I said before, I was reacting to David's mail explaining with some
firmware modifications it was possible to do this with an Itanium I,
and he wasn't sure for an Itanium II. Or it is urgent for me to find a
dictionnary. I just add to this (for the foolish who want to try) that
at least it is required to add the chipset support so that the
kernel can boot on Itanium II. That's all.

But please be sure I'm not going to try this unless I want to give to
my boss a good reason to put me out. 
[ This is not because some people reading this list and
working with me wants to test an hppa box resistance by launching it
from the 5th level I'll try to publish slackware installation
screenshots on an Itanium II ].

But perhaps I didn't understand and you told me you already try it
following David's explanation ?

Regards,

Matthieu
