Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hancock.sc.steeleye.com (nat9.steeleye.com [65.114.3.137])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4D502482D
	for <parisc-linux@lists.parisc-linux.org>; Wed, 13 Aug 2003 16:53:35 -0600 (MDT)
Received: from [172.17.6.40] (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id h7DMrXI13417;
	Wed, 13 Aug 2003 18:53:33 -0400
Subject: Re: [parisc-linux] xfree86 4.2.1-9 build problem
From: James Bottomley <James.Bottomley@steeleye.com>
To: Grant Grundler <grundler@parisc-linux.org>
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
In-Reply-To: <20030813213204.GA26014@dsl2.external.hp.com>
References: <20030811043457.GA5653@dsl2.external.hp.com>
	<20030813175340.GF18794@dsl2.external.hp.com>
	<1060805514.2011.1.camel@fuzzy>
	<20030813213204.GA26014@dsl2.external.hp.com>
Content-Type: text/plain
Date: 13 Aug 2003 17:53:33 -0500
Message-Id: <1060815215.1987.2.camel@fuzzy>
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

On Wed, 2003-08-13 at 16:32, Grant Grundler wrote:
> if I can just figure out what's botching the colors for xchat2 now...

Is this with one of the Visualize cards?  They only do 8bpp at all
resolutions, so if you run a colourful window manager, you run out
pretty quickly.  Even using the default fvwm, I had to run xpdf with a
private colourmap (-cmap option) to get my slides to show up as anything
like reasonable).

A lot of modern applications (particularly of the kde or gnome variety)
pay absolutely no attention to potential colour map limitations and can
blithely request more colours than you have available (and sometimes not
even check for failure returns).

James
