From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: Comments?
Date: Wed, 23 Mar 2005 15:53:11 -0500 (EST)
Message-ID: <200503232053.j2NKrBsR026378@hiauly1.hia.nrc.ca>
References: <20050323172922.GK21986@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: matthew@wil.cx (Matthew Wilcox)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050323172922.GK21986@parcelfarce.linux.theplanet.co.uk> from
	"Matthew Wilcox" at Mar 23, 2005 05:29:22 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > I got a bit paranoid about __put_user after the above bug.  Looking at
> > it, I believe that the LP64 version is broken for *(ptr) types of long,
> > unsigned long, and pointer types.  I believe that the current code
> > puts a 64-bit value instead of the 32-bit value that the 32-bit runtime
> > expects for these types.  This is fixed by adding a layer over the
> > old __put_user macro to do various type checking.
> 
> Hum.  It's definitely a tricky problem.  On its face, you're right;
> we shouldn't be writing 64-bit values to a 32-bit userspace.  However,
> the compatibility layers often do something like:
> 
> asmlinkage int sys32_sendfile64(int out_fd, int in_fd, compat_loff_t __user *off
> set, s32 count)
> {
>         mm_segment_t old_fs = get_fs();
>         int ret;
>         loff_t lof;
>         if (offset && get_user(lof, offset))
>                 return -EFAULT;
>         set_fs(KERNEL_DS);
>         ret = sys_sendfile64(out_fd, in_fd, offset ? (loff_t __user *)&lof : NUL
> L, count);
>         set_fs(old_fs);
>         if (offset && put_user(lof, offset))
>                 return -EFAULT;
>         return ret;
> }
> 
> Then sys_sendfile64() will do a put_user() to write to the loff_t variable,
> and writing a 32-bit value to that would definitely be the wrong thing to do.

I don't believe that the proposed change would do that.  In this case,
the type of *(ptr) is long long (s64).  This is one of the special cases
in the __LP64__ __builtin_choose_expr check.  If we have a 64-bit value
that is 64-bits in the 32-bit runtime (long long, unsigned long long
or double), we don't cast the pointer (i.e., it still points to a 64-bit
type).  I used s64 and u64 to shorten the line length in the macro.
They are defined as long long and unsigned long long.

__builtin_types_compatible_p is strict in determining whether two
types are compatible.  For example, a long is not compatible with a
long long even though they have the the same size in hppa64.  Similarly,
a char * and int * are not compatible.  I checked the long versus
long long compatibility under hpux.

There are definitely places where put_user is used to put pointers.
I believe that there also some places where a long is transferred.

The put_user uses with pointers cause warnings in 32-bit builds
because the u64 cast in the following code snippet

#define __put_kernel_asm64(__val,ptr) do {                  \
        u64 __val64 = (u64)__val;                           \

is undefined (it's not defined in the C standard how the pointer
should be extended).  As I tried to indicate in my previous mail,
this isn't a real problem as this code patch isn't used in this
case.  GCC should delete the code but there may be problems in doing
this before the warning is generated.  I like to eliminate warnings
such as this as they could easily be real problems.

Here is a place in arch/parisc/kernel/signal.c where there is a
problem with transferring a pointer:

          err |= __put_user(current->sas_ss_size, &frame->uc.uc_stack.ss_s

The type of ss_sp is void *.  There are also similar problems in
kernel/signal.c (si_ptr and si_addr).  In this case, the current version
of put_user will transfer 64-bits when using a hppa64 kernel.

> > The rest of the changes are just warning fixes that I noticed during
> > testing.  I don't believe that they have a functional effect.
> 
> Those warnings are reminders that nobody's audited this code for ioremap
> compatibility:

Ok :(

> Someone else is fixing that -- in XFS or ieee1394, right?

These are the warnings that I was referring to:

  CC [M]  fs/xfs/xfs_inode_item.o
fs/xfs/xfs_inode_item.c: In function `xfs_inode_item_pushbuf':
fs/xfs/xfs_inode_item.c:803: warning: passing arg 1 of `atomic_read' from incompatible pointer type
fs/xfs/xfs_inode_item.c:825: warning: passing arg 1 of `atomic_read' from incompatible pointer type

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

#include <stdio.h>
int
main ()
{
  printf ("%d\n", __builtin_types_compatible_p (long, long long));
  return 0;
}

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
