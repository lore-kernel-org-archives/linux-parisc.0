From: "Joel Soete" <soete.joel@tiscali.be>
Subject: RE: [parisc-linux] lasi 53c700 problems
Date: Fri, 8 Oct 2004 19:40:37 +0200
Message-ID: <41665B0C0000011B@mail-5-bnl.tiscali.it>
References: <200410081501.24668.helge.deller@sap.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
To: "Helge Deller" <helge.deller@sap.com>,
 parisc-linux@parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200410081501.24668.helge.deller@sap.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


 
> 
> I saw just some problems with lasi53c700 on my B180L:
> Linux version 2.6.9-rc2-pa13 (root@ls3530) (gcc version 3.3.4 (Debian
1:3.3.4-11))
> #1 Fri Oct 8 13:02:32 CEST 2004
> 
> Attached devive is an external 2x SCSI CD writer which worked in other
kernels
> without problems.
> 
> Any idea ?
> Helge
> 
> 
> scsi0 : sym-2.1.18k
> Using anticipatory io scheduler
>   Vendor: IBM       Model: DDRS-34560WS      Rev: HP01
>   Type:   Direct-Access                      ANSI SCSI revision: 02
> sym0:5:0: tagged command queuing enabled, command queue depth 16.
> scsi(0:0:5:0): Beginning Domain Validation
> sym0:5: wide asynchronous.
> sym0:5: FAST-20 WIDE SCSI 40.0 MB/s ST (50.0 ns, offset 15)
> scsi(0:0:5:0): Domain Validation skipping write tests
> scsi(0:0:5:0): Ending Domain Validation
>   Vendor: IBM       Model: DDRS-34560WS      Rev: HP01
>   Type:   Direct-Access                      ANSI SCSI revision: 02
> sym0:6:0: tagged command queuing enabled, command queue depth 16.
> scsi(0:0:6:0): Beginning Domain Validation
> sym0:6: wide asynchronous.
> sym0:6: FAST-20 WIDE SCSI 40.0 MB/s ST (50.0 ns, offset 15)
> scsi(0:0:6:0): Domain Validation skipping write tests
> scsi(0:0:6:0): Ending Domain Validation
> 53c700: Version 2.8 By James.Bottomley@HansenPartnership.com

Hello Helge,

I have another kind of pb but also related to this driver on my c110 (and=

somebody else on debian-hppa list)
I tried 2 tips which seems to work, the ggg one seems to work better:
<http://lists.parisc-linux.org/pipermail/parisc-linux/2004-September/0247=
42.html>

(btw I didn't reach to get any followup on this matter?)

hth,
    Joel

-------------------------------------------------------------------------=
--
Tiscali ADSL GO, 29,50 Euro/mois pendant toute une ann=E9e, profitez-en..=
..
http://reg.tiscali.be/adsl/welcome.asp?lg=3DFR




_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
