Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id SAA16012
	for <parisc-linux@puffin.external.hp.com>; Wed, 12 May 1999 18:18:02 -0600
Received: from chrome.rose.hp.com (kirkb@chrome.rose.hp.com [15.8.150.209])
	by atlrel1.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id UAA17402
	for <parisc-linux@thepuffingroup.com>; Wed, 12 May 1999 20:17:37 -0400 (EDT)
Received: (from kirkb@localhost) by chrome.rose.hp.com (8.8.6 (PHNE_14041)/8.7.3) id RAA28058 for parisc-linux@thepuffingroup.com; Wed, 12 May 1999 17:18:42 -0700 (PDT)
From: Kirk Bresniker <kirkb@chrome.rose.hp.com>
Resent-Message-Id: <199905130018.RAA28058@chrome.rose.hp.com>
Message-Id: <199905130018.RAA28058@chrome.rose.hp.com>
Date: Wed, 12 May 1999 16:13:27 PDT
To: adevries@redhat.com (Alex deVries)
Subject: Re: [parisc-linux] A180 Ignition Howto
In-Reply-To: <Pine.LNX.3.96.990511194053.3178B-100000@devserv.devel.redhat.com>; from "Alex deVries" at May 11, 99 7:46 pm

Linuxen, 

| 
| Incidentally, Christopher Beard told me over lunch that he got the kernel
| building under HPUX, which would solve the linking problems we were
| worried about.
| 

I have been kibbitzing your efforts and have also been building the kernel
under HP-UX 10.20. I actually ran into a problem with gcc 2.8.1 generating
code that wouldn't assemble. I traced the problem to re-definition of .SUBSPA
parameters and hacked gas to ignore the problem. One question I have is 
what are you configuring into the compile? When all was said and done I was
able to leave in only SCSI and serial and generate all the objects.

KMB
--
+============================================================+
|       Kirk Bresniker    	(916) 785-5677		     |
|       8000 Foothills Blvd                                  |
|       Roseville, CA 95747-5649                             |
|       kirkb@rose.hp.com                                    |
