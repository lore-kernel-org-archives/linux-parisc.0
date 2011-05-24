From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [stable] PA-RISC: compile error in include/net/dst.h
Date: Tue, 24 May 2011 16:49:37 -0400 (EDT)
Message-ID: <20110524204938.856044DF4@hiauly1.hia.nrc.ca>
References: <1490722.55WlhWHEVK@donald.sf-tec.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: eike-kernel@sf-tec.de (Rolf Eike Beer)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1490722.55WlhWHEVK@donald.sf-tec.de> from "Rolf Eike Beer" at May 24, 2011 09:19:45 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> If you think of PR46915: I was the one that originally stumbled over this 
> although GM took the hard work of bisecting and reporting that upstream. As I 
> said before, the compiler is 4.5.2.

Yes, finding the cause of bugs is often a lot harder than fixing them.
I spent about a week debugging PR49007 and then it turned out the problem
was the same as PR40086 (one line fix to reorg.c).  Hopefully most reorg
bugs are now fixed as they are nasty.

Nominally, PR46915 was fixed in 4.5.3.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
