Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA05651
	for <parisc-linux@puffin.external.hp.com>; Sun, 17 Dec 2000 17:28:27 -0700
From: Stan Sieler <sieler@allegro.com>
Message-Id: <200012180029.QAA03444@opus.allegro.com>
Subject: Re: [parisc-linux] ldcw in __pthread_acquire
To: alan@lxorguk.ukuu.org.uk (Alan Cox)
Date: Sun, 17 Dec 2000 16:29:50 -0800 (PST)
Cc: matthew@wil.cx (Matthew Wilcox), jes@linuxcare.com (Jes Sorensen),
        alan@linuxcare.com.au (Alan Modra),
        jsm@udlkern.fc.hp.com (John Marvin), parisc-linux@thepuffingroup.com
In-Reply-To: <E147TiI-0003X1-00@the-village.bc.nu> from "Alan Cox" at Dec 17, 2000 02:38:10 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Re:

> There are good reasons for doing buzzlocks in user space

Not really...they all vanish when you look with the microscope of
experience.  Trust me.  I've been doing this stuff (multi-processor,
semaphores, locks, etc.) for 30 years.  

And, Lamont agrees, apparently :)

(Thanks, Lamont, and hi!)

The apparent advantages are *strictly* short term.  A single mistake
using a buzz lock from user code in a single process on a single computer
can cost more time than all properly implemented buzz locks ever save.

The "it's faster" argument is the same kind of argument as "not indenting my 
code makes it faster to write, because I don't have to waste the 
time pressing that space bar or tab key"....and precisely as bad an argument :)

Operating system functions, strangely enough, deserved to be implemented
in the *operating system*!  Gaining exclusive access to a data structure
is such a function.

-- 
Stan Sieler                                           sieler@allegro.com
www.allegro.com/sieler/wanted/index.html                  www.sieler.com        
