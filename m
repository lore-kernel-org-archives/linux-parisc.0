Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id XAA13643
	for <parisc-linux@puffin.external.hp.com>; Fri, 1 Oct 1999 23:07:15 -0600
Sender: adevries@thepuffingroup.com
Message-ID: <37F59616.1E51B9F0@thepuffingroup.com>
Date: Sat, 02 Oct 1999 01:20:22 -0400
From: Alex deVries <adevries@thepuffingroup.com>
MIME-Version: 1.0
To: Grant Grundler <grundler@cup.hp.com>
CC: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] linux/Makefile
References: <199910012347.QAA13637@milano.cup.hp.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Grant Grundler wrote:
> 
> FYI - Alex noticed his tree was recursively building vmlinux because
> init_task_union tests weren't working right. Turned out he was picking
> up the HP-UX "nm" instead of GNU nm.
> 


I've actually fixed this by committing a bit of code that checks to make
sure that you're using GNU nm :)

- Alex

-- 
Alex deVries
Vice President of Engineering
The Puffin Group
