Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 12EB9482A
	for <parisc-linux@lists.parisc-linux.org>; Sun,  2 Sep 2001 22:16:42 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15dlA8-0008Uv-00; Mon, 03 Sep 2001 05:16:40 +0100
Date: Mon, 3 Sep 2001 05:16:40 +0100
From: Matthew Wilcox <willy@debian.org>
To: Admin <admin@inane.demon.co.uk>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] system calls
Message-ID: <20010903051640.A5126@parcelfarce.linux.theplanet.co.uk>
References: <001401c1342e$66f29b40$1500000a@lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <001401c1342e$66f29b40$1500000a@lan>; from admin@inane.demon.co.uk on Mon, Sep 03, 2001 at 05:10:34AM +0100
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Sep 03, 2001 at 05:10:34AM +0100, Admin wrote:
> How does PA-RISC trap to the OS during syscalls.
> 
> x86 uses trapgates and long-jumps, sparc uses traps and MIPs uses jumps.
> 
> I'm wondering what the set of instructions are to initiate a system call.

we use a gateway page in a different space.  Here's glibc's implementation
of syscall:

int
syscall (int sysnum, int arg0, int arg1, int arg2, int arg3, int arg4, int arg5)
{
  long __sys_res;
  {
    register unsigned long __res asm("r28");
    LOAD_ARGS_6(arg0, arg1, arg2, arg3, arg4, arg5)
      asm volatile ("ble  0x100(%%sr2, %%r0)\n\t"
                    "copy %1, %%r20"
                    : "=r" (__res)
                    : "r" (sysnum) ASM_ARGS_6);
    __sys_res = __res;
  }
  if ((unsigned long) __sys_res >= (unsigned long)-4095)
    {
    __set_errno(-__sys_res);
    __sys_res = -1;
  }
  return __sys_res;
}

if you're interested in discussion of what/how/why/etc, there's lots of
material in the mailing list archives going all the way back to 99.

-- 
Revolutions do not require corporate support.
