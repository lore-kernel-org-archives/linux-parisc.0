From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [parisc-linux] linux-2.6.10-pa1 panic on C360 in SCSI driver
Date: Mon, 27 Dec 2004 20:45:34 -0500
Message-ID: <200412272045.34143.vapier@gentoo.org>
References: <200412260504.40205.vapier@gentoo.org>
	<41CF56AD.2010504@tiscali.be>
	<20041227004909.GI11543@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_+qL0B9m7v2Nw3RU"
To: parisc-linux@parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041227004909.GI11543@parcelfarce.linux.theplanet.co.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--Boundary-00=_+qL0B9m7v2Nw3RU
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sunday 26 December 2004 07:49 pm, Matthew Wilcox wrote:
> Yes, but the problem is with the Western Digital drive, so you
> can't provoke the problem.

tried jejb's patch on irc:
--- 1.22/drivers/scsi/sym53c8xx_2/sym_hipd.c    2004-10-24 11:08:18 -05:00
+++ edited/sym_hipd.c   2004-12-27 16:33:50 -06:00
@@ -4176,7 +4176,7 @@
 
        if (ofs) {
                unsigned char minsync = dt ? np->minsync_dt : np->minsync;
-               if (per < np->minsync_dt) {
+               if (per < minsync) {
                        chg = 1;
                        per = minsync;
                }

it didnt panic, but it looks like the kernel went into an infinite loop ...

find attached new dmesg
-mike

--Boundary-00=_+qL0B9m7v2Nw3RU
Content-Type: text/plain; charset="iso-8859-1";
	name="2.6.10-pa1-scsi-debug-patch1"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="2.6.10-pa1-scsi-debug-patch1"

sym0: <875> rev 0x4 at pci 0000:00:13.0 irq 99
sym0: No NVRAM, ID 7, Fast-20, SE, parity checking
sym0: SCSI BUS has been reset.
scsi0 : sym-2.1.18m
elevator: using anticipatory as default io scheduler
  Vendor: IBM       Model: DDRS-34560WS      Rev: HP01
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym0:6:0: tagged command queuing enabled, command queue depth 16.
 target0:0:6: Beginning Domain Validation
sym0:6:wide msgout: 1-2-3-1.
sym0:6:wide msgin: 1-2-3-1.
sym0:6:wdtr: wide=1 chg=0.
sym0:6:sync msgout: 1-3-1-c-0.
sym0:6:sync msgin: 1-3-1-c-0.
sym0:6:sdtr: ofs=0 per=12 div=0 fak=0 chg=0.
sym0:6: wide asynchronous.
sym0:6:sync msgout: 1-3-1-c-10.
sym0:6:sync msgin: 1-3-1-c-f.
sym0:6:sdtr: ofs=15 per=12 div=0 fak=0 chg=0.
sym0:6: FAST-20 WIDE SCSI 40.0 MB/s ST (50.0 ns, offset 15)
 target0:0:6: Domain Validation skipping write tests
 target0:0:6: Ending Domain Validation
sym0:9:ppr msgin: 1-6-4-c-0-3f-1-2.
sym0:9: FAST-20 WIDE SCSI 40.0 MB/s ST (50.0 ns, offset 16)
sym0:9:ppr msgout: 1-6-4-c-0-10-1-0.
  Vendor: WDIGTL    Model: WDE9150 ULTRA3    Rev: 1.30
  Type:   Direct-Access                      ANSI SCSI revision: 03
sym0:9:0: tagged command queuing enabled, command queue depth 16.
 target0:0:9: Beginning Domain Validation
sym0:9:ppr msgout: 1-6-4-c-0-0-0-0.
sym0:9:ppr msgin: 1-6-4-a-0-0-0-0.
sym0:9: asynchronous.
sym0:9:ppr msgout: 1-6-4-c-0-0-1-0.
sym0:9:ppr msgin: 1-6-4-a-0-0-1-0.
sym0:9: wide asynchronous.
sym0:9:ppr msgout: 1-6-4-c-0-10-1-0.
sym0:9:ppr msgin: 1-6-4-a-0-10-1-0.
sym0:9: asynchronous.
sym0:9:0:M_REJECT to send for : 1-6-4-a-0-10-1-0.
sym0:9:0: ABORT operation started.
sym0:9:0: ABORT operation timed-out.
sym0:9:0: DEVICE RESET operation started.
sym0:9:0: DEVICE RESET operation timed-out.
sym0:9:0: BUS RESET operation started.
sym0: SCSI BUS reset detected.
sym0: SCSI BUS has been reset.
sym0:9:0: BUS RESET operation complete.
sym0:9:ppr msgout: 1-6-4-c-0-10-1-0.
sym0:9:ppr msgin: 1-6-4-a-0-10-1-0.
sym0:9:0:M_REJECT to send for : 1-6-4-a-0-10-1-0.
sym0:9:0: ABORT operation started.
sym0:9:0: ABORT operation timed-out.
sym0:9:0: HOST RESET operation started.
sym0: SCSI BUS has been reset.

--Boundary-00=_+qL0B9m7v2Nw3RU
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--Boundary-00=_+qL0B9m7v2Nw3RU--
