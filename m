Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from tyke.pjc.net (public1-leed3-6-cust7.leed.broadband.ntl.com [80.7.68.7])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2205F4837
	for <parisc-linux@parisc-linux.org>; Fri, 11 Oct 2002 03:40:50 -0600 (MDT)
Received: from patrick by tyke.pjc.net with local (Exim 3.36 #1 (Debian))
	id 17zwHm-0004gG-00
	for <parisc-linux@parisc-linux.org>; Fri, 11 Oct 2002 10:40:46 +0100
Date: Fri, 11 Oct 2002 10:40:46 +0100
From: Patrick Caulfield <patrick@tykepenguin.com>
To: parisc-linux <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] hardware features of 712-60 ?
Message-ID: <20021011094046.GC1238@tykepenguin.com>
References: <02Oct11.113022cest.119055@ns.hiscom.nl> <Pine.LNX.4.21.0210111227030.24681-100000@hal.pp.fishpool.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
In-Reply-To: <Pine.LNX.4.21.0210111227030.24681-100000@hal.pp.fishpool.fi>
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

On Fri, Oct 11, 2002 at 12:34:43PM +0300, Martin-?ric Racine wrote:
> On Fri, 11 Oct 2002, "Beerse, Corn?" wrote:
> 
> > 
> > Have you checked the hardware database on the website?
> > (http://www.parisc-linux.org/) That gives an overview on what whas in the
> > origional box.
> 
> http://hwdb.parisc-linux.org/view.php3?type=machine&name=712%2F60
> 
> That page could have been written in Chinese, it would have been equally clear.  
> 
> I guess I'm just used to PC hardware, where kernel compiling simply means "if
> you have graphics card XXX select the driver with the same name". I've yet to
> find that simplicity in HP hardware, probably because everything is done via
> custom chips that combine several functions, and it is not clear to me which
> chip does what, as every line in that page starts with Gecko.

The thing is, it should be simpler than a PC because HP hardware (similar to
most large manufacturers) is pretty standard for any particular machine.

I suppose what you really want is a template .config for each type of machine
available from that page and a user just drops it in place and build a kernel
for it. If you stick other cards in the machine then it's up to you to figure
out the kernel options.

I'll volunteer one for a C110 :-)

patrick
