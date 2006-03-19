From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] Re: [fuse-devel] Example filesystem fail to
	init on parisc
Date: Sun, 19 Mar 2006 00:43:08 -0600
Message-ID: <1142750588.3773.26.camel__32692.6259826452$1416624588$gmane$org@mulgrave.il.steeleye.com>
References: <20060308071445.GA28275@pooh.bubble.frostnet.net>
	<E1FGwXn-0005Dh-00@dorka.pomaz.szeredi.hu>
	<20060309055002.GJ26474@pooh.bubble.frostnet.net>
	<E1FHKQR-0007JU-00@dorka.pomaz.szeredi.hu>
	<20060309223622.GP26474@pooh.bubble.frostnet.net>
	<E1FHfby-00052b-00@dorka.pomaz.szeredi.hu>
	<20060310230000.GX26474@pooh.bubble.frostnet.net>
	<E1FIlC6-0005ts-00@dorka.pomaz.szeredi.hu>
	<E1FJsHo-0006Yf-00@dorka.pomaz.szeredi.hu>
	<20060319043939.GP26474@pooh.bubble.frostnet.net>
Mime-Version: 1.0
Content-Type: text/plain
Cc: fuse-devel@lists.sourceforge.net,
 parisc-linux@parisc-linux.org,
 jick.nan@gmail.com,
 Miklos Szeredi <miklos@szeredi.hu>
To: Hugh Dickins <hugh@veritas.com>,
 Chris Frost <chris@frostnet.net>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060319043939.GP26474@pooh.bubble.frostnet.net>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, 2006-03-18 at 20:39 -0800, Chris Frost wrote:
> The kernel output on my parisc machine using copy_to/from_user2() is a bit
> different:

OK, I need Hugh's help on this one.

First of all, I've modified your copypage.c to be correct.  You need a
flush_kernel_dcache_page() within the kmap/kunmap (not
flush_dcache_page).

However, the problem appears to be that the user pointer is coming from
malloc'd memory, which is of type PAGE_MAPPING_ANON.  This flag ensures
that page_mapping(page) returns NULL and thus that flush_dcache_page()
on parisc never actually does any user space flushes.

The reason you see nothing when you cat /proc/fs/test is that these
PAGE_MAPPING_ANON pages for malloc() have a nice trick where the
clear_user_highpage() function blasts a string of zeros over them via
the cache in user space, so they're cache incoherent; you can modify the
underlying page as much as you like, but the data the user sees is the
zeros until the page is flushed.  This is the essence of the problem:
flush_dcache_page() isn't bringing these user pages back into coherency.

Just as proof of this, if you uncomment the asm in my_copy_to_user2,
you'll see everything work correctly, because this asm statement forces
coherency on the user page.

So, Hugh, you were the one who introduced this anonymous page behaviour;
how are we supposed to obtain coherency for these pages?

James

#include <linux/fs.h>
#include <linux/module.h>
#include <linux/proc_fs.h>
#include <linux/pagemap.h>
#include <asm/uaccess.h>

MODULE_LICENSE("GPL");

static int my_copy_to_user1(char __user *dst, const char *src, size_t size)
{
    return copy_to_user(dst, src, size) ? -EFAULT : 0;
}

static int my_copy_from_user1(char *dst, const char __user *src, size_t size)
{
    return copy_from_user(dst, src, size) ? -EFAULT : 0;
}

static int my_copy_to_user2(char __user *dst, const char *src, size_t size)
{
    int err;
    struct page *page;
    unsigned long addr = (unsigned long) dst;
    unsigned offset = addr % PAGE_SIZE;
    void *mapaddr;
    void *ptr;
    if (offset + size > PAGE_SIZE)
        return -EINVAL;

    down_read(&current->mm->mmap_sem);
    err = get_user_pages(current, current->mm, addr, 1, 1, 0, &page, NULL);
    up_read(&current->mm->mmap_sem);
    if (err < 0)
        return err;
    //__asm__ __volatile("\tfdc\t0(%%sr3, %0)\n" : : "r" (addr) : "memory");
    BUG_ON(err != 1);
    mapaddr = kmap_atomic(page, KM_USER0);
    ptr = mapaddr + offset;

    printk("dst: %p page: %p offset: %u mapaddr: %p ptr: %p\n",
           dst, page, offset, mapaddr, ptr);
    printk("mapping %p mapping_mapped %d\n", page->mapping,
	   page->mapping ? mapping_mapped(page->mapping): 0);

    memcpy(ptr, src, size);

    flush_kernel_dcache_page(mapaddr);
    kunmap_atomic(mapaddr, KM_USER0);

    set_page_dirty_lock(page);
    page_cache_release(page);

    return 0;
}

static int my_copy_from_user2(char *dst, const char __user *src, size_t size)
{
    int err;
    struct page *page;
    unsigned long addr = (unsigned long) src;
    unsigned offset = addr % PAGE_SIZE;
    void *mapaddr;
    void *ptr;
    if (offset + size > PAGE_SIZE)
        return -EINVAL;

    down_read(&current->mm->mmap_sem);
    err = get_user_pages(current, current->mm, addr, 1, 0, 0, &page, NULL);
    up_read(&current->mm->mmap_sem);
    if (err < 0)
        return err;
    BUG_ON(err != 1);
    mapaddr = kmap_atomic(page, KM_USER0);
    ptr = mapaddr + offset;

    printk("src: %p page: %p offset: %u mapaddr: %p ptr: %p\n",
           src, page, offset, mapaddr, ptr);

    memcpy(dst, ptr, size);

    kunmap_atomic(mapaddr, KM_USER0);
    put_page(page);

    return 0;
}


static ssize_t test_read(struct file *file, char __user *buf, size_t nbytes,
                         loff_t *off)
{
    ssize_t res = 0;
    char hello[] = "Hello!\n";
    size_t hellolen = strlen(hello);
    printk("test_read %p %lu %llu\n", buf, (unsigned long) nbytes,
           (unsigned long long) *off);
    if (!*off && nbytes > hellolen) {
        res = my_copy_to_user2(buf, hello, hellolen);
        if (!res) {
            *off += hellolen;
            res = hellolen;
        }
    }
    printk("  test_read: %li\n", (long) res);
    return res;
}

static ssize_t test_write(struct file *file, const char __user *buf,
                          size_t nbytes, loff_t *off)
{
    ssize_t res = nbytes;
    char hello[32];
    printk("test_write %p %lu %llu\n", buf, (unsigned long) nbytes,
           (unsigned long long) *off);
    if (!*off && nbytes < sizeof(hello) - 1) {
        res = my_copy_from_user2(hello, buf, nbytes);
        if (!res) {
            hello[nbytes] = '\0';
            printk("<%s>\n", hello);
            *off += nbytes;
            res = nbytes;
        }
    }
    printk("  test_write: %li\n", (long) res);
    return res;
}

static struct file_operations test_ops = {
	.owner		= THIS_MODULE,
	.read		= test_read,
	.write		= test_write,
};

static int test_init(void)
{
    struct proc_dir_entry *ent;
    ent = create_proc_entry("test", S_IFREG | 0666, proc_root_fs);
    if (ent)
        ent->proc_fops = &test_ops;
    return 0;
}

static void test_exit(void)
{
    remove_proc_entry("test", proc_root_fs);
}

module_init(test_init);
module_exit(test_exit);


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
