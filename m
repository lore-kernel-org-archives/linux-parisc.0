Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id NAA04938
	for <parisc-linux@puffin.external.hp.com>; Thu, 6 Jan 2000 13:44:33 -0700
Message-Id: <200001062047.OAA22081@opus.cirr.com>
From: eric@cirr.com (Eric Schnoebelen)
To: "Thierry SIMONNET" <t.simonnet@esiee.fr>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Trouble booting 712/60 and 710 
In-reply-to: Your message of "Thu, 06 Jan 2000 09:29:31 +0100."
             <01dd01bf5820$27f8d580$0a14d793@esiee.fr>
Date: Thu, 06 Jan 2000 14:47:06 -0600
Sender: eric@cirr.com
List-ID: <linux-parisc.vger.kernel.org>


"Thierry SIMONNET" writes:
- I test the following configuration :
- Server : 712/60 with bootpd, HPUX 10.20, IP address 147.215.1.38
- Linux workstation : 712/60, IP address 147.215.1.38
- I use bootptab file like this :
- 
- mkhppa01:\
-     ht=ethernet:\
-     hd=/tftpboot:\
-     bf=Image2:\
-     ha=0800096dc1ec:\
-     sm=255.255.255.0:\
-     gw=147.215.1.1:\
-     ds=147.215.1.4:\
-     ip=147.215.1.37
- 
- I try to boot with any Image by typing : boot lan.147.215.1.38
- 
- syslog.log give me :
- ---- bootpd[5757] : bootsize=1396736 hp->bootsize=1396736
- But nothing happens.

	How is your tftp server set up??  Is it running chrooted
or not?? If it's running chrooted, the `hd' parameter above is
probably wrong as `bf' is likely in the real location of
`/tftpboot/Image2' and not `<tftpdir>/tftpboot/Image2'.
