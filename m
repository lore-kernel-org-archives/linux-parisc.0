Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailgw.cvut.cz (mailgw.cvut.cz [147.32.3.235])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1F03A4829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 20 Sep 2002 04:11:46 -0600 (MDT)
From: "Petr Vandrovec" <VANDROVE@vc.cvut.cz>
To: Andreas Seltenreich <s_selten@informatik.uni-karlsruhe.de>
Date: Fri, 20 Sep 2002 12:11:21 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
Message-ID: <251F50824F2@vcnet.vc.cvut.cz>
Subject: [parisc-linux] Re: partial success with matroxfb
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On 20 Sep 02 at 2:27, Andreas Seltenreich wrote:

> Bus    HPA       Module Type      Path  Slt Md Sev  Estat Requestor  Responder
> --- ---------- ---------------- -------- -- -- ---- ----- ---------- ----------
>  0  0xfff88000 I/O Adapter      8         2  0  he   0x3d 0xf2000000 0x000a1000 
>  0  0xfff8a000 I/O Adapter      10        2  2  he   0x0d 0x00000000 0x00000000 

> anotherhpmachien:~# cat /proc/iomem 
> 00000000-0fffffff : System RAM
> f2000000-f3ffffff : GSC Bus [8/]

Hi Andreas,
  boot with 'video=matrox:novga'. It looks like that Matrox responded
to the access to legacy VGA region 0xA0000-0xBFFFF. It does not happen
when CPU accesses this memory because of Matrox does not see this access
at all in such situation, because of host bridge directs it immediately 
to the system ram, without accessing PCI. But when access originated from 
some PCI busmaster, other PCI devices sees this access, and Mystique
claims it.

  And now both host bridge (for system RAM) and Mystique (for VGA region)
accepted bus cycle, and hardware went mad...

  I have no idea what second error reports, but it may be just triggered
by previous one.
                                                            Petr Vandrovec
                                                            
