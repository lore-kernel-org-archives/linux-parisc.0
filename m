From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: ls -l is broken
Date: Wed, 16 Apr 2008 13:15:52 -0400 (EDT)
Message-ID: <20080416171553.39A0B4DF2@hiauly1.hia.nrc.ca>
References: <20080416142750.GD27875@phobos.i.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: kyle@mcmartin.ca, matthew@wil.cx, linux-parisc@vger.kernel.org
To: kyle@mcmartin.ca (Kyle McMartin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080416142750.GD27875@phobos.i.cabal.ca> from "Kyle McMartin" at Apr 16, 2008 10:27:50 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> Nevermind, it's failing because you don't have XATTRs enabled on ext3.

That sounds right.  I remember now that there's also an issue with
ls --full-time support on some file systems.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
