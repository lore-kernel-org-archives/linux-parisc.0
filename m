From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Confusion in usr/include/asm-generic/fcntl.h
Date: Wed, 21 Jan 2009 21:52:08 -0500 (EST)
Message-ID: <20090122025209.307E54F30@hiauly1.hia.nrc.ca>
References: <4977C1D3.2010801@zytor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: grundler@parisc-linux.org, arnd@arndb.de, davem@davemloft.net,
	jaswinder@kernel.org, mingo@elte.hu, x86@kernel.org,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org
To: hpa@zytor.com (H. Peter Anvin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4977C1D3.2010801@zytor.com> from "H. Peter Anvin" at Jan 21, 2009 04:46:11 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> CONFIG_* macros are not (or at least should not) be exported to 
> userspace!  Userspace should not make compile-time decisions based on 
> kernel configuration -- a runtime property!

Unfortunately, this decision was made years ago...

dave@mx3210:~$ uname -m
parisc64
dave@hiauly6:~/gnu/gcc-4.4/gcc$ uname -m
parisc

The only significant difference between the above two machines is that
mx3210 is running a 64-bit kernel and hiauly6 is running a 32-bit kernel.
Both are PA 2.0 machines.  Some PA 2.0 machines can only run 64-bit
kernels.  The workstations can typically run both.

The issue for user space is that 64-bit kernels can support both 32 and
64-bit applications.  This affects build scripts and make files.  The
default machine selected by config.guess for parisc64 is hppa64.
Separate applications provide 32-bit and 64-bit support in binutils, 
cc and gdb.  hppa64 selects 64-bit support when build these applications.
So, if you want a 32-bit compiler, you need to explicitly override
the default chosen by config.guess.

Historically, this occurred on parisc because the runtime differences
(on HP-UX) between 32 and 64-bit code are large, making it very difficult
to combine 32 and 64-bit support without changing a significant number
of macro defines affecting many targets.  There is still a lot of code
in gcc which depends on whether a given macro is defined or not.

In theory, it should be possible to use a single application to
generate 32 and 64-bit code on parisc for linux.  Jeff Law, who did
the 64-bit gcc implementation for parisc, said it wasn't worth the
effort to merge the two.  So far, the work to integrate the two
hasn't been done.

The situation on hpux is even more confusing, but in every case
config.guess effectively returns the assembler level that the kernel
was built with (hppa1.0, hppa1.1, hppa2.0n, hppa2.0w or hppa64) when
doing native builds.  It doesn't provide the processor family, or
specific hardware model of the build system.

In summary, config.guess has always made decisions based on kernel
configuration as this affects what can be supported in user space.
I'm sure that there are many other applications that depend on
kernel configuration in both direct and subtle ways.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
