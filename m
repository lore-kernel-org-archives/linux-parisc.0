Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep16-int.chello.at (viefep16-int.chello.at [213.46.255.17])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5DEEC482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 11 Aug 2002 11:04:07 -0600 (MDT)
Received: from gmx.at ([62.178.92.247]) by viefep16-int.chello.at
          (InterMail vM.5.01.03.06 201-253-122-118-106-20010523) with ESMTP
          id <20020811170400.SKPP2227.viefep16-int.chello.at@gmx.at>
          for <parisc-linux@lists.parisc-linux.org>;
          Sun, 11 Aug 2002 19:04:00 +0200
Message-ID: <3D5698FE.828680F5@gmx.at>
Date: Sun, 11 Aug 2002 19:03:58 +0200
From: Christoph Plattner <christoph.plattner@gmx.at>
MIME-Version: 1.0
To: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] "Config.in" File in linux/drivers/char has a bug !
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

Hello PA-RISC community !

After this CVS update, I could not find my PDC_CONSOLE
driver to configure any more. I think, the part 

   if [ "$CONFIG_PARISC" = "y" ]; then
     bool '  PDC software console support' CONFIG_PDC_CONSOLE
   fi

is inserted at a wrong place, it is nested with the

if [ "$CONFIG_FOOTBRIDGE" = "y" ]; then
	:
	:
fi

... which is wrong for HP PDC console.
Or do I not understand the "FOOTBRIDGE" stuff ?

So the fix should be:

Index: drivers/char/Config.in
===================================================================
RCS file: /var/cvs/linux/drivers/char/Config.in,v
retrieving revision 1.23
diff -u -r1.23 Config.in
--- drivers/char/Config.in      4 Aug 2002 22:58:10 -0000       1.23
+++ drivers/char/Config.in      11 Aug 2002 17:03:04 -0000
@@ -114,9 +114,9 @@
          bool '        Enable Au1000 serial console'
CONFIG_AU1000_SERIAL_CONSOLE
      fi
    fi
-   if [ "$CONFIG_PARISC" = "y" ]; then
-     bool '  PDC software console support' CONFIG_PDC_CONSOLE
-   fi
+fi
+if [ "$CONFIG_PARISC" = "y" ]; then
+   bool '  PDC software console support' CONFIG_PDC_CONSOLE
 fi
 if [ "$CONFIG_MIPS_ITE8172" = "y" ]; then
    bool 'Enable Qtronix 990P Keyboard Support' CONFIG_QTRONIX_KEYBOARD


With friendly regards
Christoph P

-- 
-------------------------------------------------------
private:	christoph.plattner@gmx.at
company:	christoph.plattner@alcatel.at
