Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id IAA00738
	for <parisc-linux@puffin.external.hp.com>; Fri, 11 Jun 1999 08:54:18 -0600
Message-ID: <004901beb41a$44148f20$e38f4b0f@cup.hp.com>
From: "Rich Rauenzahn" <rrauenza@cup.hp.com>
To: "Steven Pritchard" <steve@osiris.silug.org>,
        "Alex deVries" <adevries@thepuffingroup.com>
Cc: <parisc-linux@thepuffingroup.com>
References: <199906111354.IAA25236@osiris.silug.org>
Subject: Re: [parisc-linux] partitioning on HPUX
Date: Fri, 11 Jun 1999 07:54:11 -0700
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

Yes -- I agree.  Most who use LVM will be using VxFS, so just onlu
supporting whole disk HFS for now is probably the best.

> As I understand it, HP-UX doesn't really do partitioning.  You have a
> choice of either using a whole disk for a file system, or you can use
> the logical volume manager.  From what I've seen, most of the people
> who use LVM also use VxFS (or JFS, a journalling filesystem).  It
> would probably be easiest then to just try to support HFS (HP's
> version of UFS, I think) using a whole disk.
>
> Steve
> --
> steve@silug.org           | Linux Users of Central Illinois
> (217)698-1694             | Meetings the 4th Tuesday of every month
> Steven Pritchard          | http://www.luci.org/ for more info
