Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA01543
	for <parisc-linux@puffin.external.hp.com>; Fri, 25 Feb 2000 14:23:05 -0700
Message-ID: <E97137CF9A25D311902E00A0C9F484E0027985F4@xfc03.fc.hp.com>
From: "HOLBROOK,SCOTT \(HP-FtCollins,ex1\)" <scott_holbrook@am.exch.hp.com>
To: "'willy@thepuffingroup.com'" <willy@thepuffingroup.com>
Cc: "'parisc-linux@thepuffingroup.com'" <parisc-linux@thepuffingroup.com>
Subject: RE: [parisc-linux] code 28 trap
Date: Fri, 25 Feb 2000 13:23:51 -0700
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

I just realized something:

> Years ago I wrote an unaligned load/store emulator (trap handler) for
> a port of an evil OS to PA-RISC.  I still have the code -- it would take
> a little bit of work to massage it into a real low-level trap handler,
> but that task should be very straight-forward.

The code I have is for PA-RISC running in little-endian mode.  There would
be some additional work to make it bit-endian.

Do you just love endian issues?

Scott Holbrook / rsh@fc.hp.com
