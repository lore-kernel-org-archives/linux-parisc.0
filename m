Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from thinkpad.home (pc4-hems4-0-cust39.bre.cable.ntl.com [213.105.90.39])
	by dsl2.external.hp.com (Postfix) with ESMTP id B314A482A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  1 Jan 2002 16:47:38 -0700 (MST)
Date: Tue, 1 Jan 2002 23:38:34 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Peter Mottram <peter@petescaff.com>
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] DSL on a 715/80 with rp-pppoe
Message-ID: <20020101233834.GA2872@sleepie.demon.co.uk>
References: <20011229205411.GA11344@sleepie.demon.co.uk> <Pine.LNX.4.42.0112300049260.17057-100000@r6.petescaff.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.42.0112300049260.17057-100000@r6.petescaff.com>
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

On Sun, Dec 30, 2001 at 12:56:54AM +0100, Peter Mottram wrote:
> Until I restarted ppp on my 712 it had been working perfectly for nearly
> three months with no /sbin/hotplug.
> 
> Unfortunately I am a sad unstable addict (I have been since pre-buzz days
> on i386) and have updated many times since ppp was last restarted.
> 
> This one I find weird because I know that it has worked but broke sometime
> recently. The only reason I restarted the system was to finally upgrade to
> the 2.4.16 kernel I have been happily running on a C160 and a collection
> of C110s.

Is it possible you now have CONFIG_HOTPLUG=y, and didn't before?

Does adding a fake sbin/hotplug fix it?

Richard
