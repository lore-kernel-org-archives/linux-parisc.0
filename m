Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6C70B482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  8 Apr 2002 08:56:46 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16uaZY-0005ED-00; Mon, 08 Apr 2002 15:56:44 +0100
Date: Mon, 8 Apr 2002 15:56:44 +0100
From: Matthew Wilcox <willy@debian.org>
To: Ahbaid Gaffoor <ahbaidg@attbi.com>
Cc: parisc <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] K220 - Setup via. Console
Message-ID: <20020408155644.F27547@parcelfarce.linux.theplanet.co.uk>
References: <3CB12C3E.B6FB23DB@attbi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3CB12C3E.B6FB23DB@attbi.com>; from ahbaidg@attbi.com on Sun, Apr 07, 2002 at 10:35:58PM -0700
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

On Sun, Apr 07, 2002 at 10:35:58PM -0700, Ahbaid Gaffoor wrote:
> I have a K220. I'd like to install the latest release of PA-RISC Linux
> on it but I need to first of all be able to console into it.

You'll have trouble when it does come up -- we don't have proper console
support yet.

> I am trying to use the console cable I have used with Sun boxes on this
> machine, however I just cannot get it to work? My terminal emulation is
> done via HyperTerminal on a laptopb via. COM1

I think Sun have their own strange pinout whereas HP use a standard
null-modem cable.

> What seeting do I need on my terminal emulator? Or is there some jumper
> I have to set to allow this to work? Currently I use 9600 8N1, I also
> tried 7E1 but still no luck...

9600 8N1, no hardware or software flow control is the right setting to
get firmware to talk to you.

By the way, we don't have a K220 in the hwdb yet; the closest we have is
a K210.  Please go to http://hwdb.parisc-linux.org/add.php3?type=machine
and follow the instructions.

We hope to have support for the console on the K-class later this year...

-- 
Revolutions do not require corporate support.
