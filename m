Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from web12507.mail.yahoo.com (web12507.mail.yahoo.com [216.136.173.199])
	by dsl2.external.hp.com (Postfix) with SMTP id 555AD4829
	for <parisc-linux@lists.parisc-linux.org>; Wed,  2 Oct 2002 00:52:07 -0600 (MDT)
Message-ID: <20021002065205.59362.qmail@web12507.mail.yahoo.com>
Date: Tue, 1 Oct 2002 23:52:05 -0700 (PDT)
From: Derek Engelhaupt <derekengelhaupt@rocketmail.com>
Subject: Re: [parisc-linux] Non-HP disks?
To: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20021002034059.34434.qmail@web12505.mail.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

--- Derek Engelhaupt <derekengelhaupt@rocketmail.com> wrote:
> Anyone using them?  I have a bunch of IBM DCHS-04F Ultrastar 2XP
> 4.3GB
> (got info from IBM's website about jumpers and tried them all) drives
> that I'm trying to get them to work but all they do is SCSI bus reset
> when Debian trys to load.  They are factory refurbed 50-pin SE disks
> and I have activated Autostart on them and active termination (tried
> it
> without too).  Anyway, they perform this way under HP-UX too.  Tried
> a
> 2GB HP drive and it works fine so the system SCSI bus is fine.  So,
> bottom line is anyone using NON-HP disks in thier systems?  Tried
> them
> in my E55, 712/60, and 712/100.  Have tried 2 different drives with
> the
> same result also.....
> 
> derek
> 
> 

Well, after screwing with it for another hour I finally got it to work.
 Appearantly I had to enable some "option block" on the drive to get it
to work as well as the Term Pwr on the drive.  My HP is the proud new
owner of a bunch of 4.3GB drives.  Now if I can only get the 9Gigers to
work now.... ;) Thanks for all the responses.

derek

__________________________________________________
Do you Yahoo!?
New DSL Internet Access from SBC & Yahoo!
http://sbc.yahoo.com
