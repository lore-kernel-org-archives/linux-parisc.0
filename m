Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: "Witvliet, Hans" <Hans.Witvliet@Alcatel.nl>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] B2000 
In-Reply-To: Message from "Witvliet, Hans" <Hans.Witvliet@Alcatel.nl>
   of "Tue, 22 Jan 2002 15:56:59 +0100." <03273D4BC7F4D511AC440008C7E6F8815420CA@nlntmail2b.ats.nld.alcatel.nl>
References: <03273D4BC7F4D511AC440008C7E6F8815420CA@nlntmail2b.ats.nld.alcatel.nl> 
Date: Tue, 22 Jan 2002 10:55:57 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020122175557.D51FF482E@dsl2.external.hp.com>
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

"Witvliet, Hans" wrote:
> LS
> Even though under "tested hardware"  it stated : B, C and J workstations 

The kernel runs those boxes.

> I noticed that there were some difficulties with the B2000 in previous
> versions
> With the latest version (0.93) I still get after booting (from internal
> cdrom-drive):

Built-in IDE cd-rom drive on BCJ-[123567]XXX is not supported.
Off and on I've been hacking on suckyio IDE support but it's still
not working.

Install from either external SCSI CD-ROM or via network.

grant
