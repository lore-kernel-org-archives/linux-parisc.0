Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id HAA32641
	for <parisc-linux@puffin.external.hp.com>; Fri, 11 Jun 1999 07:54:20 -0600
From: Steven Pritchard <steve@osiris.silug.org>
Message-Id: <199906111354.IAA25236@osiris.silug.org>
Subject: Re: [parisc-linux] partitioning on HPUX
In-Reply-To: <3760AA7F.9B62952E@thepuffingroup.com> from Alex deVries at "Jun 11, 99 02:19:43 am"
To: adevries@thepuffingroup.com (Alex deVries)
Date: Fri, 11 Jun 1999 08:54:27 -0500 (CDT)
Cc: parisc-linux@thepuffingroup.com
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Alex deVries said:
> Can anyone here describe how HPUX does partitioning?  We're going to
> have to look at this at some point for interoperability with HPUX
> filesystems.

As I understand it, HP-UX doesn't really do partitioning.  You have a
choice of either using a whole disk for a file system, or you can use
the logical volume manager.  From what I've seen, most of the people
who use LVM also use VxFS (or JFS, a journalling filesystem).  It
would probably be easiest then to just try to support HFS (HP's
version of UFS, I think) using a whole disk.

Steve
-- 
steve@silug.org           | Linux Users of Central Illinois
(217)698-1694             | Meetings the 4th Tuesday of every month
Steven Pritchard          | http://www.luci.org/ for more info
