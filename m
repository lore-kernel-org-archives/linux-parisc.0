Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id IAA03117
	for <parisc-linux@puffin.external.hp.com>; Tue, 23 Nov 1999 08:58:23 -0700
Received: from udlkern.fc.hp.com (root@udlkern.fc.hp.com [15.1.52.48])
	by hpfcla.fc.hp.com (8.9.1/8.9.1) with ESMTP id IAA21194
	for <parisc-linux@thepuffingroup.com>; Tue, 23 Nov 1999 08:59:53 -0700 (MST)
Received: from debian.fc.hp.com (root@debian.fc.hp.com [15.1.48.119]) by udlkern.fc.hp.com with ESMTP (8.8.6 (PHNE_14041)/8.7.1) id IAA08805 for <parisc-linux@thepuffingroup.com>; Tue, 23 Nov 1999 08:59:53 -0700 (MST)
Received: from debian.fc.hp.com (bame@localhost [127.0.0.1])
	by debian.fc.hp.com (8.9.3/8.9.3/Debian/GNU) with ESMTP id IAA23827
	for <parisc-linux@thepuffingroup.com>; Tue, 23 Nov 1999 08:59:52 -0700
Message-Id: <199911231559.IAA23827@debian.fc.hp.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Progress 
In-reply-to: Your message of "Mon, 22 Nov 1999 08:30:23 +0100."
             <19991122083023.B1310@mathe.stud.uni-erlangen.de>
Date: Tue, 23 Nov 1999 08:59:52 -0700
From: Paul Bame <bame@debian.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

= 
= Honestly, I don't think we have a way yet to use the command line the HPUX
= boot loader passes us (which I was told uses the ANSI C way of passing
= arguments, i.e. argument count in GR26, pointer to NULL-terminated array
= of pointers to NULL-terminated arrays of strings in GR25).  Anyone up to
= write some glue code that puts that back together into a simple long string
= Linux's commandline splitting code can spli again ?
= 

I wrote that glue a while back -- it's in real/setup.c and is #if-0-ed.
Unfortunately the strings are stored
in low-ish physical RAM which is overwritten when the our kernel is
loaded.  If we want the hpux command line badly enough, we'll have
to load the kernel at a higher physical location.  It could then
be copied to 0x10000 after we collect the command line.  

One could hard-code a command line in real/setup.c temporarily...

	-P
