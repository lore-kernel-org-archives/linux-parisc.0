Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 580C5483E
	for <parisc-linux@lists.parisc-linux.org>; Tue, 11 Nov 2003 10:49:44 -0700 (MST)
Message-Id: <200311111749.hABHngZF008939@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] framebuffer drawing incorrectly ?
To: vapier@gentoo.org
Date: Tue, 11 Nov 2003 12:49:42 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <200311111156.58637.vapier@gentoo.org> from "Mike Frysinger" at Nov 11, 2003 11:56:47 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> On Tuesday 11 November 2003 11:27, Joel Soete wrote:
> > well I don't know exactely what is realy makes and I presume that you
> > already test without (commented) those lines?
> 
> well the fb is messed up w/out X ... i just mentioned X because thats the r=
> eal=20
> reason i'm messing around with it ;)
> and yes, the viewport settings make no difference

The X config and the mode setting for the card have to match.  You
probably have the card in double buffered mode.  This isn't compatible
with the frame buffer driver.  The selected resolutions also have to match.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
