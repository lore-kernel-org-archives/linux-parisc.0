Return-Path: <James.Bottomley@SteelEye.com>
Received: from hancock.sc.steeleye.com (stat1.steeleye.com [65.114.3.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id E56A648A0
	for <parisc-linux@parisc-linux.org>;
	Mon, 12 Apr 2004 08:19:34 -0600 (MDT)
Received: from midgard.sc.steeleye.com (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	i3CEJSa20979; Mon, 12 Apr 2004 10:19:28 -0400
Subject: Re: [parisc-linux] Re: if something is not done, hppa will not have
	an installer for sarge
From: James Bottomley <James.Bottomley@steeleye.com>
To: Richard Hirst <rhirst@linuxcare.com>
In-Reply-To: <20040412111257.GS20209@linuxcare.com>
References: <20040411165459.GB11699@kitenet.net>
	<20040411171831.GA15032@mcmartin.ca>
	<20040411174629.GA12562@kitenet.net>
	<20040412111257.GS20209@linuxcare.com>
Content-Type: text/plain
Date: 12 Apr 2004 09:19:27 -0500
Message-Id: <1081779569.1804.11.camel@mulgrave>
Mime-Version: 1.0
Cc: Kyle McMartin <kyle@mcmartin.ca>, debian-boot@lists.debian.org,
	parisc-linux@parisc-linux.org, debian-hppa@lists.debian.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Mon, 2004-04-12 at 06:12, Richard Hirst wrote:
> It may be relevant that the ISO had a rather long kernel commandline,
> relative to the 127 char limit that palo claims.  I'm never sure
> whether that 127 char limit is before or after palo adds all the
> console and sti related parameters though.

That limit is absolute and may not be overrun.  The co-ordinates of the
64 bit kernel lie immediately after the 128 char buffer.  Usually the
system is unbootable if you overrun this limit.

Unfortunately, palo is rather poor about checking this limit when
installing the image or modifying the command line...

James
