Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sj-msg-core-2.cisco.com (sj-msg-core-2.cisco.com [171.69.24.11])
	by dsl2.external.hp.com (Postfix) with ESMTP id 385F5482B
	for <parisc-linux@lists.parisc-linux.org>; Thu, 25 Oct 2001 23:12:00 -0600 (MDT)
Message-ID: <3BD8F081.B3F6EE8F@cisco.com>
Date: Thu, 25 Oct 2001 22:11:29 -0700
From: Christian Suder <csuder@cisco.com>
MIME-Version: 1.0
To: Grant Grundler <grundler@puffin.external.hp.com>
Cc: dan@bigw.org, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] How to Boot CD on C110
References: <200110260443.WAA05273@puffin.external.hp.com>
Content-Type: text/plain; charset=us-ascii
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

Grant Grundler wrote:

> 
> > The correct device would be core.SCSI.2.0, however it's strange that
> > SEArch doesn't even see it. The ID needs to be unique across both the SE
> > and the FW SCSI.
> 
> That's wrong. The ID is local to each SCSI bus.
> Ie ID on SE SCSI are in a seperate address space from FWD SCSI.
> 

Maybe my memory fades but I believe I tried this once and it didn't work
to my surprise.... that's why I pointed it out. 


> grant
