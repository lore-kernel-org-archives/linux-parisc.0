Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA03494
	for <parisc-linux@puffin.external.hp.com>; Tue, 19 Dec 2000 08:58:58 -0700
Received: from unknown (HELO smtp.linuxcare.com) (216.88.157.131)
  by mailserv2.iuinc.com with SMTP; 19 Dec 2000 16:01:55 -0000
Received: from ottawa.linuxcare.com (HELO linuxcare.com) (216.208.98.2)
  by smtp.linuxcare.com with SMTP; 19 Dec 2000 16:01:55 -0000
Sender: adevries@mailserv2.iuinc.com
Message-ID: <3A3F8723.F761E8@linuxcare.com>
Date: Tue, 19 Dec 2000 11:04:51 -0500
From: Alex deVries <adevries@linuxcare.com>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] 715/old boot problems...
List-ID: <linux-parisc.vger.kernel.org>


Richard Hirst has the same problem on his 715/75 as I have on my lovable
715/50. When booting up, it just hangs after "an older box...".  

I know that 715/old machines have this, 715/new apparantly don't, and
712 are safe.  Has anyone noticed any other machines hanging at this
point?

The problem seems to be in inventory.c when we're scanning the functions
with pdc_system_map, and it hangs on mod=1 in
really_do_oldhw_inventory(). It's an easy fix, but I want the fix to
only address the machines that are affected.

- Alex

-- 
Alex deVries, Principal Solutions Architect, The Puffins at Linuxcare
613.562.2759 tel
alex@linuxcare.com, http://www.linuxcare.com/
Linuxcare, Support for the revolution.
