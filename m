Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id XAA17797
	for <hppa-linux@sod.res.cmu.edu>; Sun, 28 Mar 1999 23:08:36 -0500
Received: (from sieler@localhost)
	by bart.allegro.com (8.9.1/8.9.1) id UAA29047
	for hppa-linux@thepuffingroup.com; Sun, 28 Mar 1999 20:08:15 -0800
From: Stan Sieler <sieler@allegro.com>
Message-Id: <199903290408.UAA29047@bart.allegro.com>
Subject: Re: [hppa-linux] syscall work
To: hppa-linux@thepuffingroup.com
Date: Sun, 28 Mar 1999 20:08:15 -0800 (PST)
In-Reply-To: <Pine.LNX.3.96.990325205652.197B-100000@quark.ix.netcom.com> from "Kumar" at Mar 25, 99 09:01:05 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Hi,

There may be a reason to avoid the GATE instruction...I've seen some
HP PA-RISC systems where GATE has given way to simply
marking the "gateway" page as non-executable, and relying on a trap
handler to detect the gateway access.  The final result is the same...
an architected method of doing a system call.  (I can only conjecture 
that there is a reason for this...but I don't know what it is.)

Perhaps we can get an HP person to comment?

> It does not matter as long as the gateway instruction is on the "special"
> page. Probably one wants to put a nop before the gateway instruction.

-- 
Stan Sieler                                          sieler@allegro.com
                                     http://www.allegro.com/sieler.html
