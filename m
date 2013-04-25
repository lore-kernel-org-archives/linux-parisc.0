From: Ulrich Teichert <krypton@ulrich-teichert.org>
Subject: Re: Gentoo boot on C8000 (was: Re: PARISC Linux website and status update)
Date: Thu, 25 Apr 2013 21:06:54 +0200 (MEST)
Message-ID: <201304251906.r3PJ6uwn013954@arbas.nms.ulrich-teichert.org>
References: <1725746.7h2TmhW5F7@eto>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: jer@gentoo.org (Jeroen Roovers)
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1725746.7h2TmhW5F7@eto>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi,

>> And that's it. Well, the ISO *is* an experimental one ;-) Any idea what
>> to try?
>
>video=radeonfb:off

Right, that got it to boot ;-) But it failed to recognize my hard disk:

[   15.020000] Fusion MPT base driver 3.04.20
[   15.072000] Copyright (c) 1999-2008 LSI Corporation
[   15.136000] Fusion MPT SPI Host driver 3.04.20
[   15.220000] mptbase: ioc0: Initiating bringup
[   15.760000] ioc0: LSI53C1030 B2: Capabilities={Initiator,Target}
[   16.328000] scsi0 : ioc0: LSI53C1030 B2, FwRev=01032341h, Ports=1, MaxQ=255, IRQ=66
[   43.872000] mptscsih: ioc0: attempting task abort! (sc=000000007f29e300)
[   43.960000] scsi 0:0:6:0: CDB: 
[   44.000000] cdb[0]=0x12: 12 00 00 00 24 00
[   54.176000] mptscsih: ioc0: WARNING - Issuing Reset from mptscsih_IssueTaskMgmt!! doorbell=0x24000000
[   55.584000] mptscsih: ioc0: task abort: SUCCESS (rv=2002) (sc=000000007f29e300)
[   55.680000] scsi target0:0:6: asynchronous
[   55.928000] mptscsih: ioc0: attempting target reset! (sc=000000007f29e300)
[   56.020000] scsi 0:0:6:0: CDB: 
[   56.060000] cdb[0]=0x12: 12 00 00 00 24 00
[   56.476000] mptscsih: ioc0: target reset: SUCCESS (sc=000000007f29e300)
[   56.812000] mptscsih: ioc0: attempting bus reset! (sc=000000007f29e300)
[   56.900000] scsi 0:0:6:0: CDB: 
[   56.944000] cdb[0]=0x12: 12 00 00 00 24 00
[   57.632000] mptscsih: ioc0: bus reset: SUCCESS (sc=000000007f29e300)
[   67.968000] mptscsih: ioc0: attempting host reset! (sc=000000007f29e300)
[   68.816000] mptscsih: ioc0: host reset: SUCCESS (sc=000000007f29e300)
[   68.900000] scsi target0:0:6: asynchronous
[   79.152000] scsi 0:0:6:0: Device offlined - not ready after error recovery
[   81.268000] mptbase: ioc1: Initiating bringup
[   81.808000] ioc1: LSI53C1030 B2: Capabilities={Initiator,Target}
[   82.376000] scsi1 : ioc1: LSI53C1030 B2, FwRev=01032341h, Ports=1, MaxQ=255, IRQ=67

Which is a bit strange as I can boot HPUX from it just fine. Is that a
common problem? Or should I just try another disk? E1000 ethernet support
is OK and running, though,

CU,
Uli
-- 
Dipl. Inf. Ulrich Teichert|e-mail: Ulrich.Teichert@gmx.de | Listening to:
Stormweg 24               |Pale Bride (The Von Bondies), Slip Away (Sedatives)
24539 Neumuenster, Germany|Sacred Decay (The Estranged), She's Lost Control
