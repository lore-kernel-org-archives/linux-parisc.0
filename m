From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] linux-2.6.10-pa1 panic on C360 in SCSI driver
Date: Tue, 28 Dec 2004 03:35:20 +0000
Message-ID: <20041228033520.GO11543@parcelfarce.linux.theplanet.co.uk>
References: <200412260504.40205.vapier@gentoo.org>
	<41CF56AD.2010504@tiscali.be>
	<20041227004909.GI11543@parcelfarce.linux.theplanet.co.uk>
	<200412272045.34143.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: Mike Frysinger <vapier@gentoo.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200412272045.34143.vapier@gentoo.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Dec 27, 2004 at 08:45:34PM -0500, Mike Frysinger wrote:
> it didnt panic, but it looks like the kernel went into an infinite loop ...

Yeah, now it looks like a problem a bunch of other people have been having ;-(

> sym0:9:ppr msgin: 1-6-4-c-0-3f-1-2.
> sym0:9: FAST-20 WIDE SCSI 40.0 MB/s ST (50.0 ns, offset 16)
> sym0:9:ppr msgout: 1-6-4-c-0-10-1-0.
>   Vendor: WDIGTL    Model: WDE9150 ULTRA3    Rev: 1.30
>   Type:   Direct-Access                      ANSI SCSI revision: 03
> sym0:9:0: tagged command queuing enabled, command queue depth 16.
>  target0:0:9: Beginning Domain Validation
> sym0:9:ppr msgout: 1-6-4-c-0-0-0-0.
> sym0:9:ppr msgin: 1-6-4-a-0-0-0-0.

The SPI spec prohobits the device from going faster than we say.  The 'c'
in the msgout is us saying "we can only do FAST-20" (as the 875 is only
capable of FAST-20).  The 'a' in the msgin is the device saying "OK,
let's do FAST-40".

Can you try the following patch?  We're not actually disabling ppr atm,
depite what the comment says.

Index: drivers/scsi/sym53c8xx_2/sym_hipd.c
===================================================================
RCS file: /var/cvs/linux-2.6/drivers/scsi/sym53c8xx_2/sym_hipd.c,v
retrieving revision 1.43
diff -u -p -r1.43 sym_hipd.c
--- drivers/scsi/sym53c8xx_2/sym_hipd.c 2 Dec 2004 19:51:11 -0000       1.43
+++ drivers/scsi/sym53c8xx_2/sym_hipd.c 28 Dec 2004 03:27:10 -0000
@@ -1444,7 +1444,11 @@ static void sym_check_goals(struct scsi_
                st->offset = 0;
                return;
        }
-               
+
+       /* Some targets fail to properly negotiate using PPR in SE mode */
+       if (!((np->scsi_mode == SMODE_LVD) && (np->features & FE_ULTRA3)))
+               sdev->ppr = 0;
+
        if (scsi_device_dt(sdev)) {
                if (scsi_device_dt_only(sdev))
                        st->options |= PPR_OPT_DT;
@@ -1454,10 +1458,6 @@ static void sym_check_goals(struct scsi_
        } else {
                st->options &= ~PPR_OPT_DT;
        }
