From: "Thibaut VARENE" <T-Bone@parisc-linux.org>
Subject: Re: [parisc-linux] Kernel crash while running glibc's make check
Date: Sun, 27 Aug 2006 22:30:17 +0200
Message-ID: <7d01f9f00608271330m2f75bd66u62b4e87c28205779@mail.gmail.com>
References: <20060827180534.GB28838@titanium.v3.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: "Jeff Bailey" <jbailey@raspberryginger.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060827180534.GB28838@titanium.v3.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 8/27/06, Jeff Bailey <jbailey@raspberryginger.com> wrote:
> Hi!  As an attempt to help the glibc/NPTL efforts, I've upgraded to a
> recent kernel in order to make sure problems I'm seeing that are
> triggered by kernel bugs haven't already been fixed.  However, I can no
> longer make it through a glibc make check pass.
>
> I have reproduced this twice now, and both times it happens while
> running the tst-gettext4.sh script.  It doesn't seem to matter whether
> the system has a long or short uptime, or the amount of work done.
>
> Bug report particulars follow:
>
> $ uname -a
> Linux test148.lamont 2.6.18-rc4-pa4 #2 Sat Aug 26 08:52:30 EDT 2006 parisc GNU/Linux
>
> This is using the current gcc-4.1 in edgy with a binutils snapshot from
> mid-July.

Totally out of curiosity, if you have a chance to rebuild your kernel
with gcc-3.X and see if it dies the same way. I've been spotting some
strange variations between kernels built with gcc-3.X and gcc-4.X...

> I am using a serial console.
>
> jbailey@test148:/var/lib/dpkg/info$ cat /proc/cmdline
> root=/dev/sda5 HOME=/ console=ttyS0 TERM=vt102 palo_kernel=2/vmlinuz-2.6.18-rc4-pa4
>
> Noise from the console:
>
> test148.lamont login: kernel BUG at mm/mmap.c:1970!
> Backtrace:
>  [<1015cd58>] exit_mmap+0x17c/0x19c
>  [<10123a70>] mmput+0x48/0xbc
>  [<10128f18>] do_exit+0x114/0x8ac
>  [<10129728>] do_group_exit+0x78/0xbc
>  [<101348c0>] get_signal_to_deliver+0x2c8/0x4cc
>  [<1010fab0>] do_signal+0x68/0x814
>  [<1010c384>] syscall_do_signal+0x54/0xa0
> Kernel panic - not syncing: BUG!

Died in signal code, why am I not surprised? ;)

>  <3>BUG: scheduling while atomic: ld.so.1/0x00000100/10062
> Backtrace:
>  [<101023a0>] schedule+0x538/0x724
>  [<10138e48>] flush_cpu_workqueue+0xa0/0xf0
>  [<10138ee4>] cancel_rearming_delayed_workqueue+0x28/0x60
>  [<10231750>] lcd_print+0x58/0x178
>  [<10232c44>] process_shutdown+0x3c/0x6c
>  [<1012c33c>] tasklet_action+0x6c/0xf4
>  [<1012c198>] __do_softirq+0xd8/0xec
>  [<10104670>] __lock_text_end+0x48/0x4c
>  [<1010b068>] intr_return+0x0/0xc

This is unrelated. For some reason the led/lcd tasklet doesn't
'shutdown' properly on panic. I wonder if it's hooked to the panic
handler correctly (if it should)...

-- 
Thibaut VARENE
http://www.parisc-linux.org/~varenet/

<jbailey> Insert tab A into slot B doesn't take too long to figure
out.  Leave a couple horny kids in a room for an hour, they don't need
instructions.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
