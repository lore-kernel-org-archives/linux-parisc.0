Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from tentakel.fischlustig.de (pD9001DC4.dip.t-dialin.net [217.0.29.196])
	by dsl2.external.hp.com (Postfix) with ESMTP id 534FD482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  1 Feb 2002 02:28:03 -0700 (MST)
Subject: Re: [parisc-linux] Graphics support
From: andi <andi@fischlustig.de>
To: Jbit of Plasma <james_a_n_lee@yahoo.com>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <3C5A3139.20006@yahoo.com>
References: 
	<3765AD6E3C88D211A92400A0C9A4F70E0119D735@lawrence.psl-dist.co.uk>
	<20020131180403.86D6F482A@dsl2.external.hp.com>  <3C5A3139.20006@yahoo.com>
Date: 01 Feb 2002 10:24:52 +0100
Message-Id: <1012555492.683.7.camel@cube>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
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

> Sorry to ask, but I couldn't seem to find any docs on it, whats "Colour recovery"?

Color recovery is a strange but cool 8bit truecolor technology. Data is
dithered to the framebuffer in a special way (there is a recommented
alogorithm provided by HP). Then the hardware de-dithers it and you
really see millions of different colors on the screen. Using X11 the
application needs to support it (ImageMagick is the only one I know).

NextStep 3.3 supports color recovery globally and the applications do
not need to have special support, it just works and looks nearly like
true color.

The advantage is that you can save video ram and blitting is very fast
because of the small amount of data.


andi
