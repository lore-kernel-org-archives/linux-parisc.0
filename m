Return-Path: <randolph@tausq.org>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 20CC0482C
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 24 Mar 2004 22:53:21 -0700 (MST)
Date: Wed, 24 Mar 2004 23:28:31 -0800
From: Randolph Chung <randolph@tausq.org>
To: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] Spinlock patch, take 2
Message-ID: <20040325072831.GT750@tausq.org>
References: <40561EAF000035FA@ocpmta1.freegates.net>
	<40561EAF00003770@ocpmta1.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <40561EAF00003770@ocpmta1.freegates.net>
Cc: parisc-linux@lists.parisc-linux.org
Reply-To: Randolph Chung <randolph@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> -#define cpu_possible_map	cpu_present_map
> +#define cpu_possible_map	cpu_present_mask
>  
>  #endif /* CONFIG_SMP */
> =========><=========
> >
> >Is it correct?

I think this is correct, but i'm not sure. i believe this is part of 
the hotplug cpu patches that are being disucssed and we are waiting for
that to do more smp work.

jejb/willy, any comments on this?

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
