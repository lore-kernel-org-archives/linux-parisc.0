Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id UAA11309
	for <parisc-linux@puffin.external.hp.com>; Sat, 11 Mar 2000 20:36:19 -0700
From: Steven Pritchard <steve@silug.org>
Message-Id: <200003120236.UAA10891@osiris.silug.org>
Subject: Re: [parisc-linux] HP-UX application support?
In-Reply-To: <56D553C0B61BD311AD2300A0C9F485C2038D0FD0@xfc02.fc.hp.com> from
 "MEYER,ALAN C. (HP-FtCollins,ex1)" at "Feb 28, 2000 02:14:17 pm"
To: "MEYER,ALAN C. \\\(HP-FtCollins,ex1\\\)" <alan_meyer@hp.com>
Date: Sat, 11 Mar 2000 20:36:19 -0600 (CST)
CC: parisc-linux@thepuffingroup.com
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

MEYER,ALAN C. \(HP-FtCollins,ex1\) said:
> Also, I am assuming the install model will be to simply copy files from an
> HP-UX system over to a PA/Linux system.  In particular, I have heard of no
> plans to support HP-UX packages bundled in "SD" format.  Right?

The SD depot files are just tar files.  Supporting them would be
trivial.  You can always untar it, move everything to the appropriate
location, and run the scripts.  Making that automated (maybe with
alien) probably wouldn't be at all difficult...

Steve
-- 
steve@silug.org           | Linux Users of Central Illinois
(618)398-7320             | Meetings the 4th Tuesday of every month
Steven Pritchard          | http://www.luci.org/ for more info
