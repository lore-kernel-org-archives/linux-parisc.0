From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: [parisc-linux] Another problem with making things static
Date: Sat, 10 Feb 2007 09:29:24 -0600
Message-ID: <1171121364.3373.19.camel__32312.7999007285$1416624279$gmane$org@mulgrave.il.steeleye.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="=-DjExUAYIiiSjCcuNYWoD"
Cc: Parisc List <parisc-linux@lists.parisc-linux.org>
To: Andrew Morton <akpm@osdl.org>,
 Linus Torvalds <torvalds@osdl.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


--=-DjExUAYIiiSjCcuNYWoD
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

We're going to need this one reverting for parisc.  If you remember
we've been trying to push a compat_sys_rt_sigqueueinfo but Andi keeps
objecting, so it's remained local to our tree (an hence so has the
symbol usage).

However, can we *please* stop this indiscriminate rampage through all
the sybsystems making things static just because we can.  The true test
of whether a symbol should be static or not is whether it forms part of
a sensible API or not.  For subsystems with a well defined API, this is
quite easy (although it hasn't prevented attempts to make even those
symbols static).  For some of our core subsystems (like the kernel API
in this case) it's much less well defined ... although we have a good
solid white area of things that must be part of the API and a good solid
black area of things that mustn't, we still have a large grey area which
things like kill_proc_info() fall into.

For any person who wants to make a static symbol exported, we force an
explanation out of them about what they're trying to do and why.  Might
I suggest we apply the same standard to anyone trying to make something
static?  i.e. they need to explain clearly why the symbol shouldn't be
part of any rational API.

Thanks,

James


--=-DjExUAYIiiSjCcuNYWoD
Content-Disposition: inline
Content-Description: Forwarded message - Re: [parisc-linux] 64-bit kernel
	broken.
Content-Type: message/rfc822

Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
X-Spam-Checker-Version: SpamAssassin 3.1.4 (2006-07-25) on
	hancock.sc.steeleye.com
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,
	FORGED_RCVD_HELO autolearn=ham version=3.1.4
Received: from orville.steeleye.com (orville.steeleye.com [71.30.118.242])
	by hancock.sc.steeleye.com (8.11.6/8.11.6) with ESMTP id l193Xdx00662
	for <james.bottomley@steeleye.com>; Thu, 8 Feb 2007 22:33:39 -0500
Received: from free.linux.hp.com (free.linux.hp.com [192.25.206.17]) by
	orville.steeleye.com (8.12.8/8.12.8) with ESMTP id l193Xd25004043 for
	<james.bottomley@steeleye.com>; Thu, 8 Feb 2007 22:33:39 -0500
Received: from localhost (localhost.localdomain [127.0.0.1]) by
	free.linux.hp.com (Postfix) with ESMTP id BE7E37DAB0; Thu,  8 Feb 2007
	20:33:38 -0700 (MST)
Received: from free.linux.hp.com ([127.0.0.1]) by localhost
	(free.linux.hp.com [127.0.0.1]) (amavisd-new, port 10024) with ESMTP id
	09287-05; Thu, 8 Feb 2007 20:33:38 -0700 (MST)
Received: from free.linux.hp.com (localhost.localdomain [127.0.0.1]) by
	free.linux.hp.com (Postfix) with ESMTP id 523D87DABC; Thu,  8 Feb 2007
	20:33:36 -0700 (MST)
X-Original-To: parisc-linux@lists.parisc-linux.org
Delivered-To: parisc-linux@lists.parisc-linux.org
Received: from localhost (localhost.localdomain [127.0.0.1]) by
	free.linux.hp.com (Postfix) with ESMTP id 9AFD57DABB for
	<parisc-linux@lists.parisc-linux.org>;
	Thu,  8 Feb 2007 20:33:34 -0700 (MST)
Received: from free.linux.hp.com ([127.0.0.1]) by localhost
	(free.linux.hp.com [127.0.0.1]) (amavisd-new, port 10024) with ESMTP id
	09287-02 for <parisc-linux@lists.parisc-linux.org>; Thu, 8 Feb 2007
	20:33:33 -0700 (MST)
