Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (unknown [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id AE655482E
	for <parisc-linux@lists.parisc-linux.org>; Mon, 19 Nov 2001 06:10:27 -0700 (MST)
Subject: Re: [parisc-linux] 755/125 problems
From: Ryan Bradetich <ryan_bradetich@uswest.net>
To: Aaron Macks <aaronm@cs.brandeis.edu.ml.to>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <a05100316b81d8d1c41f3@[129.64.46.46]>
References: <a05100316b81d8d1c41f3@[129.64.46.46]>
Content-Type: text/plain
Date: 18 Nov 2001 11:24:53 -0700
Message-Id: <1006107893.4898.5.camel@beavis>
Mime-Version: 1.0
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

On Sun, 2001-11-18 at 09:11, Aaron Macks wrote:
> So I finally have a viable system in the form of a 755/125(384mb ram, 
> internal FWscsi drive and 2 atm cards).  I can get it to boot under 
> the HPUX still installed on the HD, and it seems to work(not root 
> pw).  I tried booting it off the internal CD with the 0.92 disc and 
> it seemed to freeze at the 'Branching to kernel address .....".

> Three questions:
> Is this common or an oddity with my system?
The 755 (and 735) are only partially supported at this time.  The
fast-wide disks are behind an outfield card which is not supported yet,
so you can not use the FW disks.  It has been a long time since I
installed the 0.9.2 iso, but I have tested tested the rc1 of the
upcoming 0.9.3 iso on the 755 and it installed fine :)

> It currently only allows a net boot off of the ATM cards, either the 
> EISA or the slider.  How can I force it to use the onboard 10 base 
> T(AUI) or even 10 Base 2?

I have not run into this one yet, and I did a network install of the 755
using the built-in 10 base-T. I will see if I can find an additional
EISA network card to add to the machine and see if I can duplicate your
problem.

> The other might be slightly off topic, but is there an easy way to 
> reset the root pw on the HPUX install?(I believe I have HPUX install 
> media somewhere but I'm probably wrong.)

yeah, boot into the hpux isl menu:
	boot pri isl

when in the isl menu
	hpux -is

will put you in single user mode where you can change the root passwd.

- Ryan

> Aaron
> -- 
> _______________________________________________________
> Aaron Macks(aaronm@cs.brandeis.edu)
> My sheep has seven gall bladders, that makes me the King of the Universe!
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
