Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtpzilla5.xs4all.nl (smtpzilla5.xs4all.nl [194.109.127.141])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1D782482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 11 Oct 2001 12:56:18 -0600 (MDT)
Received: from rivierenland.xs4all.nl (rivierenland.xs4all.nl [194.109.14.47])
	by smtpzilla5.xs4all.nl (8.12.0/8.12.0) with ESMTP id f9BIuLav083640
	for <parisc-linux@lists.parisc-linux.org>; Thu, 11 Oct 2001 20:56:21 +0200 (CEST)
From: thunder7@xs4all.nl
Date: Thu, 11 Oct 2001 20:56:09 +0200
To: "Witvliet, Hans" <Hans.Witvliet@Alcatel.nl>
Cc: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] FW: SKB errors
Message-ID: <20011011205609.A13259@middle.of.nowhere>
Reply-To: thunder7@xs4all.nl
References: <1A8904C3797ED411AC2E0008C7E6F88117C9E8@nlntmail2b.ats.nld.alcatel.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1A8904C3797ED411AC2E0008C7E6F88117C9E8@nlntmail2b.ats.nld.alcatel.nl>
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Oct 09, 2001 at 07:53:07AM +0200, Witvliet, Hans wrote:
> Hi All,
> 
> Yesterday I received a (old but unused) 712/100 and tried to install the
> latest cd (0.9.2)
> 
> All went reasonably well but after some time I got a very annoying lot of
> error messages:
> 
> ip_local_deliver: bad loopback SKB PRE_ROUTING LOCAL_IN
> SKB: pf=2 (unowned) dev=lo len=328
> Proto=17 0.0.0.0:68 255.255.255.255:67 L=328 S=0x10 I=0 F=0x0000 T=16
> 
> These three lines appear every minute or so.
> 
> So I have a couple of questions:
> 1)	What's going on? it seems that the device driver for the loopback
> interface has a problem with its (linked-list) buffers

this has something to do with the dhcp-client, that is started
erroneously.

> 
> 2)	How to get rid of it? switching consoles is no use: they haunt me
> everywhere ;-)

killall dhcp to stop it now, then rm /etc/rc?.d/*dhcp* to stop it after
the next reboot.

There is something to be said for downloading or using the archives of
this mailing-list, they provide a wealth of information :-)

Good luck,
Jurriaan
-- 
As of next week, passwords will be entered in Morse code.
GNU/Linux 2.4.10-ac10 SMP/ReiserFS 2x1402 bogomips load av: 0.01 0.09 0.06
