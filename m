From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: parisc 4.13-git, BUG: sleeping function called from invalid
 context at mm/slab.h:416
Date: Sun, 30 Jul 2017 08:30:48 -0700
Message-ID: <1501428648.3670.1.camel@HansenPartnership.com>
References: <alpine.LRH.2.20.1707292206210.12687@math.ut.ee>
         <CEB1A532-3AAD-4A4D-9A34-12A2477BE87F@bell.net>
         <alpine.LRH.2.20.1707300947250.27473@math.ut.ee>
         <F79536F1-AB2B-435C-A127-A1DFB4AC9CE0@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@bell.net>,
        Meelis Roos <mroos@linux.ee>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <F79536F1-AB2B-435C-A127-A1DFB4AC9CE0@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 2017-07-30 at 08:27 -0400, John David Anglin wrote:
> On 2017-07-30, at 2:47 AM, Meelis Roos wrote:
> 
> > 
> > > 
> > > > 
> > > > [    1.940000]  [<000000004011b4a4>]
> > > > pdc_stable_init+0x2c4/0x458
> > > 
> > > I don't see this symbol in my build.  I see
> > > pdc_stable_initialize.
> > > 
> > > Do you have a patch installed?
> > 
> > No, pristine v4.13-rc2-110-g0b5477d9dabd git.
> 
> 
> James is correct about pdc_stable_init.  It is enabled by
> CONFIG_PDC_STABLE.
> 
> In the backtrace,
> 
> [    1.936053] BUG: sleeping function called from invalid context at
> mm/slab.h:416
> [    1.936243] in_atomic(): 1, irqs_disabled(): 0, pid: 1, name:
> swapper/0
> [    1.936601] CPU: 2 PID: 1 Comm: swapper/0 Not tainted 4.13.0-rc2-
> 00110-g0b5477d9dabd #111
> [    1.936828] Backtrace:
> [    1.936889]  [<0000000040217ac8>] show_stack+0x20/0x38
> [    1.939036]  [<00000000406fbbb0>] dump_stack+0xb0/0x128
> [    1.939174]  [<0000000040274090>] ___might_sleep+0x180/0x1b8
> [    1.940000]  [<0000000040274144>] __might_sleep+0x7c/0xe8
> [    1.940000]  [<0000000040373874>] kmem_cache_alloc+0x14c/0x1e0
> [    1.940000]  [<0000000040419514>] __kernfs_new_node+0x84/0x1b8
> [    1.940000]  [<000000004041b09c>] kernfs_new_node+0x3c/0x78
> [    1.940000]  [<000000004041e040>] kernfs_create_link+0x40/0xd8
> [    1.940000]  [<000000004041f320>]
> sysfs_do_create_link_sd.isra.0+0xb0/0x130
> [    1.940000]  [<000000004041f3d4>] sysfs_create_link+0x34/0x58
> [    1.940000]  [<000000004011b4a4>] pdc_stable_init+0x2c4/0x458
> 
> I don't know how we got to sysfs_create_link.  It is probably from
> here:
> 
>         /* Don't forget the root entries */
>         error = sysfs_create_group(stable_kobj, &pdcs_attr_group);
> 
> Presumably, this is the sleeping function but it's not clear how the
> incorrect context arises.
> 
> Maybe there is an errant spin_lock somewhere.  For example, see:
> https://lkml.org/lkml/2012/3/29/101
> It might be in a unrelated routine.
> 
> Since this code hasn't changed in a long time, it should be possible
> to bisect problem.

How about this?  There's no need to take the write lock when creating
links anyway.

James

---

diff --git a/drivers/parisc/pdc_stable.c b/drivers/parisc/pdc_stable.c
index 7147aa53e9a2..d7c88b1eaf06 100644
--- a/drivers/parisc/pdc_stable.c
+++ b/drivers/parisc/pdc_stable.c
@@ -331,13 +331,13 @@ pdcspath_hwpath_write(struct pdcspath_entry *entry, const char *buf, size_t coun
 	/* Now, dive in. Write back to the hardware */
 	pdcspath_store(entry);
 	
+	write_unlock(&entry->rw_lock);
+
 	/* Update the symlink to the real device */
 	sysfs_remove_link(&entry->kobj, "device");
 	ret = sysfs_create_link(&entry->kobj, &entry->dev->kobj, "device");
 	WARN_ON(ret);
 
-	write_unlock(&entry->rw_lock);
-	
 	printk(KERN_INFO PDCS_PREFIX ": changed \"%s\" path to \"%s\"\n",
 		entry->name, buf);
 	
