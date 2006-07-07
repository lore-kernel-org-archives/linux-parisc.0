From: Kyle McMartin <kyle@mcmartin.ca>
Subject: [parisc-linux] [RFT] PA7200 users?
Date: Fri, 7 Jul 2006 13:11:28 -0400
Message-ID: <20060707171128.GA8689@athena.road.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
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

Can someone with a PA7200 please boot test this patch? I was reading
some docs which lead me to believe that PA7200 will suppress traps on
loads to gr0 too.

If not, you'll find out pretty quick when you're boot craps out. :)

Cheers,
	Kyle M.

Index: arch/parisc/Kconfig
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/Kconfig,v
retrieving revision 1.48
diff -u -d -p -r1.48 Kconfig
--- arch/parisc/Kconfig	6 Jul 2006 12:21:25 -0000	1.48
+++ arch/parisc/Kconfig	7 Jul 2006 17:09:40 -0000
@@ -127,7 +127,7 @@ config PA11
 
 config PREFETCH
 	def_bool y
-	depends on PA8X00
+	depends on PA8X00 || PA7200
 
 config 64BIT
 	bool "64-bit kernel"
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
