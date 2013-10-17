From: John David Anglin <dave.anglin@bell.net>
Subject: parisc mmap: private file maps
Date: Thu, 17 Oct 2013 12:45:01 -0400
Message-ID: <BLU0-SMTP95AF0D680917EBD66DB24B97050@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
To: linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Currently, the perl testsuite fails the lib/locale.t test causing the
Debian package build to fail if tests are not disabled:
http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=721206

This is also perl bug #119567.

What happens is the test uses mmap to open a few hundred locale files
with MAP_PRIVATE:

...
open("/usr/lib/locale/de_LI.utf8/LC_ADDRESS", O_RDONLY|O_CLOEXEC) =  4
fstat64(4, {st_mode=0, st_size=0, ...}) = 0
mmap(NULL, 127, PROT_READ, MAP_PRIVATE, 4, 0) = 0xffe93000
close(4)                                = 0
open("/usr/lib/locale/de_LI.utf8/LC_NAME", O_RDONLY|O_CLOEXEC) = 4
fstat64(4, {st_mode=0, st_size=0, ...}) = 0
mmap(NULL, 62, PROT_READ, MAP_PRIVATE, 4, 0) = -1 ENOMEM (Cannot 
allocate memory)

As can be seen, these are all small maps.

However, in arch_get_unmapped_area(), we allocate a shared area for all file
maps:

static unsigned long get_shared_area(struct address_space *mapping,
                 unsigned long addr, unsigned long len, unsigned long pgoff)
{
         struct vm_unmapped_area_info info;

         info.flags = 0;
         info.length = len;
         info.low_limit = PAGE_ALIGN(addr);
         info.high_limit = TASK_SIZE;
         info.vm_unmapped_area = PAGE_MASK & (SHMLBA - 1);
         info.align_offset = (get_offset(mapping) + pgoff) << PAGE_SHIFT;
         return vm_unmapped_area(&info);
}

As can be seen, align_mask is set to "PAGE_MASK & (SHMLBA - 1)".  This is
0x3ff000. vm_unmapped_area() adds this to len when it allocates the area.
So, at a minimum, we allocate just under 4 MB for each file map and rapidly
run out of memory for private file maps.

This results from the PA8800/PA8900 aliasing requirements.

Aside from the limited number of private file maps, I'm not sure the current
implementation is correct.  In a private map, a write to the area is not 
supposed
to affect the underlying object, and I assume any other existing maps to the
object.  It's also undefined whether changes to the underlying object 
after the
mmap call are visible within the private map.

So, I'm thinking it would be better to just allocate an unshared area 
and copy
the file region to it.  But this seems ugly.

The other alternative is to change the align_mask and align_offset for 
private
maps in some way.  But this seems tricky given the aliasing 
requirements.  Maybe
the alignment requirements could be relaxed on processors where aliasing 
isn't an
issue.

Thoughts?

Dave

-- 
John David Anglin    dave.anglin@bell.net

