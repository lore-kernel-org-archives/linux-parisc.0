Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA05891
	for <parisc-linux@puffin.external.hp.com>; Sat, 23 Dec 2000 10:42:15 -0700
Received: from unknown (HELO smtp.linuxcare.com) (216.88.157.131)
  by mailserv2.iuinc.com with SMTP; 23 Dec 2000 17:45:12 -0000
Received: from hse-ottawa-ppp156830.sympatico.ca (HELO linuxcare.com) (adevries@64.229.128.9)
  by smtp.linuxcare.com with SMTP; 23 Dec 2000 17:45:11 -0000
Sender: adevries@mailserv2.iuinc.com
Message-ID: <3A44E560.BE825C97@linuxcare.com>
Date: Sat, 23 Dec 2000 12:48:16 -0500
From: Alex deVries <adevries@linuxcare.com>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Some questions about the 715/50
List-ID: <linux-parisc.vger.kernel.org>


Here's a few choice entries from the inventory scan on my lovable
715/50:

2. Scorpio Core BA (11) at 0xf082f000, versions 0x7, 0x0, 0x70, 0x0,
0x0        
3. Scorpio Core SCSI (10) at 0xf0825000, versions 0x7, 0x0, 0x71, 0x0,
0x0      
4. Scorpio Core LAN (802.3) (10) at 0xf0826000, versions 0x7, 0x0, 0x72,
0x0, 00
5. Scorpio Core HIL (10) at 0xf0821000, versions 0x7, 0x0, 0x73, 0x0,
0x0       
6. Scorpio Core RS-232 (10) at 0xf0823000, versions 0x7, 0x0, 0x75, 0x0,
0x0    
...
9. Scorpio Audio (10) at 0xf1000000, versions 0x7, 0x0, 0x7b, 0x0,
0x0          
10. Scorpio EISA BA (11) at 0xfc000000, versions 0x7, 0x0, 0x76, 0x0,
0x0       

Scorpio's a 715/old, and has two IO chips in it: WAX and Lasi. Scorpio
Jr. (715/33) and Scorpio Sr. (715/75) are identical.

My questions:

a. The docs say that WAX's HIL on a GSC (not GSC+) is at 0xf0201000, but
the HIL reported above is clearly in the ASP range.  Is there actually a
HIL controller on ASP? More importantly, how are the interrupts routed?

b. What on earth is that sound chip at 0xf1000000? Is that Cherry?

- Alex

-- 
Alex deVries, Principal Solutions Architect, The Puffins at Linuxcare
613.562.2759 tel
alex@linuxcare.com, http://www.linuxcare.com/
Linuxcare, Support for the revolution.
