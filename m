From: "Jeff Bailey" <jbailey@raspberryginger.com>
Subject: Re: [parisc-linux] fstatat64 and newfstatat syscalls
Date: Sun, 24 Dec 2006 13:19:59 -0500
Message-ID: <5b2e36650612241019i7ad750a7v6c26a722972e09e1__43922.1276705668$1416624239$gmane$org@mail.gmail.com>
References: <200612230049.41484.deller@gmx.de>
	 <200612230054.34497.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=UTF-8;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: "Helge Deller" <deller@gmx.de>
Return-Path: <jbailey@raspberryginger.com>
In-Reply-To: <200612230054.34497.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>

On 22/12/06, Helge Deller <deller@gmx.de> wrote:
> > but currently we have:
> > arch/parisc/kernel/syscall_table.S:           ENTRY_SAME(fstatat64)           /* 280 */
> > while in:
> > include/asm-parisc/unistd.h:                  #define __NR_newfstatat         (__NR_Linux + 280)
>
> I think the right solution is to change current line in unistd.h to this:
> include/asm-parisc/unistd.h:                    #define __NR_fstatat64         (__NR_Linux + 280)

Umm, isn't this a public ABI change?  would it be better to assign a
new syscall number and cope correctly with the old one?

I'm wondering what this means to things that are already compiled...

-- 
Jeff Bailey - http://www.raspberryginger.com/jbailey/
