Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id A4F94482B
	for <parisc-linux@lists.parisc-linux.org>; Thu, 25 Oct 2001 22:47:33 -0600 (MDT)
Message-Id: <200110260443.WAA05273@puffin.external.hp.com>
To: Christian Suder <csuder@cisco.com>
Cc: dan@bigw.org, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] How to Boot CD on C110 
In-Reply-To: Message from Christian Suder <csuder@cisco.com>
   of "Thu, 25 Oct 2001 17:03:57 PDT." <Pine.LNX.4.33.0110251652370.4601-100000@ipsbu-1.cisco.com>
Date: Thu, 25 Oct 2001 22:43:39 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Christian Suder wrote:
> I assume the CD drive is a 'normal' drive (50 pin SE), not something
> exotic like a wide SCSI.

It is.
HP didn't ship IDE optical drives on parisc until C3000 workstations.
All internal CD-ROMs before were SE SCSI.

> The correct device would be core.SCSI.2.0, however it's strange that
> SEArch doesn't even see it. The ID needs to be unique across both the SE
> and the FW SCSI.

That's wrong. The ID is local to each SCSI bus.
Ie ID on SE SCSI are in a seperate address space from FWD SCSI.

grant
