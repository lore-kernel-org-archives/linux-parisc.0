From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [PATCH] parisc: add ftrace (function and graph tracer) functionality
Date: Mon, 9 Feb 2009 21:10:30 -0500 (EST)
Message-ID: <20090210021101.2118F4EDA@hiauly1.hia.nrc.ca>
References: <498F6E28.7060209@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org, kyle@mcmartin.ca
To: deller@gmx.de (Helge Deller)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <498F6E28.7060209@gmx.de> from "Helge Deller" at Feb 9, 2009 00:43:36 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> It will currently only work with 64bit kernels, because the gcc options -pg
> and -ffunction-sections can't be enabled at the same time and -ffunction-sections
> is still needed to be able to link 32bit kernels.

I have done some testing.  As far as I can tell, -pg works with
-ffunction-sections on hppa-unknown-linux-gnu and hppa64-hp-hpux11.
hppa2.0w-hp-hpux11 doesn't support -ffunction-sections.  So, I think
we should propose that the code that disables -ffunction-sections
with -pg be removed.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
