From: Helge Deller <deller@gmx.de>
Subject: Re: C3600 kernel/64bit 4.* slow IO due to -mlong-calls
Date: Thu, 15 Mar 2018 21:43:03 +0100
Message-ID: <d637ebd1-db27-585b-c324-0e02baf8c8b2@gmx.de>
References: <CA+QBN9C=wHxV5Y=SSt2UB_4b1H_Nx1mZxZu3rvuTY2wRe=GWBw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: linux-parisc <linux-parisc@vger.kernel.org>
To: debian-hppa@lists.debian.org
Return-path: <bounce-debian-hppa=debian-hppa=m.gmane.org@lists.debian.org>
In-Reply-To: <CA+QBN9C=wHxV5Y=SSt2UB_4b1H_Nx1mZxZu3rvuTY2wRe=GWBw@mail.gmail.com>
Resent-Message-ID: <ZfrmSjvDcdG.A.0_.rrtqaB@bendel>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-URL: <https://lists.debian.org/debian-hppa/>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/d637ebd1-db27-585b-c324-0e02baf8c8b2@gmx.de

Hi Carlo,

On 15.03.2018 16:36, Carlo Pisani wrote:
> I am experiencing a very annoying behavior with my HPPA C3600: if I
> compile the (linux) kernel with  -mlong-calls then the IO (e.g. file
> copy) becomes very slow, and the PCI becomes unstable (i.e. it crashes
> the machine)
> 
> kernel  gcc     binutils    with mlong    without mlong
> 4.15.7  4.9.3   2.25.1     13.4 MB/s    27.0 MB/s
> 4.15.7  6.4.0   2.25.1     13.4 MB/s    27.0 MB/s
> 4.15.7  6.4.0   2.29.1     14.4 MB/s    25.0 MB/s

Interesting bad results!
 
> these tests were performed with
> 
> dd if=/dev/zero of=here bs=1k count=100000
> 
> -mlong-calls is enabled in the kernel by "CONFIG_MLONGCALLS"

I think nobody else noticed the bad performance due to CONFIG_MLONGCALLS yet.
I've now started some testing if we can disable that option on the debian
kernels...

> the help-guide says "If you configure the kernel to include many
> drivers built-in instead as modules, the kernel executable may become
> too big, so that the linker will not be able to resolve some long
> branches and fails to link your vmlinux kernel. In that case enabling
> this option will help you to overcome this limit by using the
> -mlong-calls compiler option. Usually you want to say N here, unless
> you e.g. want to build a kernel which includes all necessary drivers
> built-in and which can be used for TFTP booting without the need to
> have an initrd ramdisk. Enabling this option will probably slow down
> your kernel"
> 
> I need -mlong-calls because I need to compile the kernel without
> kernel-modules

Why?

> all built-in, that makes the size of the kernel of
> about 23Mbytes, thus without -mlong-calls the linker fails to "link"
> objects
> 
> let me know

I'm not sure what kind of help you expect here?
The only option I see is that you try to disable some options (modules) you won't
need and thus reduce the kernel size. xfs, ipv6 and such are good candidates.
Or use a 32bit kernel ?

Helge
