From: Helge Deller <deller@gmx.de>
Subject: Re: Change call ABI on PA-RISC
Date: Sun, 13 Nov 2016 19:37:59 +0100
Message-ID: <bf499ea2-6148-9cf8-eba3-b0f6de5cf309@gmx.de>
References: <0E3ABDFC-D082-4DA8-9D5B-12FC7E95335F@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Cc: "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
        List <linux-parisc@vger.kernel.org>, Jeff Law <law@redhat.com>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <0E3ABDFC-D082-4DA8-9D5B-12FC7E95335F@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 12.11.2016 19:00, John David Anglin wrote:
> I'm thinking about adding a "-mabi=" option to change the call ABI.  Currently, objects larger than 64 bits
> in the 32-bit runtime are passed by reference and the callee copies the object when necessary.  This is
> opposite to x86 where the caller does the copies.  Most targets are caller copies.
> 
> The problem with callee copies is that it doesn't work with openmp.  There are race problems and sometimes
> we get internal compiler errors with openmp code due to this problem.  This became apparent when new testcases
> were added to gcc-6.  It's tough to fix this problem in gcc.
> 
> This is gcc PR:
> <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68733>.
> 
> This is fixed if we change abi to caller copies (maybe "-mabi=gnu" and "-mabi=hp").  The default could be set
> by a configure options.  Probably, we would want the new gnu abi on linux as the default.  However, there is
> the potential to break stuff during the migration to the new abi.
> 
> Opinions?

PA-RISC Linux is a niche platform. We always had problems with platform-specifics
which were different to the more widely-used platforms (e.g. stack-grows-upwards, 
more signal numbers (>32) than other platforms, EWOULDBLOCK != EAGAIN, ...).
That said, I like your proposal if we then gain openmp support and if it doesn't
heavily breaks other stuff.

If you are going to change the ABI, maybe we can add more things as well?
Which comes to my mind here is for example an optimized mcount() function 
which allows changing the return pointer (see -mmcount-ra-address on MIPS) ?

Helge
