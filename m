Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA06720
	for <parisc-linux@puffin.external.hp.com>; Fri, 11 Feb 2000 14:13:04 -0700
Received: by wallace.ece.rice.edu
	via sendmail from stdin
	id <m12JMKO-000LELC@wallace.ece.rice.edu> (Debian Smail3.2.0.102)
	for parisc-linux@thepuffingroup.com; Fri, 11 Feb 2000 14:06:08 -0600 (CST)
Date: Fri, 11 Feb 2000 14:06:08 -0600
From: "Ross J. Reedstrom" <reedstrm@wallace.ece.rice.edu>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] About supported machines.
Message-ID: <20000211140608.C12552@rice.edu>
References: <2.2.32.20000211010445.006aa0cc@phoenix.maintree.com> <Pine.LNX.4.10.10002111112010.20107-100000@grasshopper.thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.10.10002111112010.20107-100000@grasshopper.thepuffingroup.com>; from dkennedy@linuxcare.com on Fri, Feb 11, 2000 at 11:13:02AM -0500
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Feb 11, 2000 at 11:13:02AM -0500, dkennedy@linuxcare.com wrote:
> On Thu, 10 Feb 2000, Matthew Estes wrote:
> 
> >         I have recently acquired an Apollo 720 with HP-UX 9.03, I was
> > wondering if this machine is in the class of machines that you are either
> > supporting or plan to support. I looked in the hardware database and
> > couldn't find anything about 720's, so I thought I would ask the mailing
> > list. It is no real use to me as is, so I would be willing to do testing on
> > it. Thanks.
> 
> Since we don't currently have a 720 in the hardware database, can you
> please add your machine to the database.  If you have any problems,
> please let me know.


That'll be a problem, since step 5 of adding a machine says:


5. Run the "ioscan -F" utility on the PA-RISC machine with the command
   /usr/sbin/ioscan -F. The results may take a few moments to appear. Copy
   and paste the results (which will be a fair amount of data) into the
   "IOScan Output" field below. The IOScan output must be from HP-UX
   version 10 or later.

And Matthew has 9.03. I have the same problem with a 730 I've got: I'd add it to
the db, but it's not at 10 yet. (Purely a time issue: I've got the upgrade CDs,
but apparently I can't do a clean wipe/install since my 730 won't boot from
the CD)

Ross

-- 
Ross J. Reedstrom, Ph.D., <reedstrm@rice.edu> 
NSBRI Research Scientist/Programmer
Computer and Information Technology Institute
Rice University, 6100 S. Main St.,  Houston, TX 77005
