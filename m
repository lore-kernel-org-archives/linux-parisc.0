Received: from mailserv2.iuinc.com (mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id BAA29840
	for <parisc-linux@puffin.external.hp.com>; Thu, 6 Jan 2000 01:26:55 -0700
Message-ID: <01dd01bf5820$27f8d580$0a14d793@esiee.fr>
From: "Thierry SIMONNET" <t.simonnet@esiee.fr>
To: "Eric Schnoebelen" <eric@cirr.com>
Cc: <parisc-linux@thepuffingroup.com>
References: <200001052006.OAA26587@egsner.cirr.com>
Subject: Re: [parisc-linux] Trouble booting 712/60 and 710 
Date: Thu, 6 Jan 2000 09:29:31 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

I test the following configuration :
Server : 712/60 with bootpd, HPUX 10.20, IP address 147.215.1.38
Linux workstation : 712/60, IP address 147.215.1.38
I use bootptab file like this :

mkhppa01:\
    ht=ethernet:\
    hd=/tftpboot:\
    bf=Image2:\
    ha=0800096dc1ec:\
    sm=255.255.255.0:\
    gw=147.215.1.1:\
    ds=147.215.1.4:\
    ip=147.215.1.37

I try to boot with any Image by typing : boot lan.147.215.1.38

syslog.log give me :
---- bootpd[5757] : bootsize=1396736 hp->bootsize=1396736
But nothing happens.

TX
----- Original Message -----
From: Eric Schnoebelen <eric@cirr.com>
To: Thierry SIMONNET <t.simonnet@esiee.fr>
Cc: <parisc-linux@thepuffingroup.com>
Sent: Wednesday, January 05, 2000 9:06 PM
Subject: Re: [parisc-linux] Trouble booting 712/60 and 710


>
> "Thierry SIMONNET" writes:
> - I work on HP712/60  and HP710 workstation under HPUX 10.20.
> - I've done vmlinux and Image.
> -
> - I can't boot using native HP's bootp daemon. The documentation is a bit
> - light and the archive doesn't give me any good response.
> - I try to boot using HP ISL (after using som_relocate), but it fails. In
fact
> - it blocks in real setup.
>
> The 710 is going to use rbootd to network boot.. The 712
> should use bootpd.
>
> Using rbootd for Linux from the puffin site, the configuration
> file (rbootd.conf) should look like this:
>
> 08:00:09:16:5e:d7 Image # puck (hp720)
>
> Image should be stored in the directory specified by the
> rbootd manual page (/usr/mdec/rbootd on my systems.)
>
> Using bootp on HP-UX, the configuration file
> (/etc/bootptab) should look like this:
>
> test:\
> bf=Image:\
> ht=ether:\
> ha=080009165ed7:\
> ip=192.168.64.1:\
> hd=/:\
>
> Image should be stored in the root of your tftpd server
> directory tree.  tftpd will need to be installed and configured.
>
> [Warning, the bootp configuration file is approximate, as I
> can't seem to find my running configuration.. The rbootd
> configuration is correct as used by my 720.]
>
>
> --
> Eric Schnoebelen eric@cirr.com http://www.cirr.com
> "The UNIX PC 3B1: 75% of the power of a VAX-11/780" - Technology Resource
Ctr
>
> --------------------------------------------------------------------------
-
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com
with
> `unsubscribe' as the subject.
>
>
