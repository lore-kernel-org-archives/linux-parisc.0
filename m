Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Yasholomew Yashinski <yashy@mail.yashy.com>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: Message from Yasholomew Yashinski <yashy@mail.yashy.com>
   of "Tue, 24 Sep 2002 20:32:34 EDT." <20020924202029.B46819-100000@mail.yashy.com>
References: <20020924202029.B46819-100000@mail.yashy.com> 
Date: Tue, 24 Sep 2002 21:43:29 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020925034329.D56EA4829@dsl2.external.hp.com>
Subject: [parisc-linux] Re: B1000
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

Yasholomew Yashinski wrote:
>  Heya Gents,
> 
>  I hope all is well. I see that Debian 3 is available now for hppa, so I
> recently burnt it to try on my B1000. I went to install it tonight,
> however it's rebooting with:
> 
> High Priority Machine Check (HPMC): Code=1 regs=102f3080 (Addr=000000000)
> 
> and on the LCD: FLT CBFB4

FLT CBFB4 is HPMC. Odd that it dies with an HPMC.

Can you send "ser pim" output to parisc-linux mailing list?
(hint: setup serial console to capture that)

And can you try one of the more recent net install ISO's from ESIEE?
See www.parisc-linux.org front page for links to ESIEE downloads.

>  as soon as it hits Init/BusyBox. Am I to assume the A4977a Vis EG-PCI is
> still unsupported? If so, any idea when it will be supported? If it is now
> supported, any idea what needs to change on my end?

Vis-EG PCI is supported and working as a Frame buffer.
That's known to work on B180/C200/B2600/C3000 and probably a few others.

grant
