From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [git patches] parisc fixes for 2.6.24
Date: Sun, 16 Dec 2007 13:48:03 -0500 (EST)
Message-ID: <200712161848.lBGIm4AS014428@hiauly1.hia.nrc.ca>
References: <20071216183215.GB8558@fattire.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: kyle@hera.kernel.org, linux-parisc@vger.kernel.org
To: kyle@mcmartin.ca (Kyle McMartin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20071216183215.GB8558@fattire.cabal.ca> from "Kyle McMartin" at Dec 16, 2007 01:32:15 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> is this using debian sid? or testing? possibly during the update to
> glibc 2.7 a regression crept in?

It's libc6 2.7-3.  I've remove nscd to see if this goes away.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