Received: from stout.engsoc.carleton.ca (stout.engsoc.carleton.ca
	[134.117.69.22]) by free.linux.hp.com (Postfix) with ESMTP id
	E7FDF7DAB0 for <parisc-linux@lists.parisc-linux.org>;
	Thu,  8 Feb 2007 20:33:32 -0700 (MST)
Received: from localhost (stout [127.0.0.1]) by stout.engsoc.carleton.ca
	(Postfix) with ESMTP id 79EE95840A0;
	Thu,  8 Feb 2007 22:33:32 -0500 (EST)
Received: from fattire.cabal.ca (cabal.ca [134.117.69.58]) (using TLSv1
	with cipher DHE-RSA-AES256-SHA (256/256 bits)) (No client certificate
	requested) by stout.engsoc.carleton.ca (Postfix) with ESMTP id
	F25D758409F; Thu,  8 Feb 2007 22:33:31 -0500 (EST)
Received: from athena.road.mcmartin.ca (206-248-151-76.dsl.ncf.ca
	[206.248.151.76]) (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256
	bits)) (Client CN "roadwarrior.mcmartin.ca",
	Issuer "there.is.no.cabal.ca"
	(verified OK)) by fattire.cabal.ca (Postfix) with ESMTP id 9B2AB837DC;
	Thu, 8 Feb 2007 22:33:31 -0500 (EST)
Received: by athena.road.mcmartin.ca (Postfix, from userid 1000) id
	9FE7F3B06E; Thu,  8 Feb 2007 22:33:21 -0500 (EST)
Date: Thu, 8 Feb 2007 22:33:21 -0500
From: Kyle McMartin <kyle@mcmartin.ca>
To: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] 64-bit kernel broken.
Message-ID: <20070209033321.GC26780@athena.road.mcmartin.ca>
References: <119aab440702061420w2b5ab788g815313761f440bc9@mail.gmail.com>
	<20070209003302.GD18899@athena.road.mcmartin.ca>
	<20070209004314.GE18899@athena.road.mcmartin.ca>
	<20070209032454.GR13101@parisc-linux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20070209032454.GR13101@parisc-linux.org>
User-Agent: Mutt/1.5.13 (2006-08-11)
X-Virus-Scanned: by amavisd-new-20030616-p10 (Debian) at engsoc.carleton.ca
X-Virus-Scanned: by amavisd-new-20030616-p10 (Debian) at free.linux.hp.com
Cc: Kyle McMartin <kyle@mcmartin.ca>,
	parisc-linux <parisc-linux@lists.parisc-linux.org>
X-BeenThere: parisc-linux@lists.parisc-linux.org
X-Mailman-Version: 2.1.5
Precedence: list
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Sender: parisc-linux-bounces@lists.parisc-linux.org
Errors-To: parisc-linux-bounces@lists.parisc-linux.org
X-Virus-Scanned: by amavisd-new-20030616-p10 (Debian) at free.linux.hp.com
Content-Transfer-Encoding: 7bit

On Thu, Feb 08, 2007 at 08:24:54PM -0700, Matthew Wilcox wrote:
> On Thu, Feb 08, 2007 at 07:43:14PM -0500, Kyle McMartin wrote:
> > > Right. This got inadvertantly reverted with some other stuff. Fixed in a
> > > second.
> > 
> > Fixed in 1736b4bbf2bbfebaad06114d569f3617517524d1.
> 
> make.err:/home/willy/nicol-2.6/arch/parisc/kernel/signal32.c:519:
> warning: implicit declaration of function 'kill_proc_info'
> make.err:(.text.compat_sys_rt_sigqueueinfo+0x80): undefined reference to
> `kill_proc_info'
> 

Guess who came home for Christmas

commit d3228a887cae75ef2b8b1211c31c539bef5a5698
Author: Adrian Bunk <bunk@stusta.de>
Date:   Wed Dec 6 20:38:22 2006 -0800

    [PATCH] make kernel/signal.c:kill_proc_info() static

    Signed-off-by: Adrian Bunk <bunk@stusta.de>
    Signed-off-by: Andrew Morton <akpm@osdl.org>
    Signed-off-by: Linus Torvalds <torvalds@osdl.org>
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

--=-DjExUAYIiiSjCcuNYWoD
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--=-DjExUAYIiiSjCcuNYWoD--
