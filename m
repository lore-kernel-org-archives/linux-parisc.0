From: Stuart Brady <sdbrady@ntlworld.com>
Subject: Re: Segfault when using SDL with POSIX timers
Date: Mon, 3 Mar 2008 18:27:47 +0000
Message-ID: <20080303182747.GA23279@miranda.arrow>
References: <20080303044727.GA22047@miranda.arrow>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080303044727.GA22047@miranda.arrow>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Here's a better backtrace, produced with libc6-dbg installed:

#0  0x00000000 in ?? ()
#1  0x402b7aac in _dl_close_worker () from /lib/ld.so.1
#2  0x402b7c08 in _dl_close () from /lib/ld.so.1
#3  0x400690dc in dlclose_doit () from /lib/libdl.so.2
#4  0x402b1834 in _dl_catch_error () from /lib/ld.so.1
#5  0x40069590 in _dlerror_run () from /lib/libdl.so.2
#6  0x40069118 in dlclose () from /lib/libdl.so.2
#7  0x407737f4 in ?? () from /usr/lib/libSDL-1.2.so.0
#8  0x40769ff8 in SDL_VideoQuit () from /usr/lib/libSDL-1.2.so.0
#9  0x4073cc78 in SDL_QuitSubSystem () from /usr/lib/libSDL-1.2.so.0
#10 0x4073cd20 in SDL_Quit () from /usr/lib/libSDL-1.2.so.0
#11 0x000109d4 in main ()

The double-free when using SDL's parachute seems to be a red-herring --
SDL_Quit is called a second time, in response to the segfault, and that
causes the double-free.

BTW, tausq has pointed out that there's no crash if SDL_INIT_VIDEO is
dropped from the call to SDL_Init().  I've also found that it does not
segfault when using the fbdev with SDL_VIDEODRIVER set to directfb or
fbcon -- but it does segfault when using the x11 driver, which I what
I had originally tried.

Any idea what could be going wrong in dlclose()?
-- 
Stuart Brady
