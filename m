Return-Path: <willy@www.linux.org.uk>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk
	[195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1A0F14856
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 17 Feb 2004 07:58:10 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1At6fo-00082Z-TH; Tue, 17 Feb 2004 14:58:08 +0000
Date: Tue, 17 Feb 2004 14:58:08 +0000
From: Matthew Wilcox <willy@debian.org>
To: =?iso-8859-1?Q?Corn=E9?= Beerse <cbeerse@lycos.nl>
Subject: Re: [parisc-linux] hw db pb?
Message-ID: <20040217145808.GR31168@parcelfarce.linux.theplanet.co.uk>
References: <402A4CA5000034AF@ocpmta2.freegates.net>
	<20040216174753.GM31168@parcelfarce.linux.theplanet.co.uk>
	<04Feb17.095855cet.119065@ns.hiscom.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <04Feb17.095855cet.119065@ns.hiscom.nl>
Sender: <willy@www.linux.org.uk>
Cc: Matthew Wilcox <willy@debian.org>, parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Tue, Feb 17, 2004 at 09:30:19AM +0100, Corné Beerse wrote:
> While reading the hwdb some minutes ago, I saw the mysqld error messages. I 
> think something more is wrong.

Yep.

Feb 16 19:20:14 dsl2 kernel: Out of Memory: Killed process 25587 (mysqld).
Feb 16 19:20:14 dsl2 kernel: Out of Memory: Killed process 25591 (mysqld).
Feb 16 19:20:19 dsl2 kernel: Out of Memory: Killed process 25592 (mysqld).
Feb 16 19:20:19 dsl2 kernel: Out of Memory: Killed process 25596 (mysqld).
Feb 16 19:20:29 dsl2 kernel: Out of Memory: Killed process 1217 (mysqld).
Feb 16 19:20:29 dsl2 kernel: Out of Memory: Killed process 1219 (mysqld).
Feb 16 19:20:29 dsl2 kernel: Out of Memory: Killed process 1220 (mysqld).
Feb 16 19:20:35 dsl2 kernel: Out of Memory: Killed process 1231 (mysqld).
Feb 16 19:20:35 dsl2 kernel: Out of Memory: Killed process 1233 (mysqld).
Feb 16 19:20:35 dsl2 kernel: Out of Memory: Killed process 1233 (mysqld).
Feb 16 19:21:00 dsl2 kernel: Out of Memory: Killed process 32694 (razor-report).
Feb 16 19:41:20 dsl2 kernel: Out of Memory: Killed process 886 (razor-report).
Feb 16 20:09:07 dsl2 kernel: Out of Memory: Killed process 32691 (razor-report).
Feb 16 21:14:35 dsl2 kernel: Out of Memory: Killed process 892 (razor-report).
Feb 16 22:08:34 dsl2 kernel: Out of Memory: Killed process 2958 (razor-report).
Feb 16 22:46:43 dsl2 kernel: Out of Memory: Killed process 2957 (razor-report).
Feb 17 00:13:43 dsl2 kernel: Out of Memory: Killed process 3217 (razor-report).
Feb 17 01:51:40 dsl2 kernel: Out of Memory: Killed process 5790 (razor-report).
Feb 17 02:51:00 dsl2 kernel: Out of Memory: Killed process 7007 (razor-report).
Feb 17 04:20:59 dsl2 kernel: Out of Memory: Killed process 7011 (razor-report).
Feb 17 07:28:46 dsl2 kernel: Out of Memory: Killed process 9957 (razor-report).

Hmm.  razor-report is either the bad guy or the innocent victim here.
I'll keep an eye on this ...

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
