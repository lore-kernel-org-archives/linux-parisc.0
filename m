Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id DAA04217
	for <parisc-linux@puffin.external.hp.com>; Tue, 4 Apr 2000 03:22:55 -0600
From: BOSCHINI@ICIL64.CILEA.IT
Date: Tue, 04 Apr 2000 11:22:15 +0000 (MET-01DST)
Subject: Re: [parisc-linux] PALO on HP 735 10.20
To: gyula_matics@hp.com
Cc: PARISC-LINUX@THEPUFFINGROUP.COM
Message-id: <01JNU29FX02A0010AT@ICIL64.CILEA.IT>
MIME-version: 1.0
Content-type: TEXT/PLAIN; CHARSET=US-ASCII

I already had gmake found before HP's make in my path. 

If I do a make --version, I get gmake's output.

I even added an alias to it, but keep getting the same errors:

/bin/bash: invalid character 45 in exportstr for DRIVERS-y
/bin/bash: invalid character 45 in exportstr for DRIVERS-
/bin/bash: invalid character 45 in exportstr for DRIVERS-m
/bin/bash: invalid character 45 in exportstr for DRIVERS-n

which, to my (poor) understanding have nothing to do with make/gmake
but with bash parsing something.

As for the palo build, having assured that I really use gmake, I keep getting
the same error:

Make: Don't know how to make crt0.o.  Stop.
gmake: *** [makeipl] Error 1

On the other hand, I tried make-ing from ipl, and everything was fine...
Then I tried the make PA=your/palinux/source/tree lifimage and everything seems
fine....

Finally, make palo from linux-2.3, gose fine.

I'll let you know how the rest goes ....

Matteo Boschini
