Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 99FEA483E
	for <parisc-linux@lists.parisc-linux.org>; Sat,  3 May 2003 22:17:17 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 19CAw7-0001Os-M9; Sun, 04 May 2003 05:17:15 +0100
Date: Sun, 4 May 2003 05:17:15 +0100
From: Matthew Wilcox <willy@debian.org>
To: Tom <tom@alaskatech.org>
Cc: PARisc-Linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] {kinda OT] A4947A applicability? and FC driver work
Message-ID: <20030504041715.GH31610@parcelfarce.linux.theplanet.co.uk>
References: <1052020498.27841.7.camel@daily>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1052020498.27841.7.camel@daily>
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

On Sat, May 03, 2003 at 07:54:57PM -0800, Tom wrote:
> I found one of these kits on eBay - C200 to C240 upgrade, CPU on
> mainboard. Do any of the HP techs around here know if it'll also fit a
> C180? It'd be nice to drop a large performance upgrade into it for not
> much cash...

Well... it'll _fit_.  Whether firmware will work properly is anyone's
guess.  There's various differences between the C180 and C200 that
make this combination not sure to succeed.  My personal opinion (and
not speaking on behalf of my emplyer) is that it's going to work 90%.
Maybe the onboard scsi controller won't be initialised properly.
Maybe the missing bit of init won't make any difference to Linux or
maybe it'll start corrupting data.  It's a bit of a gamble.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
