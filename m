From: Matthew Wilcox <willy@debian.org>
Subject: [parisc-linux] Re: Using Audio card on 735/99
Date: Sun, 24 Mar 2002 21:02:14 +0000
Message-ID: <20020324210214.E28384__41180.522068362$1416621179$gmane$org@parcelfarce.linux.theplanet.co.uk>
References: <200203242042.g2OKgET57280@smtp.monmouth.com>
Reply-To: parisc-linux@parisc-linux.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: debian-hppa@lists.debian.org, parisc-linux@parisc-linux.org
To: "Vlad D. Markov" <markov@monmouth.com>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <200203242042.g2OKgET57280@smtp.monmouth.com>; from markov@monmouth.com on Sun, Mar 24, 2002 at 03:32:53PM -0500
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

[this is a kernel-related question, moving discussion to parisc-linux]

On Sun, Mar 24, 2002 at 03:32:53PM -0500, Vlad D. Markov wrote:
> I would like to use my audio card on my 735/99 but have failed so far.
> 
> I have used various kernel versions, the last attempt was with a kernel drawn 
> from cvs on 3/21/02, Linux version 2.4.18-pa7. dmesg doesn't list the harmony 
> card as found. The harmony driver was compiled with the kernel.

Harmony doesn't claim to support that device.  I don't know that it will
work ... but you might be lucky :-)

Try adding this patch and let's see what happens:

--- drivers/sound/harmony.c     2002/02/14 19:02:21     1.25
+++ drivers/sound/harmony.c     2002/03/24 20:52:31
@@ -1244,7 +1244,10 @@ out_err:
 
 
 static struct parisc_device_id harmony_tbl[] = {
+       { HPHW_FIO, HVERSION_REV_ANY_ID, HVERSION_ANY_ID, 0x0007A },
        { HPHW_FIO, HVERSION_REV_ANY_ID, HVERSION_ANY_ID, 0x0007B },
+       { HPHW_FIO, HVERSION_REV_ANY_ID, HVERSION_ANY_ID, 0x0007E },
+       { HPHW_FIO, HVERSION_REV_ANY_ID, HVERSION_ANY_ID, 0x0007F },
        { 0, }
 };
 

This makes harmony pick up all the Audio devices, including some it
almost certainly won't support (eg 705 / 710 audio, which i understand
to be completely different).  But maybe 735's sound will Just Work.
Let's hope.

-- 
Revolutions do not require corporate support.
