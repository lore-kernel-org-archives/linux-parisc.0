Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from zouave.sonic.net (zouave.sonic.net [209.204.172.153])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6BB004829
	for <parisc-linux@lists.parisc-linux.org>; Tue,  1 Oct 2002 22:02:00 -0600 (MDT)
Received: from frizzen.efball.com (frizzen.efball.com [192.168.0.27])
	by zouave.sonic.net (Postfix) with ESMTP id E22116805
	for <parisc-linux@lists.parisc-linux.org>; Tue,  1 Oct 2002 21:01:56 -0700 (PDT)
Date: Tue, 1 Oct 2002 21:01:55 -0700
From: E Frank Ball <frankb@efball.com>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Non-HP disks?
Message-ID: <20021001210155.A561@zouave.sonic.net>
Reply-To: frankb@efball.com
References: <20021002031406.GA32230@systemhalted> <20021002034059.34434.qmail@web12505.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20021002034059.34434.qmail@web12505.mail.yahoo.com>; from derekengelhaupt@rocketmail.com on Tue, Oct 01, 2002 at 08:40:59PM -0700
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

On Tue, Oct 01, 2002 at 08:40:59PM -0700, Derek Engelhaupt wrote:
} Anyone using them?  I have a bunch of IBM DCHS-04F Ultrastar 2XP 4.3GB
} (got info from IBM's website about jumpers and tried them all) drives
} that I'm trying to get them to work but all they do is SCSI bus reset
} when Debian trys to load.  They are factory refurbed 50-pin SE disks
} and I have activated Autostart on them and active termination (tried it
} without too).  Anyway, they perform this way under HP-UX too.  Tried a
} 2GB HP drive and it works fine so the system SCSI bus is fine.  So,
} bottom line is anyone using NON-HP disks in thier systems?  Tried them
} in my E55, 712/60, and 712/100.  Have tried 2 different drives with the
} same result also.....

Most non-HP drives should work fine.  We use lots of Seagate Medalist
ST34520N drives in all the 700s.  We used to use some Quatums, and we've
used IBMs too, but I don't know the nubmers.

-- 

   E Frank Ball                frankb@efball.com
