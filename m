Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp.petescaff.com (petem.xs4all.nl [194.109.247.92])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5954D482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  2 Jan 2002 09:51:57 -0700 (MST)
Date: Wed, 2 Jan 2002 17:51:51 +0100 (CET)
From: Peter Mottram <peter@petescaff.com>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] DSL on a 715/80 with rp-pppoe
In-Reply-To: <20020101233834.GA2872@sleepie.demon.co.uk>
Message-ID: <Pine.LNX.4.43.0201021748410.2611-100000@szr.petescaff.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Tue, 1 Jan 2002, Richard Hirst wrote:
[snip]
> Is it possible you now have CONFIG_HOTPLUG=y, and didn't before?
>
> Does adding a fake sbin/hotplug fix it?

The 2.4.9 Debian kernal package had hotplug disabled but the 2.4.16
package has it enabled. After a quick apt-get install of hotplug I have a
happy system again. I have filed a bug report to Debian on the kernel
package requesting a dependency on hotplug. This is obviously not the real
fix that is needed, but it would at least prevent this kind of problem for
anyone else.

Cheers
PeteM
