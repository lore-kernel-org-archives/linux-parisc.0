Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 34D924840
	for <parisc-linux@lists.parisc-linux.org>; Sun, 26 Oct 2003 10:25:34 -0700 (MST)
Date: Sun, 26 Oct 2003 10:25:31 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] C110 builtin nic slow?
Message-ID: <20031026172531.GA32146@colo.lackof.org>
References: <3F9BFB00.5090008@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3F9BFB00.5090008@tiscali.be>
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

On Sun, Oct 26, 2003 at 04:49:04PM +0000, Joel Soete wrote:
> 8. Raven T' Core LAN (802.3) (10) at 0xffd07000 [8/16/6], versions 0x32, 
> 0x0, 0x8a

This is a 10Mb link.

> And, at the office, I use to obtain around nice 1Mb/s when I do such 
> rsync or ftp between my b180 connected via a hub.

Which protocol?

> But here at home, I connect the builtin nic of my c110 with a 
> cross-cable to my pc (proxy) and I just obtain 50kb/s (whatever the 
> kernel I boot 2.4 or 2.6) (ie 20 time less then with a another pc 
> connected in place of the c110). Is it possible to improve the 
> performance of this builtin nic?

Earlier this year I exchanged email with someone on linux-ia64 list with
a similar sounding problem. They were trying to NFS mount some exported
by the ia64-linux server but perf was ~80KB/s vs 50MB/s (1000BT) across
the same link to another ia64-linux box. We never found the root cause
since netperf demonstrated the UDP throughput was > 50MB/s (expected)
in the same config. I could only guess it was something in the NFS
stack having to do with 16K pages.

But thinking about this more, I'm wondering if some kernel code is
accessing misaligned data someplace in the networking stack.
The arguments I've heard is this is expected behavior.

Joel,
1) Can you verify dmesg has no misaligned data access reports?
2) Can you clarify how you are measuring performance?
   (ie which protocols and which tools?)
3) Can you setup/run netperf or httperf with the PC to verify whatever
   protocol you are using basically works?

grant
