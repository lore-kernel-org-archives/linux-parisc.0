From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] Re: Comments?
Date: Wed, 23 Mar 2005 17:29:22 +0000
Message-ID: <20050323172922.GK21986@parcelfarce.linux.theplanet.co.uk>
References: <20050314132842.GE28289@tausq.org>
	<200503220225.j2M2PD6E010193@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200503220225.j2M2PD6E010193@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Mar 21, 2005 at 09:25:13PM -0500, John David Anglin wrote:
> I got a bit paranoid about __put_user after the above bug.  Looking at
> it, I believe that the LP64 version is broken for *(ptr) types of long,
> unsigned long, and pointer types.  I believe that the current code
> puts a 64-bit value instead of the 32-bit value that the 32-bit runtime
> expects for these types.  This is fixed by adding a layer over the
> old __put_user macro to do various type checking.

Hum.  It's definitely a tricky problem.  On its face, you're right;
we shouldn't be writing 64-bit values to a 32-bit userspace.  However,
the compatibility layers often do something like:

asmlinkage int sys32_sendfile64(int out_fd, int in_fd, compat_loff_t __user *off
set, s32 count)
{
        mm_segment_t old_fs = get_fs();
        int ret;
        loff_t lof;
        if (offset && get_user(lof, offset))
                return -EFAULT;
        set_fs(KERNEL_DS);
        ret = sys_sendfile64(out_fd, in_fd, offset ? (loff_t __user *)&lof : NUL
L, count);
        set_fs(old_fs);
        if (offset && put_user(lof, offset))
                return -EFAULT;
        return ret;
}

Then sys_sendfile64() will do a put_user() to write to the loff_t variable,
and writing a 32-bit value to that would definitely be the wrong thing to do.

> The rest of the changes are just warning fixes that I noticed during
> testing.  I don't believe that they have a functional effect.

Those warnings are reminders that nobody's audited this code for ioremap
compatibility:

/*
 * Memory mapped I/O
 *
 * readX()/writeX() do byteswapping and take an ioremapped address
 * __raw_readX()/__raw_writeX() don't byteswap and take an ioremapped address.
 * gsc_*() don't byteswap and operate on physical addresses;
 *   eg dev->hpa or 0xfee00000.
 */

Maybe I need more verbiage in here for people who're tempted to fix these
warnings with more casts, but I doubt people would read it anyway ...

> I tested this with 32 and 64-bit builds of 2.6.12-rc1-pa1 with the
> default c3000 and 64 configs.  I am running the 32-bit build and a
> slighter earlier version survived a gcc build.  I haven't run the
> 64-bit changes.  I now don't see any cast related errors in the builds
> except one in a call to atomic_read.  That's an unrelated problem.

Someone else is fixing that -- in XFS or ieee1394, right?

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
