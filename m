From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] Don't mlock guardpage if the stack is growing up
Date: Mon, 9 May 2011 08:57:56 -0700
Message-ID: <BANLkTinCUQSjjif3op3H_9HDm5Eu-o+Luw@mail.gmail.com>
References: <alpine.DEB.2.00.1105082045250.15552@artax.karlin.mff.cuni.cz>
 <alpine.LSU.2.00.1105081303540.16151@sister.anvils> <alpine.DEB.2.00.1105091307570.32299@artax.karlin.mff.cuni.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Hugh Dickins <hughd@google.com>, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	Michel Lespinasse <walken@google.com>,
	Oleg Nesterov <oleg@redhat.com>
To: Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1105091307570.32299@artax.karlin.mff.cuni.cz>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, May 9, 2011 at 4:12 AM, Mikulas Patocka
<mikulas@artax.karlin.mff.cuni.cz> wrote:
>
> See ./lib/mm/memlock.c in LVM2. It reads /proc/self/maps, parses the file
> and locks each map with mlock, except for glibc locale file.

Hmm. One thing that strikes me is this problem also implies that the
/proc/self/maps file is wrong for the GROWSUP case, isn't it?

So I think we should not just apply your lock fix, but then *also*
apply something like this:

    diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
    index 2e7addfd9803..080980880c7f 100644
    --- a/fs/proc/task_mmu.c
    +++ b/fs/proc/task_mmu.c
    @@ -214,7 +214,7 @@ static void show_map_vma(struct seq_file *m,
struct vm_area_struct *vma)
     	int flags = vma->vm_flags;
     	unsigned long ino = 0;
     	unsigned long long pgoff = 0;
    -	unsigned long start;
    +	unsigned long start, end;
     	dev_t dev = 0;
     	int len;

    @@ -227,13 +227,16 @@ static void show_map_vma(struct seq_file *m,
struct vm_area_struct *vma)

     	/* We don't show the stack guard page in /proc/maps */
     	start = vma->vm_start;
    -	if (vma->vm_flags & VM_GROWSDOWN)
    -		if (!vma_stack_continue(vma->vm_prev, vma->vm_start))
    -			start += PAGE_SIZE;
    +	if (stack_guard_page_growsdown(vma, start))
    +		start += PAGE_SIZE;
    +	end = vma->vm_end;
    +	if (stack_guard_page_growsup(vma, end))
    +		end -= PAGE_SIZE;
    +

     	seq_printf(m, "%08lx-%08lx %c%c%c%c %08llx %02x:%02x %lu %n",
     			start,
    -			vma->vm_end,
    +			end,
     			flags & VM_READ ? 'r' : '-',
     			flags & VM_WRITE ? 'w' : '-',
     			flags & VM_EXEC ? 'x' : '-',

NOTE! The above actually assumes that your
"stack_guard_page_growsup()" has been changed to actually take the
"next page" value, which I think makes more sense (ie it's the "end of
stack", the same way "stack_guard_page_growsdown()" address is).

Hmm? I don't have any growsup machine to test with, can you do that?

                        Linus
