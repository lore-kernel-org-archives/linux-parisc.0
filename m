Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 90217497F
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 24 Mar 2004 23:00:41 -0700 (MST)
Date: Wed, 24 Mar 2004 23:00:40 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] Spinlock patch, take 2
Message-ID: <20040325060040.GA9159@colo.lackof.org>
References: <40561EAF000035FA@ocpmta1.freegates.net>
	<40561EAF00003770@ocpmta1.freegates.net>
	<20040325072831.GT750@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040325072831.GT750@tausq.org>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Wed, Mar 24, 2004 at 11:28:31PM -0800, Randolph Chung wrote:
> I think this is correct, but i'm not sure. i believe this is part of 
> the hotplug cpu patches that are being disucssed and we are waiting for
> that to do more smp work.
> 
> jejb/willy, any comments on this?

I just started looking at this.
We don't need cpu_present_map.
We should use cpu_possible_mask in our arch/parisck/kernel/smp.c.

grant
