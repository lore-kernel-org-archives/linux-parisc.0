Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hancock.sc.steeleye.com (nat9.steeleye.com [65.114.3.137])
	by dsl2.external.hp.com (Postfix) with ESMTP id C30F048DC
	for <parisc-linux@lists.parisc-linux.org>; Fri, 15 Aug 2003 12:24:01 -0600 (MDT)
Received: from mulgrave-w.il.steeleye.com (il-ppp.sc.steeleye.com [172.17.6.240])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id h7FIJjI32586;
	Fri, 15 Aug 2003 14:19:46 -0400
Subject: Re: xchat colors (Was Re:  [parisc-linux] xfree86 4.2.1-9 build
	problem)
From: James Bottomley <James.Bottomley@steeleye.com>
To: Grant Grundler <grundler@parisc-linux.org>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>,
	PARISC list <parisc-linux@lists.parisc-linux.org>
In-Reply-To: <20030815172142.GA19042@dsl2.external.hp.com>
References: <W9958529574305441060899998@webmail4>
	<20030815172142.GA19042@dsl2.external.hp.com>
Content-Type: text/plain
Date: 15 Aug 2003 13:19:45 -0500
Message-Id: <1060971586.2322.213.camel@fuzzy>
Mime-Version: 1.0
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

On Fri, 2003-08-15 at 12:21, Grant Grundler wrote:
> On Thu, Aug 14, 2003 at 10:26:38PM +0000, caslivkoff@speakeasy.net wrote:
> > Just to be sure this is indeed a colormap issue,
> 
> Ok - it's a color map issue.
> I added some printf's to xchat-2.0.3/fe-gtk/palette.c:palette_alloc().
> 
> I'll see how hard it is to teach xchat to use it's own color map.

Perhaps take Alan's suggestion instead...give the framebuffer a Direct
or True Colour visual instead of Pseudocolour.

That will look rather strange because you'll only get two or three bits
for each primary, but it will mean that you can't run out of colours.

I'll see if I can figure out how to set this up...the documentation
appears to be a bit sparse [unless Alan has any hints].

James
