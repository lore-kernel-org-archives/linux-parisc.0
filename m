From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] C3600 install
Date: Sat, 12 Jun 2004 10:31:38 -0700
Message-ID: <20040612173138.GC19250@tausq.org>
References: <22601.1087029507@www15.gmx.net>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Matej Martini <calibrator@gmx.net>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <22601.1087029507@www15.gmx.net>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Searching for devices...
> 
> ---------------------------------------------------------------------------
> 
> At this point the machine seems to hang. As mentioned above this is my first
> PARISC box. I'm not that familiar with the hppa architecture. Maybe it's
> just a silly thing I haven't noticed. So if anyone can give me a hint I
> would be glad...

This is actually a kernel problem; I also see this.... I talked to Grant
about this a bit, but we haven't reached a good conclusion. If you can
find a 2.6 based install, it should work.....

this is the bit that needs fixing, in arch/parisc/kernel/inventory.c...
with this it should boot.

-       pdc_suspend_usb();
+/*     pdc_suspend_usb(); */

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
