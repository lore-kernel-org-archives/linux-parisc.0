Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA28003
	for <parisc-linux@puffin.external.hp.com>; Mon, 3 Apr 2000 09:13:09 -0600
Message-ID: <00ab01bf9d7e$d8d23c40$a94abc0f@hungary.hp.com>
From: "Gyula Matics" <gyula_matics@hp.com>
To: <BOSCHINI@ICIL64.CILEA.IT>, <PARISC-LINUX@thepuffingroup.com>
References: <01JNSZTI58320010PS@ICIL64.CILEA.IT>
Subject: Re: [parisc-linux] PALO on HP 735 10.20
Date: Mon, 3 Apr 2000 17:11:10 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"

At the lower level makefiles It is still picking up hp make instead of the
GNU one.
Don't use 'gmake' but alias make to gmake or but it in the PATH before the
hp make.

Gyula
