Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from guinness.internal.neep.com.au (102.tls.ppp.reynolds.net.au [203.38.119.102])
	by dsl2.external.hp.com (Postfix) with ESMTP id 46D604829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 13 Sep 2002 19:08:22 -0600 (MDT)
Received: (from andrew@localhost)
	by guinness.internal.neep.com.au (8.9.3/8.9.3/Debian/GNU) id JAA29387
	for parisc-linux@lists.parisc-linux.org; Sat, 14 Sep 2002 09:04:47 +0800
Date: Sat, 14 Sep 2002 09:04:43 +0800
From: Andrew Shugg <andrew@neep.com.au>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: OT HP-UX Formatting Scsi disks
Message-ID: <20020914090440.D30097@neep.com.au>
References: <sd78d3a1.013@ms-zrt1> <20020913062639.20473.qmail@web12503.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020913062639.20473.qmail@web12503.mail.yahoo.com>; from derekengelhaupt@rocketmail.com on Thu, Sep 12, 2002 at 11:26:39PM -0700
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Derek Engelhaupt said:
> I've decided to load HP-UX on the E55 I've been playing with since
> Debian doesn't work very well on it right now.  I'm sending this OT
> because I need to know where dd lives on an HP-UX 11.11 box.  I'm in a
> limited shell and need an absolute path to dd to get it to accomplish
> the above.  It's so limited it won't even give me the ls command.  Any
> of you HP-UX guys out there?  Since I'm at home I don't have access to
> an HP-UX box at work.  Thanks.

Just how limited is this shell?  Are you just not able to see any
output?  What happens when you run '/bin/ls'?

If you can get stdout, try 'which dd' and 'find / -type f -name dd -print'
to locate the program.  I don't have an HP/UX box in front of me either,
or I would just tell you where dd lived.  =)

Andrew.

-- 
Andrew Shugg <andrew@neep.com.au>                   http://www.neep.com.au/

"Just remember, Mr Fawlty, there's always someone worse off than yourself."
"Is there?  Well I'd like to meet him.  I could do with a good laugh."
