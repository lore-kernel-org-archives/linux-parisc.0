From: Alex Ivanov <gnidorah@p0n4ik.tk>
Subject: Re: [PATCH] parisc: fix LMMIO mismatch between PAT length and MASK register
Date: Tue, 9 Jul 2013 05:34:21 +0000 (UTC)
Message-ID: <loom.20130709T072537-28@post.gmane.org>
References: <20130614071142.GB10443@p100.box> <CAEdQ38H_nzCEUGXNOtfH=vQdHJ0HvbhyYKLQm8xzEj+DfevLzw@mail.gmail.com> <20130614073827.GA18871@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Helge Deller <deller <at> gmx.de> writes:

> I did not tested X11 yet (still need to fully install the C8000 with our
> unstable) - but Thomas mentioned once that this is needed for X11.

I've built from test-3.10 branch of your repo:
Linux version 3.10.0-rc6-64bit-c3000+ (root@parisc) 
(gcc version 4.6.4 (GCC) ) #4 SMP PREEMPT Mon Jul 8 23:16:48 
MSK 2013

I'm using a c8000 with firegl x3. I approve that console works, 
although in an unaccelerated mode. However xorg isn't:
http://pastebin.com/Y1h2BVHB
The system is latest unstable. The xorg is of 1:7.7+3 version.

