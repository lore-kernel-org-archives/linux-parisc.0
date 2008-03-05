From: Stuart Brady <sdbrady@ntlworld.com>
Subject: Segfault when ogg123 exits
Date: Wed, 5 Mar 2008 21:31:28 +0000
Message-ID: <20080305213128.GA27120@miranda.arrow>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi,

It seems ogg123 segfaults when it finishes playing.  Note that I'm not
pressing ^C -- I'm not even sure whether the "^C bug" is still around.
>From the backtrace, it looks like this may well be the same problem I
reported with SDL_Quit() and timer_create():

#0  0x00000000 in ?? ()
#1  0x400a7aac in _dl_close_worker () from /lib/ld.so.1
#2  0x400a7c08 in _dl_close () from /lib/ld.so.1
#3  0x400190dc in dlclose_doit () from /lib/libdl.so.2
#4  0x400a1834 in _dl_catch_error () from /lib/ld.so.1
#5  0x40019590 in _dlerror_run () from /lib/libdl.so.2
#6  0x40019118 in dlclose () from /lib/libdl.so.2
#7  0x402f9ffc in ao_shutdown () from /usr/lib/libao.so.2
#8  0x40c57bd4 in exit () from /lib/libc.so.6
#9  0x000182fc in main ()

Would any glibc hackers feel like taking a closer look at this?

Cheers,
-- 
Stuart Brady
