Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Message-ID: <A4A5E4C468B5D11190220001FA6835DD04DD892B@EPIXCH003>
From: =?iso-8859-1?Q?SOETE_Jo=EBl?= <JSO@EUROPAY.COM>
To: "'puffin-t@esiee.net'" <puffin-t@esiee.net>
Cc: parisc-linux@lists.parisc-linux.org,
	parisc-linux-announce@lists.parisc-linux.org
Date: Wed, 16 May 2001 20:05:56 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] 0.6.1 isos
List-ID: <linux-parisc.vger.kernel.org>

Dear all,

Nice job regarding STI release (I just test it for now). The problem I met
with install-config with 0.6 CD seems to be solved: great :)

Just to mentioned that the preinstall of whiptail and modconf was not happy.
I just try to install debhelper which request lynx. And the install of lynx
loop because of frontend and whiptail. As work around I removed those
packages (replace with dialog). It works (without and with dialog).

I also try vmlinux712+son+mouse.
It runs but STI console was not initialize?
I would like to help more about this but I never find the right .config file
to recompile the right cvs linux which works properly with STI console of my
B180 (as do so well your kernel)(I already test all tips of the mailing-list
know till one month). Could you help me? (by sending me your .config and the
cvs date for example)

!!! I just try binutils_2.11.90.0.7-2.99_hppa.deb but as failed on 'bus
error' !!!

I also install XFREE86-4.0.3 from debian pool site (with an STI console it
would be nice) but xf86config did not write /etc/X11/XF86config-4? Is some
one have some working XF86config-4 to let me try further?


Kind regards,

	Joel


**********************************************************************
This e-mail and any attachments to it may contain confidential information which is strictly intended for the use of the authorised recipient.  If you have received this e-mail in error, please delete it and notify the sender by replying to this e-mail.
Thank you for your co-operation.
**********************************************************************
