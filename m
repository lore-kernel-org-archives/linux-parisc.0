Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id JAA00940
	for <parisc-linux@puffin.external.hp.com>; Fri, 11 Jun 1999 09:00:58 -0600
Message-Id: <199906111500.LAA03888@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] partitioning on HPUX
To: steve@osiris.silug.org (Steven Pritchard)
Date: Fri, 11 Jun 1999 11:00:38 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: adevries@thepuffingroup.com, parisc-linux@thepuffingroup.com
In-Reply-To: <199906111354.IAA25236@osiris.silug.org> from "Steven Pritchard" at Jun 11, 99 08:54:27 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> Alex deVries said:
> > Can anyone here describe how HPUX does partitioning?  We're going to
> > have to look at this at some point for interoperability with HPUX
> > filesystems.
> 
> As I understand it, HP-UX doesn't really do partitioning.  You have a
> choice of either using a whole disk for a file system, or you can use
> the logical volume manager.  From what I've seen, most of the people
> who use LVM also use VxFS (or JFS, a journalling filesystem).  It
> would probably be easiest then to just try to support HFS (HP's
> version of UFS, I think) using a whole disk.

On hpux 9.x and later (?), partitioning was supported using Software
Disk Striping (SDS).  See sdsadmin(1M).

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
