From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] head.S: a small typo
Date: Thu, 21 Apr 2005 08:39:13 +0200
Message-ID: <420889870001DAD9@mail-4-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
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

I just noticed this small typo:
--- arch/parisc/kernel/head.S.Orig      2005-04-20 18:46:57.000000000 +02=
00
+++ arch/parisc/kernel/head.S   2005-04-21 08:28:11.000000000 +0200
@@ -260,7 +260,7 @@
 
        .align          256
 aligned_rfi:
-       ssm             0,0
+       ssm             0, %r0
        nop             /* 1 */
        nop             /* 2 */
        nop             /* 3 */
=3D=3D=3D=3D<>=3D=3D=3D=3D

Hth,
    Joel

PS: is there some insterest in some white space cleanup in those *.S 


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
