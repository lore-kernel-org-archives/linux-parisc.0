Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id XAA07779
	for <hppa-linux@sod.res.cmu.edu>; Wed, 17 Mar 1999 23:10:25 -0500
Received: from netscape.com (h-205-217-237-46.netscape.com [205.217.237.46])
	by burrow.puffingroup.com (8.8.7/8.8.7) with ESMTP id AAA00847
	for <hppa-linux@puffingroup.com>; Thu, 18 Mar 1999 00:15:14 -0500
Received: from tintin.mcom.com (tintin.mcom.com [205.217.233.42])
	by netscape.com (8.8.5/8.8.5) with ESMTP id UAA01008
	for <hppa-linux@puffingroup.com>; Wed, 17 Mar 1999 20:09:30 -0800 (PST)
Received: from netscape.com ([205.217.243.67]) by
          tintin.mcom.com (Netscape Messaging Server 4.03) with ESMTP id
          F8RVJW00.BKS for <hppa-linux@puffingroup.com>; Wed, 17 Mar 1999
          20:09:32 -0800
Sender: shaver@netscape.com (Mike Shaver)
Message-ID: <36F07CED.AC742994@netscape.com>
Date: Wed, 17 Mar 1999 23:11:25 -0500
From: Mike Shaver <shaver@netscape.com>
MIME-Version: 1.0
To: hppa-linux@puffingroup.com
Content-Type: text/plain; charset=us-ascii
Subject: [hppa-linux] memory layout
List-ID: <linux-parisc.vger.kernel.org>

rd.c:467: `KERNEL_DS' undeclared (first use in this function)
mmap.c:361: `TASK_UNMAPPED_BASE' undeclared (first use in this function)

It sorta begs the question: what is our memory layout going to look
like?  What goes where?  I'll pore over my PA-RISC book tonight looking
for clues, but I doubt that'll be enough.

What kind of memory layout does HP-UX use, if I might be so bold as to
ask?

Mike

-- 
305756.61 259655.94
