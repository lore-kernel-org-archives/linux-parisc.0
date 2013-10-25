From: "Helge Deller" <deller@gmx.de>
Subject: Aw: Reproducible kernel panic using gcc
Date: Fri, 25 Oct 2013 16:31:39 +0200 (CEST)
Message-ID: <trinity-f177b623-5ca9-4417-a689-b0f8676e3fb5-1382711499524@3capp-gmx-bs08>
References: <b6f8076c32d0859e4ddb328bb7aca076@tuxicoman.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: linux-parisc@vger.kernel.org
To: "Guy Martin" <gmsoft@tuxicoman.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <b6f8076c32d0859e4ddb328bb7aca076@tuxicoman.be>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> Using a simple test program, I'm able to panic the kernel using gdb.
> 
> I've attached the test program. The output from the console is the 
> following :
> 
> Bad Address (null pointer deref?): Code=6 regs=000000007e354370 
> (Addr=0000000000000000)

Works without crash for me on 3.12-rc6 ?
Linux ls3011 3.12.0-rc6-64bit+

Since you run 3.10.6, maybe updating the kernel might help.
Esp. this patch, which has been backported to kernel 3.10 (and is in 3.10.17):
http://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/commit/?h=linux-3.10.y&id=77587e89405f5d8225a0e750df254bcc2dcb73e1

Helge
