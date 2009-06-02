From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [Fwd: HPPA and Squeeze]
Date: Tue, 2 Jun 2009 19:39:19 -0400 (EDT)
Message-ID: <20090602233919.88F4D4EDA@hiauly1.hia.nrc.ca>
References: <4A2589FF.90903@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: deller@gmx.de (Helge Deller)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4A2589FF.90903@gmx.de> from "Helge Deller" at Jun 2, 2009 10:22:23 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

I have to say this is sad but not expected.  It not really possible
to support an architecture without the support of its manufacturer.
HP hasn't provide any PA-RISC support beyond a few test machines for
a few years.

>From what I read on the debian list, the decision was the result of an
unstable kernel (build infrastructure) and the lack of a functional java
port (gcj is considered inadequate and broken).  It was taken even though
Carlos has submitted the patches to transition to NPTL in glibc 2.10.
The links in Neil McGovern message don't provide the actual rational.

Software is always buggy to some extent.  In the the past, when debian
developers reported problems/bugs to the relevant lists, the problems
have generally been resolved.  I haven't seen this happening to the same
extent recently.  So, it's not surprising to me that debian ports are
being lost.

As a user of Squeeze, I haven't experienced any major problems.  Thus,
I am disappointed that it is going to be removed for HPPA.

Dave

> FYI - Helge
> 
> -------- Original Message --------
> Subject: HPPA and Squeeze
> Resent-Date: Tue,  2 Jun 2009 14:39:10 +0000 (UTC)
> Resent-From: debian-hppa@lists.debian.org
> Date: Tue, 2 Jun 2009 15:07:35 +0100
> From: Neil McGovern <neilm@debian.org>
> To: HPPA porters <debian-hppa@lists.debian.org>
> CC: admin@debian-ports.org
> 
> Hi,
> 
> As mentioned previously[0], the release team haven't been happy with the
> state of the HPPA port in Debian. After the release team meeting[1], it
> has been decided that unfortunatly HPPA will not be supported for
> Squeeze. This was after careful consideration, and wasn't an easy
> decision.
> 
> This means that ftpmasters will be asked to remove HPPA from testing and
> unstable from the 30th June. It is suggested that HPPA porters may wish
> to consider using debian-ports.org if they wish to continue with the
> port.
> 
> Regards,
> Neil McGovern
> 
> [0] http://lists.debian.org/debian-release/2009/04/msg00299.html
> [1] http://lists.debian.org/debian-project/2009/05/msg00080.html
> -- 
> < MadCoder> and right now I'm wearing a tutu and am doing dance steps
> < Maulkin> I'm scared by the French cabal in tutus.
> < HE> The french cabal doesn't need tutus to scare me.
> < HE> They have combined computing power (see lucas) with pure madness (see Joss)
> 
> 
> -- 
> To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
> with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 


-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
