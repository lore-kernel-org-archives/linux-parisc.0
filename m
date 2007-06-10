From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] -pie is broken on hppa
Date: Sat, 9 Jun 2007 23:46:06 -0400 (EDT)
Message-ID: <200706100346.l5A3k780007338__16759.9113811322$1416624395$gmane$org@hiauly1.hia.nrc.ca>
References: <200706020203.l52235DP011866@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: debian-hppa@lists.debian.org,
 parisc-linux@lists.parisc-linux.org,
 matthew@wil.cx
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200706020203.l52235DP011866@hiauly1.hia.nrc.ca> from "John David
	Anglin" at Jun 1, 2007 10:03:05 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> This is what I see when I do a gcc_update:
> dave@mx3210:~/gnu/gcc-4.3/gcc$ contrib/gcc_update
> Updating SVN tree
> At revision 125275.
> svn: Can't read directory '.': Partial results are valid but processing is incomplete

I spent the day trying to debug why libjava fails to build on this system
with the new glibc.  It seems that scandir is broken on 64-bit kernels.
There seems to be an off by one error in copying dirent structs.  Either
the define in <dirent.h> for _D_ALLOC_NAMLEN is wrong or the kernel
sometimes returns a value for d_reclen that is sometimes too small.  The
code in fs/readdir.c suggests that sys_parisc32.c needs fixing.

The enclosed seems to fix both the libjava build and the svn problem.
Kyle's branch uses ALIGN instead of ROUND_UP.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

diff --git a/arch/parisc/kernel/sys_parisc32.c b/arch/parisc/kernel/sys_parisc32.c
index 29be437..44400e0 100644
--- a/arch/parisc/kernel/sys_parisc32.c
+++ b/arch/parisc/kernel/sys_parisc32.c
@@ -318,7 +318,7 @@ static int filldir32 (void *__buf, const char *name, int namlen,
 {
 	struct linux32_dirent __user * dirent;
 	struct getdents32_callback * buf = (struct getdents32_callback *) __buf;
-	int reclen = ROUND_UP(NAME_OFFSET(dirent) + namlen + 1, 4);
+	int reclen = ROUND_UP(NAME_OFFSET(dirent) + namlen + 2, 4);
 	u32 d_ino;
 
 	buf->error = -EINVAL;	/* only used if we fail.. */
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
