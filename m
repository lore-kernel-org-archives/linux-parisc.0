Return-Path: <hppa-linux@puffingroup.com>
Date: Mon, 8 Feb 1999 15:43:35 -0800 (PST)
From: Jason Eckhardt <jason@equator.com>
Message-Id: <199902082343.PAA27618@gatekeeper.equator.com>
To: helgaas@rsn.hp.com, hppa-linux@puffingroup.com
Subject: Re: [hppa-linux] Cross compile setup
Resent-Message-ID: <"snEJN1.0.222.l5vls"@burrow.puffingroup.com>
Reply-To: hppa-linux@puffingroup.com
List-Id: linux-parisc.vger.kernel.org


>
> Since PDC resides in a ROM, I assume you're talking about building
> something analogous to ISL, which resides in a LIF filesystem (see lif(4))
> ...
> I don't know how much of the boot process you want to replace, but if
> you're willing to use the HP-UX ISL and HPUX, at least to get started,
> you can fairly easily get things set up to boot your kernel over the net.

  Yes, my intention is to build a simple IPL for HPPA/Linux. It is a good
  idea to utilize the HP ISL to get started, but eventually I think we should
  not rely on any HP code. That way, people can "cold install" HPPA/Linux
  on a fresh disk and never worry about seeing or using any HPUX ugliness.

  In any case, until I get an IPL working, we can get a lot of work done with
  HPUX ISL as you mentioned.
 
  Jason.

----------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@puffingroup.com with
`unsubscribe' as the subject.
