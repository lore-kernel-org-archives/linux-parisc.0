Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hauptpostamt.charite.de (hauptpostamt.charite.de [193.175.66.220])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6A21D483B
	for <parisc-linux@lists.parisc-linux.org>; Sun, 14 Jul 2002 02:12:43 -0600 (MDT)
Received: from postamt1.charite.de (postamt1.charite.de [193.175.66.246])
	by hauptpostamt.charite.de (Postfix) with ESMTP id 4353F15C00E
	for <parisc-linux@lists.parisc-linux.org>; Sun, 14 Jul 2002 10:12:41 +0200 (CEST)
Date: Sun, 14 Jul 2002 10:12:41 +0200
From: Ralf Hildebrandt <Ralf.Hildebrandt@charite.de>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] STI framebuffer and PINE
Message-ID: <20020714081241.GC14636@charite.de>
References: <20020714065104.DF333484C@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020714065104.DF333484C@dsl2.external.hp.com>
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

On Sun, Jul 14, 2002 at 09:52:30AM +0300, Stephan Trajkoff wrote:

> STI GSC/PCI graphics driver version 0.9
> STI word mode ROM at f0060000, hpa at f4000000
> STI id 2b4ded6d-40a00499, conforms to spec rev. 8.04
> STI device: HPA208LC1280
> Console: switching to colour frame buffer device 160x64
> fb0: stifb 1280x1024-8 frame buffer device, id: 2b4ded6d, mmio: 
> 0xf4100000
> I have this shit, can anyone help me to run XFREE in 15,16,24 or 32 
> bit color?
> my HP is 819/K210

Are you sure the framebuffer can run at more colors?
I don't find this on http://docs.hp.com/hpux/hw/ !

> Another problem how I can run PINE?
> I have downloaded with apt-get pine 4.44

apt-get install pine

but pine is junk anyway. Try mutt.

> ./build lnx and ./build slx don't work

What is this?

> there is an error in PINE

Then report it using

reportbug pine

> before compiling pine, I did apt-get dist-upgrade

You compiled pine? I though you used apt-get?!

-- 
Ralf Hildebrandt (Im Auftrag des Referat V A)   Ralf.Hildebrandt@charite.de
Charite Campus Virchow-Klinikum                 Tel.  +49 (0)30-450 570-155
Referat V A - Kommunikationsnetze -             Fax.  +49 (0)30-450 570-916
If JavaScript is walking alone late at night through a bad part of
town with a pocket full of $20 bills, ActiveX is dropping your
trousers in the middle of the yard of a maximum-security prison,
bending over, and yelling 'Come and get it, boys!' 
