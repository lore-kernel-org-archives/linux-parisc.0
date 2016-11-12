From: John David Anglin <dave.anglin@bell.net>
Subject: Change call ABI on PA-RISC
Date: Sat, 12 Nov 2016 13:00:10 -0500
Message-ID: <0E3ABDFC-D082-4DA8-9D5B-12FC7E95335F@bell.net>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Cc: "linux-parisc@vger.kernel.org List" <linux-parisc@vger.kernel.org>,
        Jeff Law <law@redhat.com>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

I'm thinking about adding a "-mabi=" option to change the call ABI.  Currently, objects larger than 64 bits
in the 32-bit runtime are passed by reference and the callee copies the object when necessary.  This is
opposite to x86 where the caller does the copies.  Most targets are caller copies.

The problem with callee copies is that it doesn't work with openmp.  There are race problems and sometimes
we get internal compiler errors with openmp code due to this problem.  This became apparent when new testcases
were added to gcc-6.  It's tough to fix this problem in gcc.

This is gcc PR:
<https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68733>.

This is fixed if we change abi to caller copies (maybe "-mabi=gnu" and "-mabi=hp").  The default could be set
by a configure options.  Probably, we would want the new gnu abi on linux as the default.  However, there is
the potential to break stuff during the migration to the new abi.

Opinions?

Dave
--
John David Anglin	dave.anglin@bell.net



