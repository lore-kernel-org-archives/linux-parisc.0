Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.yifansoft.com (ns1.yifansoft.com [64.61.26.50])
	by dsl2.external.hp.com (Postfix) with SMTP id 2B17C48A6
	for <parisc-linux@lists.parisc-linux.org>; Sat, 29 Jun 2002 16:08:35 -0600 (MDT)
From: "Chuck" <atkinsc@yifan.net>
To: <parisc-linux@lists.parisc-linux.org>
Subject: RE: [parisc-linux] 735 and FW SCSI
Date: Sat, 29 Jun 2002 17:08:41 -0500
Message-ID: <MDEAIMOKAJDADFOAOOJEKECMCAAA.atkinsc@yifan.net>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
In-Reply-To: <20020630012744.A16287@neep.com.au>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Well would I be able to use the current netinst iso to install onto the
FWSCSI HD?

-----Original Message-----
From: parisc-linux-admin@lists.parisc-linux.org
[mailto:parisc-linux-admin@lists.parisc-linux.org]On Behalf Of Andrew
Shugg
Sent: Saturday, June 29, 2002 12:28 PM
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 735 and FW SCSI


J. David Anglin said:
> The Outfield FW interface is differential.  Disks on this interface are
> not compatible with the suppored narrow interface.

Fast-wide differential?  I knew I was missing something.  And I've got
one of those beasts on a shelf behind me too ...  =)

Who has the power & might to update the Outfield FW entry in the hwdb
to include a note that it's differential SCSI?

Thanks for the correction, Dave.  I guess Chuck is going to have to find
some 'normal' SCSI disks, or go for the NFS-root option.

Andrew.

--
Andrew Shugg <andrew@neep.com.au>                   http://www.neep.com.au/

"Just remember, Mr Fawlty, there's always someone worse off than yourself."
"Is there?  Well I'd like to meet him.  I could do with a good laugh."

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
