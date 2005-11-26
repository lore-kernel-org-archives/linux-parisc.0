From: Guy Martin <gmsoft@tuxicoman.be>
Subject: [parisc-linux] Palo patch : remove useless TERM and HOME variables
Date: Sat, 26 Nov 2005 16:37:48 +0100
Message-ID: <20051126163748.3c0fcb37.gmsoft@tuxicoman.be>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="Multipart=_Sat__26_Nov_2005_16_37_48_+0100_90d=VQ9K9fNwb6aQ"
To: parisc-linux@parisc-linux.org
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

This is a multi-part message in MIME format.

--Multipart=_Sat__26_Nov_2005_16_37_48_+0100_90d=VQ9K9fNwb6aQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit


Hi all,

The trivial attached patch remove the need of HOME and TERM into the boot command line.
This is usfull for gentoo livecd to which we sometimes have to pass long boot command lines.

Cheers



-- 
Guy Martin
Gentoo Linux - HPPA port Lead / IPv6 team

--Multipart=_Sat__26_Nov_2005_16_37_48_+0100_90d=VQ9K9fNwb6aQ
Content-Type: text/x-patch;
 name="palo-remove-HOME-TERM.patch"
Content-Disposition: attachment;
 filename="palo-remove-HOME-TERM.patch"
Content-Transfer-Encoding: 7bit

diff -uNr palo.orig/Makefile palo/Makefile
--- palo.orig/Makefile	2004-05-17 13:39:00.431714000 +0200
+++ palo/Makefile	2004-05-17 13:39:45.221714000 +0200
@@ -56,7 +56,7 @@
     ROOT=root=/dev/nfs nfsroot=${NFSROOT} ip=bootp
 endif
 
-CMDLINE = 0/vmlinux HOME=/ TERM=linux $(ROOT) $(EISAIRQ) $(CONSOLE)
+CMDLINE = 0/vmlinux $(ROOT) $(EISAIRQ) $(CONSOLE)
 
 all: makepalo README palo.conf
 	
diff -uNr palo.orig/README palo/README
--- palo.orig/README	2004-05-17 13:39:00.431714000 +0200
+++ palo/README	2004-05-17 13:40:09.341714000 +0200
@@ -42,13 +42,13 @@
        files to it, unmount.
      * Use palo to make the disk bootable:
         $ palo \
-             -c "5/vmlinux HOME=/ TERM=linux console=tty" \
+             -c "5/vmlinux console=tty" \
              -k path/to/vmlinux \
              -I /dev/your-disk
 
       On a self-hosted system, you can accomplish the same thing by placing
       the following into /etc/palo.conf:
-   --commandline=5/vmlinux HOME=/ TERM=linux console=tty
+   --commandline=5/vmlinux console=tty
    --recoverykernel=/boot/vmlinux
    --init-partitioned=/dev/your-disk
 
diff -uNr palo.orig/README.html palo/README.html
--- palo.orig/README.html	2004-05-17 13:39:00.431714000 +0200
+++ palo/README.html	2004-05-17 13:40:27.801714000 +0200
@@ -52,13 +52,13 @@
     <p><li>Use <i>palo</i> to make the disk bootable:
     <pre>
 	$ palo \
-	     -c "5/vmlinux HOME=/ TERM=linux console=tty" \
+	     -c "5/vmlinux console=tty" \
 	     -k path/to/vmlinux \
 	     -I /dev/your-disk</pre>
 <center><table border=1 bgcolor=yellow width=80%><tr><td>
 On a self-hosted system, you can accomplish the same thing by placing
 the following into <tt>/etc/palo.conf</tt>:
-<pre>--commandline=5/vmlinux HOME=/ TERM=linux console=tty
+<pre>--commandline=5/vmlinux console=tty
 --recoverykernel=/boot/vmlinux
 --init-partitioned=/dev/your-disk</pre>
 and running <i>palo</i>.
diff -uNr palo.orig/ipl/ipl.c palo/ipl/ipl.c
--- palo.orig/ipl/ipl.c	2004-05-17 13:39:00.491714000 +0200
+++ palo/ipl/ipl.c	2004-05-17 13:39:19.681714000 +0200
@@ -481,9 +481,6 @@
 	        chk_strcat(commandline, "ttyB0", CMDLINELEN, &ok);
             else
 	        chk_strcat(commandline, "ttyS0", CMDLINELEN, &ok);
-
-	    if (strstr(commandline, " TERM=") == 0)
-	        chk_strcat(commandline, " TERM=vt102", CMDLINELEN, &ok);
 	}
 	else
 	{
@@ -519,8 +516,6 @@
 	    }
 	    if (strstr(commandline, " sti_font=") == 0)
 	        chk_strcat(commandline, " sti_font=VGA8x16", CMDLINELEN, &ok);
-	    if (strstr(commandline, " TERM=") == 0)
-	        chk_strcat(commandline, " TERM=linux", CMDLINELEN, &ok);
 	}
     }
 
diff -uNr palo.orig/palo.conf palo/palo.conf
--- palo.orig/palo.conf	2004-05-17 13:39:00.431714000 +0200
+++ palo/palo.conf	2004-05-17 13:41:01.541714000 +0200
@@ -8,7 +8,7 @@
 # recovery kernel, and the default dynamically-booted kernel.
 # --recoverykernel=/boot/vmlinux
 # --init-partitioned=/dev/sda
-# --commandline=3/boot/vmlinux HOME=/ TERM=linux root=/dev/sda3
+# --commandline=3/boot/vmlinux root=/dev/sda3
 
 #
 #Usage: palo [options]
@@ -18,8 +18,8 @@
 #		Maximum 127 characters.
 #    -k, --recoverykernel=path to recovery kernel (perhaps /boot/vmlinux)
 #    -b, --bootloader=path to boot loader
-		Defaults to /usr/share/palo/iplboot -- you usually don't
-		need to use -b or --bootloader
+#		Defaults to /usr/share/palo/iplboot -- you usually don't
+#		need to use -b or --bootloader
 #    -r, --ramdisk=path to initial ramdisk image
 #    -I, --init-partitioned=partitioned device or file
 #    		Initialize a pre-partitioned device, usually a hard disk.

--Multipart=_Sat__26_Nov_2005_16_37_48_+0100_90d=VQ9K9fNwb6aQ
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--Multipart=_Sat__26_Nov_2005_16_37_48_+0100_90d=VQ9K9fNwb6aQ--
