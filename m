From: =?ISO-8859-1?Q?S=E9bastien_Bernard?= <seb@frankengul.org>
Subject: Re: [parisc-linux] glibc is broken because of gcc
Date: Wed, 13 Jun 2007 22:39:47 +0200
Message-ID: <46705613.8020708__34654.531782917$1416624392$gmane$org@frankengul.org>
References: <20070613082133.GA19999@frankengul.org>	<200706131332.l5DDWObn025750@hiauly1.hia.nrc.ca> <20070613142304.GA21970@frankengul.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="------------010008070609060600050503"
Cc: aurelien@aurel32.net,
 parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <20070613142304.GA21970@frankengul.org>
Resent-Message-ID: <glD9qC.A.JdE.sXFcGB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

This is a multi-part message in MIME format.
--------------010008070609060600050503
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

seb@frankengul.org a écrit :
> On Wed, Jun 13, 2007 at 09:32:24AM -0400, John David Anglin wrote:
>>> I could remove this patch altogether. But I still wonder why this patch works
>>> ok on other archs and not on hppa*.
>> hppa* does a deferred generation of plabels for indirect function calls.
>> I think this is affected by the change.  I don't recall exactly but there
>> may have been a followup patch to fix this.  Of course, this change isn't
>> in the 4.1 GCC tree.
> 
> Ok, thanks for the explanations. I just have to figure out what it means now ;-).
> 
> Can I find this patch somewhere ? Is there any discussion on the ML ?
> The patch was discussed near January of this year on the gcc ML.
>> Dave
>> -- 
>> J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
>> National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

Ok, I nailed it.
I removed PR20218 patch and generated a 4.1.2-12+b1 then build glibc.

Glibc build is ok now.
I think the hppa toolchain can move on and build the glibc-2.5-11 and 
then rebuild the portmap and all pie executable (pfeww... what a bug chain).

	Seb


--------------010008070609060600050503
Content-Type: text/plain;
 name="diff-PR20218"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="diff-PR20218"

diff -r -u -b -B -w gcc-4.1-4.1.2-12/debian/changelog gcc-4.1-4.1.2-12+b1/debian/changelog
--- gcc-4.1-4.1.2-12/debian/changelog	2007-06-13 22:34:38.000000000 +0200
+++ gcc-4.1-4.1.2-12+b1/debian/changelog	2007-06-13 12:44:48.000000000 +0200
@@ -1,3 +1,9 @@
+gcc-4.1 (4.1.2-12+b1) unstable; urgency=low
+
+  * Revert 20218 patch that breaks gcc
+
+ -- Sebastien Bernard <seb@frankengul.org>  Wed, 13 Jun 2007 12:44:07 +0200
+
 gcc-4.1 (4.1.2-12) unstable; urgency=high
 
   * i386-biarch.dpatch: Update for the backport for PR target/31868.
diff -r -u -b -B -w gcc-4.1-4.1.2-12/debian/rules.patch gcc-4.1-4.1.2-12+b1/debian/rules.patch
--- gcc-4.1-4.1.2-12/debian/rules.patch	2007-06-13 22:34:38.000000000 +0200
+++ gcc-4.1-4.1.2-12+b1/debian/rules.patch	2007-06-13 12:45:06.000000000 +0200
@@ -41,8 +41,6 @@
 	fastjar-version \
 	fastjar-doc \
 	libstdc++-doxygen \
-	pr20218 \
-	pr20218-mips \
 	pr31868 \
 	arm-libffi \
 	libffi-backport \
@@ -112,10 +110,6 @@
   debian_patches += pr25524-doc pr26885-doc gcc-4.1-x86-blended-doc libjava-backport-updates2
 endif
 
-ifneq (,$(filter $(DEB_TARGET_ARCH), amd64 i386 powerpc ppc64 sparc s390))
-  debian_patches += pr20218
-endif
--------------010008070609060600050503--
