Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id QAA29050
	for <hppa-linux@sod.res.cmu.edu>; Thu, 25 Mar 1999 16:27:51 -0500
Received: (from sieler@localhost)
	by bart.allegro.com (8.9.1/8.9.1) id NAA22126
	for hppa-linux@thepuffingroup.com; Thu, 25 Mar 1999 13:27:28 -0800
From: Stan Sieler <sieler@allegro.com>
Message-Id: <199903252127.NAA22126@bart.allegro.com>
Subject: Re: [hppa-linux] syscall work
To: hppa-linux@thepuffingroup.com
Date: Thu, 25 Mar 1999 13:27:27 -0800 (PST)
In-Reply-To: <36FAA595.DB56B012@netscape.com> from "Mike Shaver" at Mar 25, 99 04:07:33 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Mike writes:
> Anyone know what manual they're talking about?  I'd like to find out
> what to do for syscalls that take more than 4 arguments, like mmap and
> recvfrom and sendto.

Sounds like the HP-UX Application Binary Interface (or
was it the Application Programming Interface...two different manuals) from the
Precision RISC Organization (or, more exactly,
from HP...but developed for PRO) would be quite useful.  It (the
one that discusses system calls) may provide some
info about where parameters go.

Unfortunately, I'm miles away from my copy.  Maybe someone
from HP can comment on the manual?

BTW, I like the different gateway address better than the different range.
 

-- 
Stan Sieler                                          sieler@allegro.com
                                     http://www.allegro.com/sieler.html
