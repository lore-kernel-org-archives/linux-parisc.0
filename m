Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5A4DE483D
	for <parisc-linux@lists.parisc-linux.org>; Wed,  9 Jul 2003 10:00:49 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 19aHNA-00054Q-KF; Wed, 09 Jul 2003 17:00:48 +0100
Date: Wed, 9 Jul 2003 17:00:48 +0100
From: Matthew Wilcox <willy@debian.org>
To: Mihails Nikitins <nikitins@latnet.lv>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Where to get  'undocumented drivers'
Message-ID: <20030709160048.GV1939@parcelfarce.linux.theplanet.co.uk>
References: <1057766264.3f0c3b7831046@clients.latnet.lv>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1057766264.3f0c3b7831046@clients.latnet.lv>
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

On Wed, Jul 09, 2003 at 06:57:44PM +0300, Mihails Nikitins wrote:
> Looks like I have small HP-PB LAN AUI card detected at boot time in my K210. 
> 
> 9. Miura LAN/Console (J2146A) (2) at 0xf190c000 [10/4/12], versions 0x4, 0x0,
> 0x52
> 
> I see this device working in many models but it's marked like 'undocumented'. 
> 
> Do I need the driver? Sorry, I have no idea how to configure it. I would also
> appreciate if you point me to a document about configuring new HW in Debian.

There is no documentation available for this device, so there is no
driver for it.  This means Linux cannot use this device.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
