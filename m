From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: Segfault when ogg123 exits
Date: Mon, 10 Mar 2008 20:39:12 -0400
Message-ID: <119aab440803101739l778c3220w9102f6d814839694@mail.gmail.com>
References: <20080305213128.GA27120@miranda.arrow>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org
To: "Stuart Brady" <sdbrady@ntlworld.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080305213128.GA27120@miranda.arrow>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Mar 5, 2008 at 5:31 PM, Stuart Brady <sdbrady@ntlworld.com> wrote:
>  It seems ogg123 segfaults when it finishes playing.  Note that I'm not
>  pressing ^C -- I'm not even sure whether the "^C bug" is still around.
>  From the backtrace, it looks like this may well be the same problem I
>  reported with SDL_Quit() and timer_create():
>
>  #0  0x00000000 in ?? ()
>  #1  0x400a7aac in _dl_close_worker () from /lib/ld.so.1
>  #2  0x400a7c08 in _dl_close () from /lib/ld.so.1
>  #3  0x400190dc in dlclose_doit () from /lib/libdl.so.2
>  #4  0x400a1834 in _dl_catch_error () from /lib/ld.so.1
>  #5  0x40019590 in _dlerror_run () from /lib/libdl.so.2
>  #6  0x40019118 in dlclose () from /lib/libdl.so.2
>  #7  0x402f9ffc in ao_shutdown () from /usr/lib/libao.so.2
>  #8  0x40c57bd4 in exit () from /lib/libc.so.6
>  #9  0x000182fc in main ()
>
>  Would any glibc hackers feel like taking a closer look at this?

Can you distill this into a smaller testcase? Maybe a call to dlopen()
to load a library that has a function called by timer_create?

Cheers,
Carlos.
