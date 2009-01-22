From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: Confusion in usr/include/asm-generic/fcntl.h
Date: Wed, 21 Jan 2009 18:56:11 -0800
Message-ID: <4977E04B.2040104@zytor.com>
References: <20090122025209.307E54F30@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: grundler@parisc-linux.org, arnd@arndb.de, davem@davemloft.net,
	jaswinder@kernel.org, mingo@elte.hu, x86@kernel.org,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090122025209.307E54F30@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

John David Anglin wrote:
> 
> Unfortunately, this decision was made years ago...
> 
> dave@mx3210:~$ uname -m
> parisc64
> dave@hiauly6:~/gnu/gcc-4.4/gcc$ uname -m
> parisc
> 
> The only significant difference between the above two machines is that
> mx3210 is running a 64-bit kernel and hiauly6 is running a 32-bit kernel.
> Both are PA 2.0 machines.  Some PA 2.0 machines can only run 64-bit
> kernels.  The workstations can typically run both.
> 
> The issue for user space is that 64-bit kernels can support both 32 and
> 64-bit applications.  This affects build scripts and make files.  The
> default machine selected by config.guess for parisc64 is hppa64.
> Separate applications provide 32-bit and 64-bit support in binutils, 
> cc and gdb.  hppa64 selects 64-bit support when build these applications.
> So, if you want a 32-bit compiler, you need to explicitly override
> the default chosen by config.guess.
> 

That's fine... the whole point is that it should not depend on kernel
CONFIG_* macros.  Depending on uname is a user-space decision, no issue
there.

	-hpa

-- 
H. Peter Anvin, Intel Open Source Technology Center
I work for Intel.  I don't speak on their behalf.

