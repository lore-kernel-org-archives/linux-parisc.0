Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from thinkpad.home (pc4-hems4-0-cust39.bre.cable.ntl.com [213.105.90.39])
	by dsl2.external.hp.com (Postfix) with ESMTP id 90D57482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  3 Jan 2002 06:55:57 -0700 (MST)
Date: Thu, 3 Jan 2002 13:46:52 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Bdale Garbee <bdale@gag.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] DSL on a 715/80 with rp-pppoe
Message-ID: <20020103134652.GB1807@sleepie.demon.co.uk>
References: <20020101233834.GA2872@sleepie.demon.co.uk> <Pine.LNX.4.43.0201021748410.2611-100000@szr.petescaff.com> <878zbg64rf.fsf@rover.gag.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <878zbg64rf.fsf@rover.gag.com>
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

On Wed, Jan 02, 2002 at 10:29:08AM -0700, Bdale Garbee wrote:
> peter@petescaff.com (Peter Mottram) writes:
> 
> > The 2.4.9 Debian kernal package had hotplug disabled but the 2.4.16
> > package has it enabled. After a quick apt-get install of hotplug I have a
> > happy system again. I have filed a bug report to Debian on the kernel
> > package requesting a dependency on hotplug. This is obviously not the real
> > fix that is needed, but it would at least prevent this kind of problem for
> > anyone else.
> 
> Nah, that's the wrong answer.  The kernel shouldn't crater if hotplug isn't
> present.

IIRC this is tied up with the __execve code in arch/parisc/kernel/entry.S:

        bl      sys_execve, %r2
        copy    %r16, %r26

        cmpib,=,n 0,%r28,intr_return    /* forward */

>>>>>>  /* yes, this will trap and die. */
        copy    %r15, %r2
        bv      %r0(%r2)
        nop

which does not handle sys_execve failing when invoked from the kernel.
We had the same problem when /sbin/modprobe didn't exist.

Richard
