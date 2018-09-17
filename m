From: Helge Deller <deller@gmx.de>
Subject: Re: [RFC] parisc64: change __kernel_suseconds_t to match glibc
Date: Mon, 17 Sep 2018 21:46:54 +0200
Message-ID: <de79d285-7cbc-e547-547b-cf3e0627950d@gmx.de>
References: <20180913160010.905798-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: y2038@lists.linaro.org, Thomas Gleixner <tglx@linutronix.de>,
        linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>,
        "James E.J. Bottomley" <jejb@parisc-linux.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180913160010.905798-1-arnd@arndb.de>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Arnd,

On 13.09.2018 17:59, Arnd Bergmann wrote:
> There are only two 64-bit architecture ports that have a 32-bit
> suseconds_t: sparc64 and parisc64. I've encountered a number of problems
> with this, while trying to get a proper 64-bit time_t working on 32-bit
> architectures. Having a 32-bit suseconds_t combined with a 64-bit time_t
> means that we get extra padding in data structures that may leak kernel
> stack data to user space, and it breaks all code that assumes that
> timespec and timeval have the same layout.
> 
> While we can't change sparc64, it seems that glibc on parisc64 has always
> set suseconds_t to 'long', and the current version would give incorrect
> results for gettimeofday() and many other interfaces: timestamps passed
> from user space into the kernel result in tv_usec being always zero
> (the lower bits contain the intended value but are ignored) while data
> passed from the kernel to user space contains either zeroes or random
> data in tv_usec.

Should this wrong behavior be visible with 32-bit userspace or
with 64-bit userspace (or both)?
I didn't noticed such wrong behavior yet.

Can you suggest some test programs to verify?
LTP seems to be correct.
 
> Based on that, it seems best to change the user API in the kernel in
> an incompatible way to match what glibc expects.

Basically that sounds the right way to go, but as said before,
I didn't see such issues.

> Note that the distros I could find (gentoo and debian) all just
> have 32-bit user space, which does not suffer from this problem.

That's correct.
Kernel can be 32- or 64-bit, but userspace is currentl 32-bit only.

So, breaking any 64-bit userspace is OK, since we don't have it yet.
Breaking 32-bit userspace needs some thoughts...

Helge


> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/parisc/include/uapi/asm/posix_types.h | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/arch/parisc/include/uapi/asm/posix_types.h b/arch/parisc/include/uapi/asm/posix_types.h
> index 2785632c85e7..8dce56f5dcee 100644
> --- a/arch/parisc/include/uapi/asm/posix_types.h
> +++ b/arch/parisc/include/uapi/asm/posix_types.h
> @@ -16,9 +16,6 @@ typedef unsigned short		__kernel_mode_t;
>  typedef unsigned short		__kernel_ipc_pid_t;
>  #define __kernel_ipc_pid_t __kernel_ipc_pid_t
>  
> -typedef int			__kernel_suseconds_t;
> -#define __kernel_suseconds_t __kernel_suseconds_t
> -
>  typedef long long		__kernel_off64_t;
>  typedef unsigned long long	__kernel_ino64_t;
>  
> 
