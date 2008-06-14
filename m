From: Helge Deller <deller@gmx.de>
Subject: sections warnings back again
Date: Sat, 14 Jun 2008 17:15:46 +0200
Message-ID: <4853E0A2.3010608@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
To: linux-parisc@vger.kernel.org, Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Kyle,

your commits:

commit 1138a72cd96857d1d5928c0c8c83d8b8995eeb38
Author: Kyle McMartin <kyle@minerva.i.cabal.ca>
Date:   Thu May 22 14:38:26 2008 -0400

     parisc: move head.S to head.text section

     And explicitly list it in vmlinux.lds...

     Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit dfcf753bd3fb09f336659d07b1c48db7e62772e0
Author: Kyle McMartin <kyle@minerva.i.cabal.ca>
Date:   Thu May 22 14:36:31 2008 -0400

     Revert "parisc: fix trivial section name warnings"

     This reverts commit bd3bb8c15b9a80dbddfb7905b237a4a11a4725b4.

     Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>


re-introduced some section warnings again.
It seems we need a few more...

...
   LD      vmlinux.o
   MODPOST vmlinux.o
WARNING: vmlinux.o (.text.1): unexpected section name.
The (.[number]+) following section name are ld generated and not expected.
Did you forget to use "ax"/"aw" in a .S file?
Note that for example <linux/init.h> contains
section definitions for use in .S files.

WARNING: vmlinux.o (.text.2): unexpected section name.
The (.[number]+) following section name are ld generated and not expected.
Did you forget to use "ax"/"aw" in a .S file?
Note that for example <linux/init.h> contains
section definitions for use in .S files.

WARNING: vmlinux.o (.text.7): unexpected section name.
The (.[number]+) following section name are ld generated and not expected.
Did you forget to use "ax"/"aw" in a .S file?
Note that for example <linux/init.h> contains
section definitions for use in .S files.

WARNING: vmlinux.o (.text.8): unexpected section name.
The (.[number]+) following section name are ld generated and not expected.
Did you forget to use "ax"/"aw" in a .S file?
Note that for example <linux/init.h> contains
section definitions for use in .S files.

WARNING: vmlinux.o (.text.16): unexpected section name.
The (.[number]+) following section name are ld generated and not expected.
Did you forget to use "ax"/"aw" in a .S file?
Note that for example <linux/init.h> contains
section definitions for use in .S files.

WARNING: vmlinux.o (.text.17): unexpected section name.
The (.[number]+) following section name are ld generated and not expected.
Did you forget to use "ax"/"aw" in a .S file?
Note that for example <linux/init.h> contains
section definitions for use in .S files.

   GEN     .version
   CHK     include/linux/compile.h
   UPD     include/linux/compile.h
...
