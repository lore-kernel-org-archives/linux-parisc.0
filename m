Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from thinkpad.home (pc4-hems4-0-cust39.bre.cable.ntl.com [213.105.90.39])
	by dsl2.external.hp.com (Postfix) with ESMTP id 823BD482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 29 Jan 2002 16:46:26 -0700 (MST)
Date: Tue, 29 Jan 2002 23:35:25 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] sim700 Driver and 715/50's
Message-ID: <20020129233525.GG2884@sleepie.demon.co.uk>
References: <20020129172756.J1945@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020129172756.J1945@systemhalted>
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

On Tue, Jan 29, 2002 at 05:27:56PM -0500, Carlos O'Donell Jr. wrote:
> Does this mean:
> 
> - sim700 driver is not quite working proplerly with new kernel

Looks like it.  You are probably the first person to try to use it
since the new driver was introduced.  It is likely to need changes to
match other kernel changes.  I'd rather not spend time updating it,
and would probably have removed it from the tree by now, if I were less
busy on other things.

Let me know if you really do need it working for comparison purposes and
I'll try find time to look at it - but probably not for a couple of weeks
at least.

Richard
