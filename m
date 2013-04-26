From: Ulrich Teichert <krypton@ulrich-teichert.org>
Subject: Re: Gentoo boot on C8000 (was: Re: PARISC Linux website and status
Date: Fri, 26 Apr 2013 21:57:39 +0200 (MEST)
Message-ID: <201304261957.r3QJveJd020474@arbas.nms.ulrich-teichert.org>
References: <201304251921.r3PJLd1d014087@arbas.nms.ulrich-teichert.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <201304251921.r3PJLd1d014087@arbas.nms.ulrich-teichert.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi,

me again - sorry for pestering the list again, but this:

[snip]
>[   15.020000] Fusion MPT base driver 3.04.20
>[   15.072000] Copyright (c) 1999-2008 LSI Corporation
>[   15.136000] Fusion MPT SPI Host driver 3.04.20
>[   15.220000] mptbase: ioc0: Initiating bringup
>[   15.760000] ioc0: LSI53C1030 B2: Capabilities={Initiator,Target}
>[   16.328000] scsi0 : ioc0: LSI53C1030 B2, FwRev=01032341h, Ports=1, MaxQ=255, IRQ=66
>[   43.872000] mptscsih: ioc0: attempting task abort! (sc=000000007f29e300)
>[   43.960000] scsi 0:0:6:0: CDB: 
>[   44.000000] cdb[0]=0x12: 12 00 00 00 24 00
>[   54.176000] mptscsih: ioc0: WARNING - Issuing Reset from mptscsih_IssueTaskMgmt!! doorbell=0x24000000
>[   55.584000] mptscsih: ioc0: task abort: SUCCESS (rv=2002) (sc=000000007f29e300)
>[   55.680000] scsi target0:0:6: asynchronous
>[   55.928000] mptscsih: ioc0: attempting target reset! (sc=000000007f29e300)
[etc]

Turned out to be a broken disk which blocked the SCSI-bus! Once I pulled it,
the remaining disk got recognized just fine from the experimental gentoo
install CD (from http://distfiles.gentoo.org/experimental/hppa/livecd).

Sorry for the fuss and thanks for helping me to see the obvious,
CU,
Uli
-- 
Dipl. Inf. Ulrich Teichert|e-mail: Ulrich.Teichert@gmx.de | Listening to:
Stormweg 24               |Pale Bride (The Von Bondies), Slip Away (Sedatives)
24539 Neumuenster, Germany|Sacred Decay (The Estranged), She's Lost Control
