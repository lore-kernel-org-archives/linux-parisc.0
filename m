Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 20A934829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 30 Jun 2003 11:58:13 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 19X2up-0003L8-LG; Mon, 30 Jun 2003 18:58:11 +0100
Date: Mon, 30 Jun 2003 18:58:11 +0100
From: Matthew Wilcox <willy@debian.org>
To: Dub <dub@latnet.lv>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] modprobe: Can't locate module char-major-60 (server hangs!)
Message-ID: <20030630175811.GK31618@parcelfarce.linux.theplanet.co.uk>
References: <1056995678.3f00795e49bf5@clients.latnet.lv>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1056995678.3f00795e49bf5@clients.latnet.lv>
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

On Mon, Jun 30, 2003 at 08:54:38PM +0300, Dub wrote:
> Jun 27 15:08:47 smsmail4 modprobe: modprobe: Can't locate module char-major-60

ttyB0 has the wrong major number.  It needs to be character major 11.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
