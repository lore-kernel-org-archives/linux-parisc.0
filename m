Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.planb.de (aldebaran.planb.de [212.227.14.26])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8AF93482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 22 Jan 2002 02:55:55 -0700 (MST)
Date: Tue, 22 Jan 2002 10:55:53 +0100
To: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] vmlinux header for savecrash.
Message-ID: <20020122105553.A5510@electra.intern.planb.de>
References: <3C4C53B7.67DA24E@admin.france.hp.com> <20020121202539.994A5482A@dsl2.external.hp.com> <3C4D2EFB.F82671C2@admin.france.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <3C4D2EFB.F82671C2@admin.france.hp.com>
From: Enrik Berkhan <Enrik.Berkhan@planb.de>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Tue, Jan 22, 2002 at 10:20:59AM +0100, Bruno Vidal wrote:
> 	Sorry, but on my system, fgrep gives nothing
> (and by using strings, I found nothing also). And I
> can't use dmesg buffer, because by definition it is a buffer,
> so after running sometime, the palo boot strings is not
> in the buffer anymore. Some new ideas ?

I think the correct way would be to use libbfd to achieve something
similar to the following in "shell notation":

| objdump -t vmlinux| grep " system_utsname"
102860c0 g     O .data  00000186 system_utsname
^ start                 ^ size
| objdump --start-address=0x102860c0 --stop-address=0x10286246 vmlinux
...
102860c0 4c696e75 78000000 00000000 00000000  Linux...........
102860d0 00000000 00000000 00000000 00000000  ................
102860e0 00000000 00000000 00000000 00000000  ................
102860f0 00000000 00000000 00000000 00000000  ................
10286100 00286e6f 6e652900 00000000 00000000  .(none).........
10286110 00000000 00000000 00000000 00000000  ................
10286120 00000000 00000000 00000000 00000000  ................
10286130 00000000 00000000 00000000 00000000  ................
10286140 0000322e 342e3137 2d706131 31000000  ..2.4.17-pa11...
10286150 00000000 00000000 00000000 00000000  ................
10286160 00000000 00000000 00000000 00000000  ................
10286170 00000000 00000000 00000000 00000000  ................
10286180 00000023 3134204d 6f6e204a 616e2032  ...#14 Mon Jan 2
10286190 31203230 3a34323a 33352043 45542032  1 20:42:35 CET 2
102861a0 30303200 00000000 00000000 00000000  002.............
...

Using libbfd it should be feasible to read a "struct new_utsname"
from the binaries. Sorry, but don't have the time for a better
proof-of-concept than using objdump today.

Enrik
-- 
Enrik Berkhan                                         plan b. GmbH
                                                      Rüppurrer Straße 4
+49-721-388582 (voice)                                76137 Karlsruhe
+49-721-388581 (fax)                                  Germany
