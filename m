Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id LAA22930
	for <hppa-linux@sod.res.cmu.edu>; Thu, 18 Mar 1999 11:53:53 -0500
Received: from tintin.mcom.com (tintin.mcom.com [205.217.233.42])
	by netscape.com (8.8.5/8.8.5) with ESMTP id IAA19741
	for <hppa-linux@thepuffingroup.com>; Thu, 18 Mar 1999 08:53:15 -0800 (PST)
Received: from netscape.com ([205.217.243.67]) by
          tintin.mcom.com (Netscape Messaging Server 4.03) with ESMTP id
          F8SUWU00.TNS for <hppa-linux@thepuffingroup.com>; Thu, 18 Mar
          1999 08:53:18 -0800
Sender: shaver@netscape.com (Mike Shaver)
Message-ID: <36F12FE8.308782A2@netscape.com>
Date: Thu, 18 Mar 1999 11:55:04 -0500
From: Mike Shaver <shaver@netscape.com>
MIME-Version: 1.0
To: hppa-linux@thepuffingroup.com
Subject: Re: [hppa-linux] Gateway instructions
References: <199903181435.JAA14215@caliban.physics.utoronto.ca>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Christopher Neufeld wrote:
>    How does this work, now? Is the target of the gateway instruction
> intended to be simply a vector table of other jumps, preceded by some
> non-branch instruction which forms the taget of the gateway?

I suspected so, but was confounded by the same issues you bring up....

OpenBSD has this:
#define SYSCALLGATE     0xC0000000              /* syscall gateway page
*/
but I can't find it used anywhere else in the hppa-specific code, or
indeed the rest of the sys/ tree.

Here's how I think it works:
The GATE completer takes its privilege from the TLB entry for the page
_containing_ the BRANCH-with-GATE (see 4-5 in the PARISC 2.0 book).  So
what we do is have a page (at 0xC0000000, probably) that has
appropriately high privilege level in the TLB, and yet is executable by
the user-space process.  I think that means that the TLB access rights
field is [100,11,11]:
- execute: promote to privilege 0
- minimum privilege 3
- maximum privilege 3 (or do we care?)

The page contains:
???
B,GATE to syscall 0
???
B,GATE to syscall 1
???
B,GATE to syscall 2
etc.

I don't know what goes in ???, but clearly something is required so that
we don't get nailed by PSW[B].  Maybe a NOP, but probably something more
useful is required (set up space and other registers?).  The access ID
for that page should probably be 0, to make it universally accessible.

Questions:
- how many privilege levels do we care about?
- is it sufficient to mark kernel data as [001,00,00] with an access ID
of 0 so that all processes can get at it (when they've become
beprivileged enough!) ?  (With variants for code [100,00,00] and
read-only [000,00,00], of course.)
- what should go in ``???''?  Just something that sets PSW[C]?
- am I totally on crack?

Mike

-- 
345127.74 293957.05
