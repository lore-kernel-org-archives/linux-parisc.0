Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA15035
	for <parisc-linux@puffin.external.hp.com>; Tue, 2 Nov 1999 12:12:50 -0700
Received: from claymore.sqf.hp.com (claymore.sqf.hp.com [15.144.177.1])
	by palrel1.hp.com (Postfix) with ESMTP id 08E08699
	for <parisc-linux@thepuffingroup.com>; Tue,  2 Nov 1999 11:13:45 -0800 (PST)
Received: from sqf.hp.com (hpqs0581.sqf.hp.com [15.144.178.150]) by claymore.sqf.hp.com with ESMTP (8.8.6 (PHNE_17135)/8.7.3 TIS 5.0) id TAA16802 for <parisc-linux@thepuffingroup.com>; Tue, 2 Nov 1999 19:13:43 GMT
Sender: dscobbie@sqf.hp.com
Message-ID: <381F37E6.9670A451@sqf.hp.com>
Date: Tue, 02 Nov 1999 19:13:43 +0000
From: Donald Scobbie <dscobbie@sqf.hp.com>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] _end symbol in parisc linux?
List-ID: <linux-parisc.vger.kernel.org>



> Anybody know how to get PA-Linux to have an _end symbol like
> most other programs, including Intel Linux?
>
>         -Paul Bame

Define the symbol as:

extern void *_end;

and the linker will sort it out for you. See the HP-UX man page for
'end'.
I think everyone is linking with the HP-UX ld, but it works for gcc ld
too.

Cheers

Donald

-------------------------------------------------------
Donald Scobbie
Hewlett Packard Ltd.        email:  dscobbie@sqf.hp.com
Telecom Systems Division    Phone:  +44 131 331 6149
