Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sj-msg-core-1.cisco.com (sj-msg-core-1.cisco.com [171.71.163.11])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6C5CA4867
	for <parisc-linux@lists.parisc-linux.org>; Tue,  1 Oct 2002 22:16:42 -0600 (MDT)
Date: Tue, 1 Oct 2002 21:16:35 -0700
From: Christian Suder <csuder@cisco.com>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Non-HP disks?
Message-Id: <20021001211635.49fc4480.csuder@cisco.com>
In-Reply-To: <20021002034059.34434.qmail@web12505.mail.yahoo.com>
References: <20021002031406.GA32230@systemhalted>
	<20021002034059.34434.qmail@web12505.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

I have been using non-HP firmware Seagate, Quantum, Toshiba and IBM drives (older 1GB though) in 712, 735 and C class. 

IIRC correctly I couldn't get a newer 4.3 GB IBM drive to work in a SS20, the drive is Ultra-SCSI and that somehow doesn't work with old controllers. May be the same problem in HPs,

	Christian 


On Tue, 1 Oct 2002 20:40:59 -0700 (PDT)
"Derek Engelhaupt" <derekengelhaupt@rocketmail.com> wrote:

> Anyone using them?  I have a bunch of IBM DCHS-04F Ultrastar 2XP 4.3GB
> (got info from IBM's website about jumpers and tried them all) drives
> that I'm trying to get them to work but all they do is SCSI bus reset
> when Debian trys to load.  They are factory refurbed 50-pin SE disks
> and I have activated Autostart on them and active termination (tried it
> without too).  Anyway, they perform this way under HP-UX too.  Tried a
> 2GB HP drive and it works fine so the system SCSI bus is fine.  So,
> bottom line is anyone using NON-HP disks in thier systems?  Tried them
> in my E55, 712/60, and 712/100.  Have tried 2 different drives with the
> same result also.....
> 
> derek
> 
> __________________________________________________
> Do you Yahoo!?
> New DSL Internet Access from SBC & Yahoo!
> http://sbc.yahoo.com
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
