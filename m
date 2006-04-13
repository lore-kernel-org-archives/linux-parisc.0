From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] linux-2.6 deller (2.6.17-rc1-pa2) breack 'DISCONTIG'
	mem ; -(
Date: Thu, 13 Apr 2006 13:28:07 +0100
Message-ID: <IXNUMV$DD7102BFD962611738B0B72A6FC9A3DB@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
To: "parisc-linux" <parisc-linux@lists.parisc-linux.org>
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

> CVSROOT:	/var/cvs
> Module name:	linux-2.6
> Changes by:	deller@cvs.parisc-linux.org	2006-04-12 12:50:38
> 
> Modified files:
> 	.              : Makefile 
> 
> Log message:
> 	2.6.17-rc1-pa2: some 16k page size work (still not functional)
> 
Hello Helge,

Just applying this patch (I mean pa1-pa2):
    * build fine on d380 (32bit smp kernel), b2k (64bit up) and n4k (64bi=
t smp)

    * boot fine on d380 and b2k

    * boot hang very early on n4k (sorry just have, even not full, msg):
[snip]
 model 9000/800/N4000-55
Memory Ranges:
 0) Start 0x0000000000000000 End 0x000000007fffffff Size   2048 MB
 1) Start 0x0000000180000000 End 0x00000001ffffffff Size   2048 MB
Total Memory: 4096 MB
Backtrace:
 [<000000001014356c>] release_console_sem+0x34c/0x3b0
 [<0000000010272620>] memset+0x40/0x8e0
 [<00000000103f3900>] csum_partial_copy_from_user+0x0/0xa0
 [<00000000103f31a8>] klist_remove+0x0/0x68
 [<00000000103f2f38>] klist_release+0x0/0x98
 [<00000000103f1978>] packet_release+0x0/0x380
 [<00000000103f0610>] packet_get

hang here while the boot of previous pa1 said:
model 9000/800/N4000-55
Memory Ranges:
 0) Start 0x0000000000000000 End 0x000000007fffffff Size   2048 MB
 1) Start 0x0000000180000000 End 0x00000001ffffffff Size   2048 MB
Total Memory: 4096 MB
SMP: bootstrap CPU ID is 0
Built 2 zonelists
[...]

I just rebuild the exactely same src but using flate mem in palce of disc=
ontig
mem and the kernel boot fine (obviously could just access 2 of the 4 Gb o=
f ram)

Hth,
    Joel

=0A=0A----------=0AWordt ook lid van de Scarlet Club via een bestaande Sc=
arlet klant en ontvang cadeaucheques twv EUR 50! Bezoek snel http://www.s=
carletclub.be=0ADevenez aussi membre du Club Scarlet via un client Scarle=
t existant et recevez des cheques cadeaux jusqu'a EUR 50! Surfez vite sur=
 http://www.clubscarlet.be

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
