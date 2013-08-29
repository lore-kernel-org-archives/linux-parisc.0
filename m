From: Helge Deller <deller@gmx.de>
Subject: Does there exists any 32bit-only PARISC SMP machines?
Date: Thu, 29 Aug 2013 20:51:52 +0200
Message-ID: <521F9848.4010404@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi all,

I was asked by the debian kernel team to drop on parisc the UP kernels and only provide SMP kernels even for UP-machines.

For 64bit it might make sense to only ship a 64bit SMP kernel, but I'm not sure if it makes sense for 32bit kernels.
One major question would be, if there exists any 32bit parisc machines which support multiple CPUs at all?
If not, then it would make sense to drop the 32bit SMP kernels instead.  

So, are there any 32bit SMP machines out there?
Any other thoughts on this topic?

Thanks,
Helge
