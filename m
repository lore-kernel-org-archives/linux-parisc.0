From: Mike Frysinger <vapier@gentoo.org>
Subject: [parisc-linux] linking problem with 2.4.26-p4
Date: Sun, 4 Jul 2004 23:06:48 -0400
Message-ID: <200407042306.48112.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
To: parisc-linux@lists.parisc-linux.org
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

just forwarding a bug report in the hopes that the peeps who maintain the -pa 
patchsets can fix this properly :)

http://bugs.gentoo.org/show_bug.cgi?id=56087

in some configurations, setting CONFIG_GSC_PS2=n can cause a linking error:
drivers/hil/hil.o(.text.hil:bkd_connect+0x424): In function 'hil_kbd_connect':
: undefined reference to 'register_ps2_keybfuncs'

thanks
-mike
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
