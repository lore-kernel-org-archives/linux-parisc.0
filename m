Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id NAA22860
	for <parisc-linux@puffin.external.hp.com>; Wed, 5 Jan 2000 13:03:35 -0700
Message-Id: <200001052006.OAA26587@egsner.cirr.com>
From: eric@cirr.com (Eric Schnoebelen)
To: "Thierry SIMONNET" <t.simonnet@esiee.fr>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Trouble booting 712/60 and 710 
In-reply-to: Your message of "Wed, 05 Jan 2000 20:18:25 +0100."
             <013201bf57b1$a3d6bb50$0a14d793@esiee.fr>
Date: Wed, 05 Jan 2000 14:06:11 -0600
Sender: eric@cirr.com
List-ID: <linux-parisc.vger.kernel.org>


"Thierry SIMONNET" writes:
- I work on HP712/60  and HP710 workstation under HPUX 10.20.
- I've done vmlinux and Image.
- 
- I can't boot using native HP's bootp daemon. The documentation is a bit
- light and the archive doesn't give me any good response.
- I try to boot using HP ISL (after using som_relocate), but it fails. In fact
- it blocks in real setup.

	The 710 is going to use rbootd to network boot.. The 712
should use bootpd.

	Using rbootd for Linux from the puffin site, the configuration
file (rbootd.conf) should look like this:

		08:00:09:16:5e:d7	Image	# puck (hp720)

	Image should be stored in the directory specified by the
rbootd manual page (/usr/mdec/rbootd on my systems.)

	Using bootp on HP-UX, the configuration file
(/etc/bootptab) should look like this:

		test:\
			bf=Image:\
			ht=ether:\
			ha=080009165ed7:\
			ip=192.168.64.1:\
			hd=/:\

	Image should be stored in the root of your tftpd server
directory tree.  tftpd will need to be installed and configured.

[Warning, the bootp configuration file is approximate, as I
can't seem to find my running configuration.. The rbootd
configuration is correct as used by my 720.]


--
Eric Schnoebelen		eric@cirr.com		http://www.cirr.com
"The UNIX PC 3B1: 75% of the power of a VAX-11/780" - Technology Resource Ctr
