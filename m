Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA07709
	for <parisc-linux@puffin.external.hp.com>; Wed, 29 Mar 2000 11:29:29 -0700
Message-ID: <20000329180613.99367.qmail@hotmail.com>
From: "Bas Valkema" <b_valkema@hotmail.com>
To: "Mike Brancato" <funnyguy@digitalsmackdown.net>,
        <parisc-linux@thepuffingroup.com>
References: <Pine.LNX.4.10.10003281748330.2059-100000@morph.net>
Subject: Re: [parisc-linux] using lan to boot
Date: Wed, 29 Mar 2000 10:27:39 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

Hi,

I had the same problem, try rbootd (rpm & tar download somewhere on the
puffin.external.hp.com site) & install in Linux x86
Next, install HPPA-Linux bootimage in /export/hp/images (I think, look in
messagedump (/var/adm/messages in my distribution) & edit /etc/rbootd.conf

should work now.

bye, BaZ


----- Original Message -----
From: Mike Brancato <funnyguy@digitalsmackdown.net>
To: <parisc-linux@thepuffingroup.com>
Sent: Wednesday, March 29, 2000 1:01 AM
Subject: [parisc-linux] using lan to boot


>
> i played with the 735/125 we have here, and i can't get it to sent any
> packets.  it has no HD right now.  using snoop to monitor network traffic,
> we looked to its hardware address.  no luck.  to go the hardware address,
> i type hrdw_addr os something at the boot prompt?  we used that HW
> address.  typing "boot lan.<servershwaddr>.0.0" makes the boot fail.  and
> there is no network traffic from that machine.  when the computer searches
> for bootable devices, it only sees P0 which is the floppy.  It prints out
> liek 5 lines of numbers...  000000 000000 000050 etc...  it says boot
> failed and stuff and INIT_ENTRY = -7.  could anyone explain.  we're
> perflexed whay lan won't send anything.  the externet adapter is flashing
> the Tx light though.
>
> i've got an image prefared, and now i just need to boot to it.
>
> mike
>
> --------------------------------------------------------------------------
-
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com
with
> `unsubscribe' as the subject.
