From: j.raspe@t-online.de (Johannes Raspe)
Subject: [parisc-linux] No 2.6 kernel on 735/125 with CRX24?
Date: Fri, 24 Sep 2004 15:33:15 +0200
Message-ID: <200409241533.15399.j.raspe@t-online.de>
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

Hi all,

I tried the "official" 2.6.8 Debian-image and 2.6.8.1-pa11-image but none 
worked.
After booting, the message "if this is the last..." about graphic and 
serial-console is printed and after that (I suppose when the kernel tries to 
initialize the framebuffer) the screen turns blue, no HDD-activity anymore, 
the system hangs.
As far as I can see no other messages.
With 2.4.27-pa4 everything is fine.

machine: 735/125
graphics: CRX24
palo-commandline: 2/vmlinux root=/dev/sda6 HOME=/
32-bit kernel

Any clues?

Johannes

-- 
Johannes Raspe - j.raspe@t-online.de
GnuPG-Key ID: D342E105
Fingerprint: D681 F800 FB2D 913E D14C 1F17 C3DB B1F1 D342 E105
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
