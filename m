From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] New debian libc6 2.3.5: glibc bug or kernel bug???
Date: Thu, 11 Aug 2005 11:25:53 +0200
Message-ID: <IL1WV5$C263D00B95D5C9242114A7D700723650@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
To: "parisc-linux" <parisc-linux@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello all,

As many other reported, I encountered some pb with the recent upgrade of
debian unstable glibc.

Back from some kind holidays, I first tried to rebuild the recent cvs ker=
nel
2.6.13.

On my own c110, while I launched the 'make oldconfig', I noticed this abn=
ormal
(afaik user space wouldn't cause) panic with my custom kernel:
 kernel BUG at mm/mmap.c:????
Backtrace:
[<1015c5e8>] exit_mmap+0x1b8/0x1d8
[<10126614>] mmput+0x44/0xbc
[<1012a928>] do_exit+0xd4/0xa04
[<1012b2bc>] do_group_exit+0x64/0xcc
[<1010d12c>] syscall_exit+0x0/0x14

Kernel panic - not syncing: BUG!

Back to the office, on a d380 running a 2.6.12-pa1 (32bit up), I encounte=
red
the same kind of panic:

kernel BUG at /usr/src/linux-2.6.12-pa1-050620/mm/mmap.c:1937!
Backtrace:
 [<1015d510>] exit_mmap+0x190/0x1cc
 [<101249c4>] mmput+0x44/0xbc
 [<101292ec>] do_exit+0xc0/0x304
 [<101295a0>] do_group_exit+0x40/0xcc
 [<1010d12c>] syscall_exit+0x0/0x14

(fwiw no cpu status dump :-(  in the 2 case)

But I got very different results with other kernels:
    o on c110 with 2.6.8.1-pa7 the same 'make' did a 'Segmentation fault'=

    o on d380 with 2.6.10-pa11 (32bit up) the same 'Segmentation fault'
any way what is very weird:
    o on b2k with 2.6.11.12-pa4 (32bit gcc-4.0) no pb??? (I can update my=

system smoothly and rebuild the 2.6.13-rc6-pa1 without any pb with libc6
2.3.5-3). (btw boot fine on this system but panicing when 'make menuconfi=
g' too)

Any idea?

Thanks,
    Joel

ps: all system above mentioned are all unstable debian install today
dist-upgraded.




=0A=0A-------------------------------------------------------=0ANOTE! My =
email address is changing to ... @scarlet.be=0APlease make the necessary =
changes in your address book. =0A=0A

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
