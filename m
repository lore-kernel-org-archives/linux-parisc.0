Return-Path: <James.Bottomley@SteelEye.com>
Received: from hancock.sc.steeleye.com (stat1.steeleye.com [65.114.3.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7C61048A2
	for <parisc-linux@lists.parisc-linux.org>;
	Wed,  4 Feb 2004 08:05:05 -0700 (MST)
Received: from midgard.sc.steeleye.com (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	i14F51a28295; Wed, 4 Feb 2004 10:05:01 -0500
Subject: Re: [parisc-linux] memory mapping and sort_extable?
From: James Bottomley <James.Bottomley@steeleye.com>
To: Randolph Chung <randolph@tausq.org>
In-Reply-To: <20040204094358.GL959@tausq.org>
References: <20040204094358.GL959@tausq.org>
Content-Type: text/plain
Date: 04 Feb 2004 10:04:52 -0500
Message-Id: <1075907093.1756.1.camel@mulgrave>
Mime-Version: 1.0
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Wed, 2004-02-04 at 04:43, Randolph Chung wrote:
> 2.6.2-rc2 doesn't boot on my c3k when running 32-bit kernel and if
> CONFIG_STI_CONSOLE is not enabled. The problem seems to be that for some
> reason [*] when CONFIG_STI_CONSOLE is not defined, we map all kernel
> memory as r/o, so when sort_extable (in lib/extable.c) tries to
> rearrange our exception tables it writes to the kernel pages and faults.
> 
> interestingly, when building a 64-bit kernel with similar config options
> i don't see a fault... maybe there is something else happening there.
> 
>  From a cursory inspection, it appears that we never use to sort our
> exception tables; dumping the extable from a vmlinux binary shows that
> the entries are properly sorted at link time... but i haven't tried 
> this on modules to see if they are also sorted. Not sure how the 
> sorting is happening...  does ld do it?
> 
> Anyway, the following patch trivially removes sort_extable for parisc
> and lets the kernel boot. Not yet sure if it's correct. Does anyone
> know?
> 
> [*] Why do we map kernel pages as read-only? is it just to be "extra
> safe"?

Let me have a look at this.  It sounds like a section naming issue that
differs on 32/64 bit.

Of course, you guessed that I'd only tested on a 64 bit kernel...

We need the sort extable because the generic search function (which we
now use) expects a sorted table to simplify address searches, so going
back to an unsorted one may produce unexpected results...

James
