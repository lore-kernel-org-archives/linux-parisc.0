Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id VAA05683
	for <hppa-linux@sod.res.cmu.edu>; Wed, 17 Mar 1999 21:57:44 -0500
Received: from netscape.com (h-205-217-237-46.netscape.com [205.217.237.46])
	by burrow.puffingroup.com (8.8.7/8.8.7) with ESMTP id XAA00840
	for <hppa-linux@puffingroup.com>; Wed, 17 Mar 1999 23:02:41 -0500
Received: from tintin.mcom.com (tintin.mcom.com [205.217.233.42])
	by netscape.com (8.8.5/8.8.5) with ESMTP id SAA25269
	for <hppa-linux@puffingroup.com>; Wed, 17 Mar 1999 18:56:58 -0800 (PST)
Received: from netscape.com ([205.217.243.67]) by
          tintin.mcom.com (Netscape Messaging Server 4.03) with ESMTP id
          F8RS6Z00.KKE for <hppa-linux@puffingroup.com>; Wed, 17 Mar 1999
          18:56:59 -0800
Sender: shaver@netscape.com (Mike Shaver)
Message-ID: <36F06BED.5B5D029A@netscape.com>
Date: Wed, 17 Mar 1999 21:58:53 -0500
From: Mike Shaver <shaver@netscape.com>
MIME-Version: 1.0
To: hppa-linux@puffingroup.com
Content-Type: text/plain; charset=us-ascii
Subject: [hppa-linux] new CVS layout
List-ID: <linux-parisc.vger.kernel.org>

Alex and I just restructured the CVS repository, so there's no longer an
intervening hppa-linux directory.

cvs -d :pserver:....@sod.res.cmu.edu/home/cvs/hppa co <module>
where you choose <module> from linux, egcs, binutils.

If you had large amounts of changes in your local tree, and are stressed
about losing them, mail me and I'll help you handle it all.

Mike

-- 
301248.67 255524.62
