Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id BAA14034
	for <parisc-linux@sod.res.cmu.edu>; Tue, 6 Apr 1999 01:11:32 -0400
Received: from postbox.india.hp.com (postbox.india.hp.com [15.10.45.1])
	by palrel3.hp.com (8.9.3/8.8.5tis) with ESMTP id WAA09689
	for <parisc-linux@thepuffingroup.com>; Mon, 5 Apr 1999 22:11:13 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1]) by postbox.india.hp.com with SMTP (8.7.1/8.7.1) id KAA02336 for <parisc-linux@thepuffingroup.com>; Tue, 6 Apr 1999 10:43:38 +0530 (IST)
Message-Id: <199904060513.KAA02336@postbox.india.hp.com>
To: parisc-linux@thepuffingroup.com
In-reply-to: Your message of "Mon, 05 Apr 1999 09:47:04 IST."
             <19990405094704.A29056@cmu.edu>
Date: Tue, 06 Apr 1999 10:43:36 +0530
From: A Joseph Koshy <koshy@postbox.india.hp.com>
Subject: [parisc-linux] CVSup in addition to AnonCVS
List-ID: <linux-parisc.vger.kernel.org>


Could we use CVSup to distribute the projects CVS repository?  

	- It runs a lot faster than AnonCVS.
	- As it mirrors the repository locally, subsequent operations 
	  (cvs log, cvs diff) don't need to access the 'net.
	- You can have 'local' branches in your copy of the repository.
	- It works perfectly with the existing CVS infrastructure.

URL: http://www.polstra.com/projects/freeware/CVSup/

See also:	http://www.kde.org/cvsup.html
		http://www.freebsd.org/handbook/cvsup.html

Regards,
Koshy
<koshy@india.hp.com>			My Personal Opinions Only.
