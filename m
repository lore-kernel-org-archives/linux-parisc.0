From: Matthew Wilcox <willy@debian.org>
Subject: Re: [parisc-linux] Improper use of __xchg?
Date: Sat, 19 Jun 2004 20:40:45 +0100
Message-ID: <20040619194045.GP20511@parcelfarce.linux.theplanet.co.uk>
References: <20040619192039.GA8368@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040619192039.GA8368@baldric.uwo.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Jun 19, 2004 at 03:20:39PM -0400, Carlos O'Donell wrote:
> Someone with the notion of said functions semantics might be willing to
> produce the correct fix please? :)

"gcc is buggy" ;-)

> 64-bit kernel build (turned off loop.ko compilation)
> 
> carlos@firin:/mnt/flaire/src/linux-2.6$ make
> make[1]: `arch/parisc/kernel/asm-offsets.s' is up to date.
>   CHK     include/asm-parisc/offsets.h
>   CHK     include/linux/compile.h
>   GEN     .version
>   CHK     include/linux/compile.h
>   UPD     include/linux/compile.h
>   CC      init/version.o
>   LD      init/built-in.o
>   LD      .tmp_vmlinux1
> kernel/built-in.o(.text.put_files_struct+0x118): In function
> `put_files_struct':
> : undefined reference to `__xchg_called_with_bad_pointer'
> make: *** [.tmp_vmlinux1] Error 1
> carlos@firin:/mnt/flaire/src/linux-2.6$ 

It would be useful to confirm that the xchg() that's broken is the one in
close_files().  If it is, here's what's happening:

struct files_struct * files;
struct file * file = xchg(&files->fd[i], NULL);

The xchg() expands through:

#define xchg(ptr,x) \
	((__typeof__(*(ptr)))__xchg((unsigned long)(x),(ptr),sizeof(*(ptr))))

The third argument to __xchg() is therefore:

	sizeof(*(&files->fd[i]))
ie
	sizeof(file->fd[i])

struct files_struct {
        struct file ** fd;      /* current fd array */
}

So sizeof(file->fd[i]) should be sizeof(struct file *).  If that's not 8,
something is indeed broken and this trick has saved you from booting a
broken kernel ;-)

Care to produce a test-case?

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
