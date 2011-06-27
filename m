From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: IFUNC* support?
Date: Sun, 26 Jun 2011 20:08:33 -0400 (EDT)
Message-ID: <20110627000834.7619B4FCB@hiauly1.hia.nrc.ca>
References: <BANLkTinZNXmV_Vw8rSL04H+wAGruzDspbA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org, dave.anglin@nrc.ca
To: carlos@systemhalted.org (Carlos O'Donell)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BANLkTinZNXmV_Vw8rSL04H+wAGruzDspbA@mail.gmail.com> from "Carlos O'Donell" at Jun 26, 2011 03:53:10 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> Have you played with any of the indirect function support in the tools yet?
> 
> Recent changes by Dave Miller have forced me to look into supporting IFUNC*.
> 
> It looks relatively easy, I was just wondering if there was anything I
> should watch out for on the compiler side?

I'm not familiar with this.  I did a quick scan and it doesn't seem
that any GCC backends do anything special wrt IFUNC_ASM_TYPE.  There
is an ifunc attribute which is used to mark a function with the
STT_GNU_IFUNC symbol type.  So, I think support is mainly in binutils.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
