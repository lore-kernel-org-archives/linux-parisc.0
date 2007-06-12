From: "Jeff Bailey" <jbailey@raspberryginger.com>
Subject: [parisc-linux] Glibc testfailures with various kernels
Date: Tue, 12 Jun 2007 15:35:53 -0400
Message-ID: <5b2e36650706121235i38d0979fo73bb5540a9c1e9ad__22609.0711811141$1416624390$gmane$org@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============1563119468=="
To: parisc-linux <parisc-linux@lists.parisc-linux.org>
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

--===============1563119468==
Content-Type: multipart/alternative;
	boundary="----=_Part_9174_8171156.1181676953322"

------=_Part_9174_8171156.1181676953322
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I have run the Ubuntu glibc testsute (feisty) in three different
configurations.  This setup is Ubuntu Feisty, except that I'm using
gcc-4.2instead of
gcc-4.1.  The first kernel is from Kyle's merge tree from ~1 week ago.  The
second one adds jda's dirent patch and ggg's SMP patch but compiled for UP.
The third is the second kernel compiled for SMP.

The only conclusion that I can draw is that some of the threading bits
aren't actually SMP-safe.  That said, Grant's SMP patch holds up under make
-j2 on glibc, and the system would kill the SCSI drive before I ever got
that far before.  Note also that tst-pie1 still segfaults the whole way
through as well.

Kernel #1 (baseline):
(Note that Carlos doesn't see several of these, I'm still converging my
error set with his, so this is provided for reference only)

tststatic2.out] Error 1
tststatic.out] Error 1
check-textrel.out] Error 1
tst-addr1.out] Error 1
tst-audit2.out] Error 139
tst-pie1.out] Error 139
tst-tls9-static.out] Error 1
test-double.out] Error 1
test-idouble.out] Error 1
tst-cancelx20.out] Error 1
tst-cancelx21.out] Error 1
tst-cancelx4.out] Error 1
tst-cancelx5.out] Error 1
tst-cleanupx4.out] Error 1
tst-cond16.out] Error 1
tst-fork1.out] Error 143 (Spun out, killed by hand)
tst-initializers1-c99.o] Error 1
tst-initializers1-gnu99.o] Error 1
tst-initializers1.o] Error 1
tst-robustpi8.out] Error 1
tst-cputimer1.out] Error 1
tst-cputimer2.out] Error 1
tst-cputimer3.out] Error 1
tst-mqueue3.out] Error 1
tst-timer4.out] Error 1
tst-timer5.out] Error 1

Kernel #2 versus Kernel #1:
Added:
tst-cond17.out] Error 1

Removed:
tst-robustpi8.out] Error 1

Kernel #3 versus Kernel #2:
Added:
nptl/tst-barrier3.out] Error 1
nptl/tst-basic4.out] Error 1
nptl/tst-cond18.out] Error 1
nptl/tst-cond20.out] Error 1
nptl/tst-cond21.out] Error 1
nptl/tst-exec1.out] Error 1

Removed:
dlfcn/tststatic2.out] Error 1
dlfcn/tststatic.out] Error 1
elf/tst-tls9-static.out] Error 1
nptl/tst-fork1.out] Error 143



-- 
Jeff Bailey - http://www.raspberryginger.com/jbailey/

------=_Part_9174_8171156.1181676953322
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I have run the Ubuntu glibc testsute (feisty) in three different configurations.&nbsp; This setup is Ubuntu Feisty, except that I&#39;m using gcc-4.2 instead of gcc-4.1.&nbsp; The first kernel is from Kyle&#39;s merge tree from ~1 week ago.&nbsp; The second one adds jda&#39;s dirent patch and ggg&#39;s SMP patch but compiled for UP.&nbsp; The third is the second kernel compiled for SMP.
<br><br>The only conclusion that I can draw is that some of the threading bits aren&#39;t actually SMP-safe.&nbsp; That said, Grant&#39;s SMP patch holds up under make -j2 on glibc, and the system would kill the SCSI drive before I ever got that far before.&nbsp; Note also that tst-pie1 still segfaults the whole way through as well.
<br><br>Kernel #1 (baseline):<br>(Note that Carlos doesn&#39;t see several of these, I&#39;m still converging my error set with his, so this is provided for reference only)<br><br><div style="margin-left: 40px;">tststatic2.out
] Error 1<br>tststatic.out] Error 1<br>check-textrel.out] Error 1<br>tst-addr1.out] Error 1<br>tst-audit2.out] Error 139<br>tst-pie1.out] Error 139<br>tst-tls9-static.out] Error 1<br>test-double.out] Error 1<br>test-idouble.out
] Error 1<br>tst-cancelx20.out] Error 1<br>tst-cancelx21.out] Error 1<br>tst-cancelx4.out] Error 1<br>tst-cancelx5.out] Error 1<br>tst-cleanupx4.out] Error 1<br>tst-cond16.out] Error 1<br>tst-fork1.out] Error 143 (Spun out, killed by hand)
<br>tst-initializers1-c99.o] Error 1<br>tst-initializers1-gnu99.o] Error 1<br>tst-initializers1.o] Error 1<br>tst-robustpi8.out] Error 1<br>tst-cputimer1.out] Error 1<br>tst-cputimer2.out] Error 1<br>tst-cputimer3.out] Error 1
<br>tst-mqueue3.out] Error 1<br>tst-timer4.out] Error 1<br>tst-timer5.out] Error 1<br></div><br>Kernel #2 versus Kernel #1:<br><div style="margin-left: 40px;">Added:<br>tst-cond17.out] Error 1<br><br>Removed:<br>tst-robustpi8.out
] Error 1<br></div><br>Kernel #3 versus Kernel #2:<br><div style="margin-left: 40px;">Added:<br>nptl/tst-barrier3.out] Error 1<br>nptl/tst-basic4.out] Error 1<br>nptl/tst-cond18.out] Error 1<br>nptl/tst-cond20.out] Error 1
<br>nptl/tst-cond21.out] Error 1<br>nptl/tst-exec1.out] Error 1<br><br>Removed:<br>dlfcn/tststatic2.out] Error 1<br>dlfcn/tststatic.out] Error 1<br>elf/tst-tls9-static.out] Error 1<br>nptl/tst-fork1.out] Error 143<br></div>
<br><br clear="all"><br>-- <br>Jeff Bailey - <a href="http://www.raspberryginger.com/jbailey/">http://www.raspberryginger.com/jbailey/</a>

------=_Part_9174_8171156.1181676953322--

--===============1563119468==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============1563119468==--
