From: Aurelien Jarno <aurelien@aurel32.net>
Subject: [parisc-linux] glibc 2.5 and binutils CVS
Date: Fri, 02 Feb 2007 19:05:21 +0100
Message-ID: <45C37D61.4040507__11698.0355502621$1416624273$gmane$org@aurel32.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
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

I am trying to build glibc 2.5 with a CVS version of binutils
(2.17.20070103) in order to enable thread local storage support.

I get an error on an assembly file:
../ports/sysdeps/hppa/dl-trampoline.S: Assembler messages:
../ports/sysdeps/hppa/dl-trampoline.S:287: Error: open CFI at the end of
file; missing .cfi_endproc directive

Does anybody know how to fix that?

Thanks,
Aurélien

-- 
  .''`.  Aurelien Jarno	            | GPG: 1024D/F1BCDB73
 : :' :  Debian developer           | Electrical Engineer
 `. `'   aurel32@debian.org         | aurelien@aurel32.net
   `-    people.debian.org/~aurel32 | www.aurel32.net
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
