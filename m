Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA04966
	for <parisc-linux@puffin.external.hp.com>; Tue, 14 Nov 2000 16:06:46 -0700
Message-ID: <C36304FE952AD411AC87002094120338029E7E@MTMAIL>
From: Ian Zink <ian.zink@maryville.com>
To: "'parisc-linux@thepuffingroup.com'" <parisc-linux@thepuffingroup.com>
Subject: RE: [parisc-linux] Palinux on a 712/60 
Date: Tue, 14 Nov 2000 17:08:33 -0600
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-parisc.vger.kernel.org>

Thanks for the reply, Grant. However, the 712s do not have a serial console.
They do have a com port, but it does not work as a console, unfortunately.
So I need do need to get a STI enabled kernel. I dropped Paul Lahaie a note
to see if he could send me such a kernel so I do not have to create the
entire cross-platform development environment just to boot one of these
712s. After I get it, I plan on expanding the 0.5 iso and making a new one
using the STI console kernel.

Ian
