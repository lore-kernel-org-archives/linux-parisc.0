Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA05444
	for <parisc-linux@puffin.external.hp.com>; Tue, 22 Feb 2000 09:11:56 -0700
Message-Id: <200002221512.KAA24371@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] libgcc
To: willy@thepuffingroup.com
Date: Tue, 22 Feb 2000 10:12:37 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <20000221173452.C9944@thepuffingroup.com> from "willy@thepuffingroup.com" at Feb 21, 2000 05:34:52 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Yes, the HP loader defines this symbol.  It is used to access global
symbols.  If you are using ELF (GNU ld), this may not be defined.  I few
months ago I hacked the milli library to add this to libgcc.a.  However,
it really should be defined by the linker.

Dave

> 
> 
> I've committed some changes which should allow gcc to build libgcc.a.
> Compilation stops when trying to test libgcc:
> 
> Testing libgcc1.  Ignore linker warning messages.
> /mnt/home/willy/cvs/gcc-build/gcc/xgcc -B/mnt/home/willy/cvs/gcc-build/gcc/ -B/home/willy/gcc/hppa1.1-linux/bin/ -I/home/willy/gcc/hppa1.1-linux/include -DCROSS_COMPILE -DIN_GCC  -DMULTIBYTE_CHARS=1   -g -O2  -I./include  libgcc1-test.o -o libgcc1-test \
>   -nostartfiles -nostdlib `/mnt/home/willy/cvs/gcc-build/gcc/xgcc -B/mnt/home/willy/cvs/gcc-build/gcc/ -B/home/willy/gcc/hppa1.1-linux/bin/ -I/home/willy/gcc/hppa1.1-linux/include --print-libgcc-file-name`
> libgcc1-test.o: In function `main_without__main':
> /mnt/home/willy/cvs/gcc-build/gcc/../../gcc/gcc/libgcc1-test.c:20: undefined reference to `$global$'
> collect2: ld returned 1 exit status
> 
> I don't see $global$ defined anywhere.  Is this something which ld should
> be fixing-up and isn't?
> 
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
> 
> 


-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
